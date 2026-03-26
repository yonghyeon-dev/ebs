# EP01 영상 파이프라인 가이드 — ComfyUI 통합 노드 기반

> 본 문서는 Phase 3 (WI-008~012) 배경 영상 생성을 위한 실행 가이드입니다.
> ComfyUI로 정적 배경 이미지 생성 + img2video 변환까지 하나의 파이프라인으로 통합합니다.
> **이전 설계(Runway/Kling 외부 웹사이트 기반)를 ComfyUI 내장 노드 기반으로 재설계한 v2입니다.**
> **v2.1 변경: 체크포인트를 animagineXL v3.1로 전환, LoRA 완전 제거, Danbooru 태그 기반 프롬프트 사용.**
> **Kling/Runway는 ComfyUI 크레딧으로 작동하는 API 노드입니다 (외부 웹서비스 아님).**

---

## 전체 흐름 (ComfyUI 통합)

```
[ComfyUI animagineXL v3.1 배경 이미지 생성]
        |
        v (SaveImage → LoadImage / 또는 직접 IMAGE 연결)
        |
[이미지 품질 검수 + 선별]
        |
        v
[ComfyUI img2video 노드 실행]
  ├─ 단일 이미지 + 카메라 무브 → KlingCameraControlI2VNode
  ├─ 단일 이미지 + 모션 → KlingImage2VideoNode / WanImageToVideoApi
  ├─ 키프레임 보간 (시작→끝) → KlingStartEndFrameNode
  └─ 로컬 실행 (VRAM 여유 시) → WanImageToVideo (로컬)
        |
        v (SaveVideo → MP4)
        |
[클립 검수 + 재생성]
        |
        v
[편집 타임라인 배치 (DaVinci Resolve)]
```

---

## 사용 가능 노드 요약

### API 노드 (ComfyUI 크레딧 사용)

| 노드 | 입력 | 카메라 제어 | 길이 | 비용 (5s/10s) | 적합 용도 |
|------|------|-----------|------|-------------|----------|
| `KlingImage2VideoNode` | 단일 이미지 | X | 5s/10s | $0.28~$2.80 | 일반 모션 (나뭇잎, 물결) |
| `KlingCameraControlI2VNode` | 단일 이미지 + CAMERA_CONTROL | O (6축) | ~5s | $0.49 | 줌인/패닝/틸트/롤 |
| `KlingStartEndFrameNode` | 시작+끝 프레임 | X | 5s/10s | $0.35~$0.98 | 키프레임 보간 (전환 씬) |
| `RunwayImageToVideoNodeGen4` | 단일 이미지 | X | 5s/10s | $0.36~$0.72 | 고품질 모션 (스타일 유지) |
| `WanImageToVideoApi` | 이미지 + 프롬프트 | X | 5~15s | $0.25~$2.25 | 긴 클립 (15s), 1080P 지원 |

### 로컬 노드 (VRAM 사용, 무료)

| 노드 | 필요 모델 | VRAM 요구 | 해상도 | 비고 |
|------|---------|----------|--------|------|
| `WanImageToVideo` | Wan 2.1 diffusion model + VAE | ~10GB+ (480p) | 832x480 기본 | RTX 4070에서 480p만 가능 |

### 보조 노드

| 노드 | 용도 |
|------|------|
| `KlingCameraControls` | 카메라 파라미터 설정 → `KlingCameraControlI2VNode`에 연결 |
| `LoadImage` / `LoadImageOutput` | 이전 단계 이미지 로드 |
| `SaveVideo` | VIDEO → MP4 저장 (format: mp4, codec: h264) |

---

## 씬별 노드 선택 전략

### 선택 기준

1. **카메라 무브먼트가 핵심인 씬** → `KlingCameraControlI2VNode` + `KlingCameraControls`
   - 줌인/아웃, 패닝, 틸트, 롤 파라미터를 정밀 제어
2. **키프레임 A→B 보간이 필요한 씬** → `KlingStartEndFrameNode`
   - 두 장의 이미지 사이를 자연스럽게 보간
3. **일반 모션 (자연 움직임)** → `KlingImage2VideoNode` (kling-v2-5-turbo)
   - 가성비 최고 ($0.35/5s), 나뭇잎 흔들림/물결 등 자연스러운 모션
4. **스타일 충실도 최우선** → `RunwayImageToVideoNodeGen4`
   - 수채화/프리즘 스타일 변형 최소화
5. **긴 클립 (15s)** → `WanImageToVideoApi`
   - 유일하게 15s 단일 클립 지원
6. **비용 절약 / 테스트** → `WanImageToVideo` (로컬)
   - 480p에서만 실행 가능 (RTX 4070 12GB 제약)

### 씬별 노드 매핑

| 클립 ID | 서브씬 | 노드 | 모드 | 이유 |
|---------|--------|------|------|------|
| VD-0100 | 1-1 정원 전경 | `KlingCameraControlI2VNode` | zoom: -3 (줌인) | 느린 줌인이 핵심 |
| VD-0102 | 1-2 초은이 등장 | `KlingCameraControlI2VNode` | zoom: -4, pan: 1 | 줌인 + 약간 틸트업 |
| VD-0103 | 1-3 물방울 매크로 | `KlingCameraControlI2VNode` | zoom: -6 | 급속 매크로 줌인 |
| VD-0201 | 2-1 렌즈 전환 | `KlingStartEndFrameNode` | v2-5-turbo, 5s | 수채화→프리즘 키프레임 보간 |
| VD-0202 | 2-2 내부 첫 시야 | `KlingCameraControlI2VNode` | tilt: 5 (360도 패닝) | 360도 회전 패닝 |
| VD-0301 | 3-1 뭉이 등장 | `KlingStartEndFrameNode` | v2-5-turbo, 10s | 로우앵글→정면 전환 |
| VD-0302 | 3-2 프리즘 탐험 | `KlingImage2VideoNode` | v2-5-turbo, 10s | 횡이동 트래킹 (자연 모션) |
| VD-0303 | 3-3 서핑 | `KlingStartEndFrameNode` | v2-1, 10s | 서핑 시작→액션 보간 |
| VD-0401 | 4-1 위기 진동 | `KlingImage2VideoNode` | v2-1, 10s | 진동/불안정 모션 |
| VD-0402 | 4-2 할아버지 무전 | `RunwayImageToVideoNodeGen4` | 10s | 빛 파동 + 스타일 유지 |
| VD-0403 | 4-3 협력 해결 | `KlingStartEndFrameNode` | v2-5-turbo, 10s | 복원 전후 보간 |
| VD-0501 | 5-1 보석빛 이별 | `KlingCameraControlI2VNode` | tilt: 4, zoom: 3 | 360도 회전 + 줌아웃 |
| VD-0502 | 5-2 현실 복귀 | `KlingStartEndFrameNode` | v2-5-turbo, 5s | 미시→현실 전환 보간 |
| VD-0601 | 6-1 장미 티저 | `KlingCameraControlI2VNode` | zoom: -5 | 포커스 전환 매크로 줌 |

> **클립 ID 변경**: RW-xxxx (Runway 기반) → VD-xxxx (Video 통합) 로 명명 변경

---

## 워크플로우 패턴별 JSON 설계

### Pattern A: 카메라 제어 (KlingCameraControlI2VNode)

```
[LoadImage] → IMAGE
                  ↘
[KlingCameraControls] → CAMERA_CONTROL
                  ↘             ↗
           [KlingCameraControlI2VNode] → VIDEO → [SaveVideo]
```

**사용 씬**: 1-1, 1-2, 1-3, 2-2, 5-1, 6-1

**KlingCameraControls 파라미터 가이드**:

| 파라미터 | 범위 | 설명 |
|---------|------|------|
| `horizontal_movement` | -10~10 | 좌(-)/우(+) 이동 |
| `vertical_movement` | -10~10 | 하(-)/상(+) 이동 |
| `pan` | -10~10 | 하(-)/상(+) 회전 (고개 끄덕임) |
| `tilt` | -10~10 | 좌(-)/우(+) 회전 (고개 돌림) |
| `roll` | -10~10 | 반시계(-)/시계(+) 롤링 |
| `zoom` | -10~10 | 줌인(-)/줌아웃(+) |

**씬별 카메라 설정**:

| 씬 | camera_control_type | horizontal | vertical | pan | tilt | roll | zoom |
|----|-------------------|-----------|---------|-----|------|------|------|
| 1-1 | simple | 0 | 0 | 0.5 | 0 | 0 | -3 |
| 1-2 | simple | 0 | 0.5 | 1 | 0 | 0 | -4 |
| 1-3 | simple | 0 | 0 | 0.5 | 0 | 0 | -6 |
| 2-2 | simple | 0 | 0 | 0 | 5 | 0 | 0 |
| 5-1 | simple | 0 | 0 | 0 | 4 | 0 | 3 |
| 6-1 | simple | 0 | 0 | 0.5 | 0 | 0 | -5 |

### Pattern B: 키프레임 보간 (KlingStartEndFrameNode)

```
[LoadImage A] → start_frame
                          ↘
[LoadImage B] → end_frame  → [KlingStartEndFrameNode] → VIDEO → [SaveVideo]
```

**사용 씬**: 2-1, 3-1, 3-3, 4-3, 5-2

**모드별 비용/품질 가이드**:

| 모드 | 비용 (5s) | 비용 (10s) | 품질 | 권장 |
|------|----------|-----------|------|------|
| kling-v2-5-turbo | $0.35 | $0.70 | 중상 | 일반 전환 |
| kling-v2-1 | $0.49 | $0.98 | 상 | 복잡한 전환 (서핑, 위기) |
| kling-v1-6 | $0.49 | $0.98 | 중 | 대안 |

### Pattern C: 일반 모션 (KlingImage2VideoNode)

```
[LoadImage] → start_frame → [KlingImage2VideoNode] → VIDEO → [SaveVideo]
```

**사용 씬**: 3-2, 4-1

**권장 설정**:

| 파라미터 | 씬 3-2 (탐험) | 씬 4-1 (위기) |
|---------|-------------|-------------|
| model_name | kling-v2-5-turbo | kling-v2-1 |
| cfg_scale | 0.8 | 0.6 |
| mode | std | pro |
| duration | 10 | 10 |
| aspect_ratio | 16:9 | 16:9 |

### Pattern D: 스타일 충실 (RunwayImageToVideoNodeGen4)

```
[LoadImage] → start_frame → [RunwayImageToVideoNodeGen4] → VIDEO → [SaveVideo]
```

**사용 씬**: 4-2 (할아버지 무전)

**설정**:
- ratio: `1280:720` (16:9)
- duration: `10`
- seed: 고정 (재현성)

---

## RTX 4070 VRAM 12GB 제약 사항

### API 노드 (VRAM 무관)
- Kling, Runway, WanApi 노드는 서버 측 실행이므로 **로컬 VRAM 소비 없음**
- ComfyUI 크레딧만 차감
- 이미지 업로드/다운로드만 로컬 처리

### 로컬 노드 (WanImageToVideo)
- **480p (832x480)**: ~10GB VRAM 필요 → RTX 4070에서 단독 실행 시 가능
- **720p 이상**: 12GB 초과 → **불가**
- animagineXL 이미지 생성과 동시 실행 불가 → 이미지 먼저 생성/저장 후 VRAM 클리어 후 실행
- 현재는 API 노드 우선 사용 권장, 로컬은 테스트/프리뷰 용도

### VRAM 관리 워크플로우
1. animagineXL 이미지 생성 → SaveImage
2. `clear_vram` (모델 언로드)
3. LoadImage → API 영상 노드 실행 (VRAM 무관)
4. SaveVideo → MP4

---

## 비용 추정 (EP01 전체)

| 씬 | 노드 | 길이 | 클립 수 | 단가 | 소계 |
|----|------|------|--------|------|------|
| 1-1 | KlingCameraControlI2V | 5s | 1 | $0.49 | $0.49 |
| 1-2 | KlingCameraControlI2V | 5s | 1 | $0.49 | $0.49 |
| 1-3 | KlingCameraControlI2V | 5s | 1 | $0.49 | $0.49 |
| 2-1 | KlingStartEndFrame (v2-5-turbo) | 5s | 1 | $0.35 | $0.35 |
| 2-2 | KlingCameraControlI2V | 5s | 1 | $0.49 | $0.49 |
| 3-1 | KlingStartEndFrame (v2-5-turbo) | 10s | 1 | $0.70 | $0.70 |
| 3-2 | KlingI2V (v2-5-turbo) | 10s | 1 | $0.70 | $0.70 |
| 3-3 | KlingStartEndFrame (v2-1) | 10s | 1 | $0.98 | $0.98 |
| 4-1 | KlingI2V (v2-1) | 10s | 2 | $0.98 | $1.96 |
| 4-2 | RunwayGen4 | 10s | 1 | $0.72 | $0.72 |
| 4-3 | KlingStartEndFrame (v2-5-turbo) | 10s | 1 | $0.70 | $0.70 |
| 5-1 | KlingCameraControlI2V | 10s×2 | 2 | $0.49 | $0.98 |
| 5-2 | KlingStartEndFrame (v2-5-turbo) | 5s | 1 | $0.35 | $0.35 |
| 6-1 | KlingCameraControlI2V | 5s+5s | 2 | $0.49 | $0.98 |
| **합계** | | | **17 클립** | | **~$9.38** |

> 재생성 2~3회 고려 시 EP01 영상 비용: 약 **$20~30**
> 10부작 전체: 약 **$200~300** (에피소드별 씬 복잡도 차이 있음)

---

## 씬별 프롬프트 (img2video용)

### 네거티브 프롬프트 (전체 공통)

```
sudden jump cuts, flickering, strobing, frame drops,
morphing faces, melting features, distorted anatomy during motion,
text appearing, watermarks, UI overlays,
static image with no motion, slideshow effect,
jarring abrupt camera movements, nauseating shake,
color banding, compression artifacts, blocky motion,
unnatural physics, floating objects defying gravity without reason,
lip sync or talking (dialogue is added in post-production)
```

### 씬별 모션 프롬프트

| 클립 ID | 프롬프트 | 네거티브 |
|---------|---------|---------|
| VD-0100 | Slow gentle zoom into a watercolor garden after rain, leaves swaying softly in warm afternoon breeze, sparkling water droplets, maintain watercolor painting style | (공통) |
| VD-0102 | Young girl crouching near a leaf slowly raises brass magnifying glass to her eye, gentle hair movement, soft watercolor animation style | (공통) |
| VD-0103 | Extreme macro zoom into a single water drop on a green leaf, rainbow refraction intensifying inside the drop, transitioning from warm watercolor to prismatic crystalline | (공통) |
| VD-0201 | Magical transformation: watercolor style morphing into surreal prismatic crystal world, light particles dispersing, rapid scale shift from macro to micro, kaleidoscopic tunnel effect | (공통) |
| VD-0202 | Slow 360 degree panoramic rotation inside a prismatic water droplet, rainbow light refracting in all directions, crystalline pillars, floating luminous particles | (공통) |
| VD-0301 | Cute translucent tardigrade creature waddling forward on 8 stubby legs, bioluminescent glow, transitioning from low angle to frontal close-up view | (공통) |
| VD-0302 | Two small figures walking side by side through a rainbow light tunnel, floating prismatic particles, gentle tracking camera following their movement | (공통) |
| VD-0303 | Dynamic surfing on elastic water surface tension membrane, prismatic ripples spreading from movement, joyful exhilarating motion, hair flowing in wind | (공통) |
| VD-0401 | Violent vibration shaking the prismatic world, cracks appearing in crystalline structures, colors becoming unstable and desaturated, sense of danger and urgency | (공통) |
| VD-0402 | Warm golden light wave pulsing through prismatic darkness, forming holographic silhouette of elderly man, gentle ripple effect, hope amid crisis | (공통) |
| VD-0403 | Prismatic world rapidly restoring: cracks healing with rainbow light, colors returning to full vibrancy, crystalline structures reassembling, triumphant moment | (공통) |
| VD-0501 | Slow 360 degree rotation around a jewel-like water droplet, camera gradually zooming out, bioluminescent farewell glow, bittersweet emotional moment | (공통) |
| VD-0502 | Flash of white light transitioning from surreal prismatic world back to warm watercolor garden, style morphing from crystal to watercolor brush strokes | (공통) |
| VD-0601 | Camera slowly zooming from garden overview to macro close-up of a rose petal with a water droplet, shifting focus from wide to extreme close-up, hint of next adventure | (공통) |

---

## Step 1: ComfyUI 배경 이미지 생성

(기존 워크플로우 파일 목록 유지)

| WI | 씬 | 워크플로우 파일 | 출력 이미지 수 |
|----|-----|---------------|-------------|
| WI-007 | 컨셉아트 | `comfyui-conceptart-ep01.json` | 2종 |
| WI-008 | Scene 1 | `comfyui-ep01-scene01.json` | 3종 |
| WI-009 | Scene 2 | `comfyui-ep01-scene02.json` | 5종 |
| WI-010 | Scene 3 | `comfyui-ep01-scene03.json` | 5종 |
| WI-011 | Scene 4 | `comfyui-ep01-scene04.json` | 7종 |
| WI-012 | Scene 5 | `comfyui-ep01-scene05.json` | 4종 |
| WI-012 | Scene 6 | `comfyui-ep01-scene06.json` | 2종 |
| **합계** | | | **28종** |

---

## Step 2: 이미지 품질 검수

| 항목 | 기준 |
|------|------|
| 해상도 | 1920x1080 (16:9) |
| 스타일 일관성 | 현실: 수채화풍 / 미시: 프리즘 초현실 |
| 캐릭터 정확성 | 초은이 의상/소품, 뭉이 다리 8개, 할아버지 표정 |
| 색감 톤 | 현실: 따뜻한 골든아워 / 미시: 투명 블루 + 무지개 |
| 과학적 정확성 | H2O 분자 구조, 빛 굴절 스펙트럼 순서 |
| 연속성 | 키프레임 간 구도/색감 자연스러운 연결 |

---

## Step 3: ComfyUI img2video 실행

### 실행 순서 (권장)

1. 이미지를 ComfyUI input 디렉토리에 업로드 (`upload_image` MCP 또는 수동 복사)
2. VRAM 클리어 (`clear_vram`)
3. 패턴별 워크플로우 실행 (`enqueue_workflow`)
4. 완료 확인 (`get_job_status`)
5. 결과 MP4 확인 (`list_output_images`)

### 긴 씬 처리 (15~20초)

일부 씬은 10초 이상이므로 클립을 나눠 생성:
- 10s + 5s 또는 10s + 10s로 분할
- 앞 클립의 마지막 프레임을 뒤 클립의 시작 이미지로 사용
- WanImageToVideoApi는 15s 단일 클립 지원 — 분할 없이 한 번에 가능
- 연결 부분에 0.5s 크로스 디졸브 적용 (DaVinci Resolve)

---

## Step 4: 클립 품질 검수

| 항목 | 기준 |
|------|------|
| 모션 자연스러움 | 카메라 무브먼트가 부드러운지, 급작스러운 점프 없는지 |
| 스타일 유지 | 원본 이미지의 수채화/프리즘 스타일이 영상에서도 유지되는지 |
| 캐릭터 변형 | 인물/캐릭터가 모션 중 왜곡되지 않는지 |
| 색감 일관성 | 원본 이미지 색감이 영상 전체에서 유지되는지 |
| 키프레임 보간 | 시작→끝 이미지 사이 전환이 자연스러운지 |

### 재생성 기준

- 캐릭터 얼굴/몸체 변형 발생 → cfg_scale 올리기 (Kling: 0.8→0.9)
- 스타일이 사실적으로 변함 → RunwayGen4로 전환 (스타일 충실도 우수)
- 모션이 너무 적어 정지 느낌 → cfg_scale 낮추기 (더 자유로운 모션)
- 키프레임 보간 어색 → KlingStartEndFrame v2-1 pro로 업그레이드
- 색수차/밴딩 발생 → duration 짧게(5s)하고 여러 클립 연결

---

## Step 5: 편집 타임라인 배치

### 클립 연결 순서

| 순서 | 클립 ID | 씬 | 길이 | 전환 |
|------|---------|-----|------|------|
| 1 | VD-0100 | 1-1 정원 전경 | 10s | -- |
| 2 | VD-0102 | 1-2 초은이 등장 | 10s | Cross dissolve (1s) |
| 3 | VD-0103 | 1-3 물방울 클로즈업 | 10s | Match cut on magnifying glass |
| 4 | VD-0201 | 2-1 렌즈 전환 | 5s | Match cut on water drop |
| 5 | VD-0202 | 2-2 내부 첫 시야 | 5s | Light flash transition |
| 6 | VD-0301 | 3-1 뭉이 등장 | 10s | Cut |
| 7 | VD-0302 | 3-2 프리즘 탐험 | 10s | Cross dissolve (0.5s) |
| 8 | VD-0303 | 3-3 표면장력 서핑 | 10s | Action match cut |
| 9 | VD-0401 | 4-1 물방울 흔들림 | 20s | Hard cut (긴장감) |
| 10 | VD-0402 | 4-2 할아버지 무전 | 10s | Sound bridge transition |
| 11 | VD-0403 | 4-3 협력 해결 | 10s | Cross dissolve (0.5s) |
| 12 | VD-0501 | 5-1 보석빛 물방울 | 10s | Light bloom transition |
| 13 | VD-0502 | 5-2 현실 복귀 | 5s | Flash white → watercolor |
| 14 | VD-0601 | 6-1 꽃을 바라보며 | 10s | Cross dissolve (1s) |

### 전환 효과 규칙

| 전환 유형 | 적용 구간 | 이유 |
|----------|----------|------|
| 현실→미시 | Scene 1-3 → 2-1 | 급속 줌인 + 파티클 분해 + 스타일 전환 |
| 미시→현실 | Scene 5-1 → 5-2 | 화이트 플래시 + 수채화 페이드인 |
| 미시 세계 내부 | Scene 3, 4 | 크로스 디졸브 또는 매치컷 |
| 위기 장면 | Scene 4-1 진입 | 하드컷 (긴장감 유지) |
| 현실 세계 내부 | Scene 1, 5-2, 6 | 크로스 디졸브 |

### 총 영상 길이 계산

- 원본 클립 합계: 약 145초 (2분 25초)
- 전환 오버랩: 약 -8초
- 후반 편집 트림: 약 -5초
- **최종 예상**: 약 132초 (2분 12초)
- 3분 채우기: 오프닝 타이틀(10초) + 나레이션 인서트(20초) + 엔딩 크레딧(15초) 후반 편집 추가

---

## 트러블슈팅

### ComfyUI 배경 생성 문제

| 증상 | 해결 |
|------|------|
| 미시 세계 색감 탁함 | 프롬프트에 `prismatic, iridescent, crystal, rainbow` 태그 강화 + CFG 0.5 올리기 |
| 수채화 톤 과하게 뭉개짐 | `watercolor (medium)` 태그 제거 또는 CFG 0.5 낮추기 |
| 캐릭터 위치 불안정 | ControlNet OpenPose로 포즈 가이드 추가 |
| 물방울 내부 공간감 부족 | ControlNet Depth로 구형 깊이감 추가 |
| 해상도 VRAM 초과 | 1920x1080 대신 1536x864 생성 후 업스케일 |

### img2video 노드 문제

| 증상 | 해결 |
|------|------|
| Kling 스타일 변형 심함 | cfg_scale 올리기 (0.8→0.9), 원본 충실도 증가 |
| Kling 모션 부족 | cfg_scale 낮추기 (0.8→0.5), 더 자유로운 모션 |
| Runway 해상도 제한 | Gen4는 1280:720만 지원, Gen3a는 1280:768 |
| 카메라 제어가 과하게 적용됨 | KlingCameraControls 파라미터 절대값 줄이기 (5→2) |
| 키프레임 보간 부자연스러움 | v2-5-turbo → v2-1 pro로 업그레이드 |
| API 타임아웃 | API 노드는 서버 큐 대기, 장시간 소요 가능 (5~15분) |
| WanImageToVideo 로컬 OOM | 480p로 낮추거나 WanImageToVideoApi 전환 |

---

## 씬별 스타일 프롬프트 참조 (animagineXL v3.1)

> **v2.1**: LoRA 완전 제거. 스타일 제어는 Danbooru 태그 프롬프트로 수행.
> 체크포인트: `animagineXL31_v31.safetensors` (단일 체크포인트, LoRA 없음)

| 씬 | 세계관 | 핵심 스타일 태그 |
|----|--------|-----------------|
| 1-1, 1-2 | 현실 | `watercolor (medium), illustration, warm colors, hand-painted texture, soft brush strokes` |
| 1-3 | 현실→전환 | `watercolor (medium), macro, close-up, light refraction` |
| 2-1A | 현실 시작 | `watercolor (medium), warm colors` (중립 시작) |
| 2-1B | 전환 중간 | `watercolor (medium)` → `prismatic, iridescent` 혼합 |
| 2-1C | 미시 도착 | `fantasy, surreal, prismatic, iridescent, crystal, transparent, rainbow` |
| 2-2, 3-1~3-3 | 미시 | `fantasy, surreal, prismatic, iridescent, crystal, transparent, rainbow` |
| 4-1 | 미시 위기 | `prismatic, iridescent` + `color shift warm prismatic to anxious blue-violet` |
| 4-2 | 미시 무전 | `prismatic, iridescent` + `warm guiding light, golden sound-light waves` |
| 4-3 | 미시 복원 | `prismatic, iridescent, crystal, transparent, rainbow` + `triumphant, restoration` |
| 5-1 | 미시 최고조 | `prismatic, iridescent, crystal, transparent, rainbow` + `jewel-like, diamond-like brilliance` |
| 5-2 | 현실 복귀 | `watercolor (medium), illustration, warm colors` (현실 스타일 복귀) |
| 6-1A | 현실 | `watercolor (medium), illustration, warm colors` |
| 6-1B | 현실→전환 | `macro, close-up` + `hint of surreal prismatic light` |

---

## 씬별 KSampler 파라미터 참조 (animagineXL v3.1)

> **v2.1**: animagineXL v3.1 최적 범위 — CFG 5.0~7.0, Sampler euler 또는 dpmpp_2m

| 씬 | Steps | CFG | Sampler | Scheduler | 비고 |
|----|-------|-----|---------|-----------|------|
| 1-1 | 30 | 6.5 | dpmpp_2m | karras | 정원 배경 |
| 1-2 | 30 | 6.5 | euler | normal | 캐릭터 포함 (IP-Adapter) |
| 1-3 | 35 | 7.0 | dpmpp_2m | karras | 매크로 디테일 |
| 2-1A,B | 30 | 6.0 | euler | normal | 전환 키프레임 |
| 2-1C | 35 | 7.0 | dpmpp_2m | karras | 프리즘 세계 진입 |
| 2-2 | 35 | 7.0 | dpmpp_2m | karras | 내부 파노라마 |
| 3-1 | 35 | 7.0 | dpmpp_2m | karras | 캐릭터 등장 |
| 3-2 | 30 | 6.5 | dpmpp_2m | karras | 트래킹 배경 |
| 3-3 | 30 | 6.5 | dpmpp_2m | karras | 액션 씬 |
| 4-1 | 30 | 6.0 | euler | normal | 위기 불안정 (낮은 CFG) |
| 4-2 | 30 | 6.5 | dpmpp_2m | karras | 무전 씬 |
| 4-3 | 35 | 6.5 | dpmpp_2m | karras | 복원 씬 |
| 5-1 | 35 | 7.0 | dpmpp_2m | karras | 최고 품질 |
| 5-2 | 30 | 6.5 | euler | normal | 현실 복귀 (IP-Adapter) |
| 6-1A | 30 | 6.5 | euler | normal | 수채화 (IP-Adapter) |
| 6-1B | 35 | 7.0 | dpmpp_2m | karras | 매크로 디테일 |
