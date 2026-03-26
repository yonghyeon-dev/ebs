# 마이크로 보이저 — 캐릭터 스타일가이드

> 본 문서는 마이크로 보이저 시리즈 전체에 걸쳐 캐릭터 비주얼 일관성을 유지하기 위한 스타일 규칙을 정의한다.
> 작품소개서 p.8 비주얼 디렉션 기준. 모든 ComfyUI 생성 작업 시 본 가이드를 참조해야 한다.

---

## 1. 비주얼 철학

**"현실에서 보이지 않는 것을, AI의 눈으로 보여준다."**

마이크로 보이저의 비주얼은 두 개의 레이어로 구성된다.

| 레이어 | 스타일 | 역할 |
|--------|--------|------|
| 현실 세계 | 따뜻한 수채화풍 | 친근함과 안정감. 아이 시청자가 편안하게 몰입 |
| 미시 세계 | AI 초현실 프리즘 | 경이로움과 과학적 아름다움. "AI가 아니면 만들 수 없는" 비주얼 |

두 레이어 사이의 전환은 작품의 핵심 연출이며, 스타일 자체가 변화하는 것으로 관객에게 스케일 전환을 체감시킨다.

---

## 2. 현실 세계 스타일 정의

### 2.1 톤과 분위기

- **기본 톤**: 따뜻한 수채화 느낌. 골든아워의 부드러운 빛이 감도는 분위기
- **감정 키**: 편안함, 호기심, 일상의 소중함
- **참조 레퍼런스**: 스튜디오 지브리(이웃집 토토로, 벼랑 위의 포뇨)의 배경 미술 톤

### 2.2 색감 범위

- **주도 색온도**: 웜톤 (5000K~5500K 느낌)
- **채도**: 중간~낮음. 파스텔 계열. 과포화 금지
- **명도**: 밝고 투명한 느낌. 수채화 특유의 빛 투과감
- **금지**: 네온, 형광색, 완전한 검정(#000000), 과포화 원색

### 2.3 선과 형태

- **선 두께**: 외곽선 없음 ~ 매우 얇은 연필선(0.5~1pt). 색연필 느낌의 부드러운 선
- **형태**: 유기적이고 둥글둥글한 형태. 날카로운 직선/기하학적 형태 최소화
- **캐릭터 비율**: 아동 애니메이션 비율 (머리:몸 = 1:3~1:4). 귀엽고 친근한 프로포션

### 2.4 질감 키워드

```
hand-painted texture, soft brush strokes, watercolor bleed edges,
paper grain texture, wet-on-wet watercolor technique,
gentle color bleeding at borders, transparent color layering,
visible brush direction, soft edge diffusion
```

### 2.5 조명

- **기본 조명**: 부드러운 자연광 (확산광). 강한 직사광선이나 인공조명 사용 금지
- **그림자**: 부드러운 색상 그림자 (회색이 아닌, 보색 계열의 투명한 그림자)
- **하이라이트**: 수채화 특유의 흰 여백(종이 색)으로 표현

---

## 3. 미시 세계 스타일 정의

### 3.1 톤과 분위기

- **기본 톤**: 초현실적 신비로움. 실제 현미경 이미지를 AI가 예술적으로 해석한 느낌
- **감정 키**: 경이, 탐험, 과학적 아름다움
- **참조 레퍼런스**: 실제 전자현미경 SEM 이미지 + 제임스 웹 우주망원경 사진의 색감 처리

### 3.2 발광 효과

- **바이오루미네선스**: 생물체에서 나오는 자체 발광. 물 분자, 미생물에 적용
- **프리즘 글로우**: 빛의 굴절로 생기는 무지개빛 후광
- **발광 강도**: 과하지 않게. 어둠 속의 은은한 빛이 아닌, 밝은 환경에서의 보조 발광
- **발광 키워드**: `bioluminescent glow, soft inner light, ethereal luminescence, light emanating from within`

### 3.3 투명도

- **물방울/세포**: 80~90% 투명도. 내부 구조가 비쳐 보이는 정도
- **생물체(뭉이 등)**: 60~70% 투명도. 내부 장기가 은은하게 비침
- **분자 구조**: 반투명 구체로 시각화 (유리구슬 느낌)
- **투명도 키워드**: `crystal clear, translucent, see-through, glass-like transparency, semi-transparent membrane`

### 3.4 프리즘 효과

- **색수차(Chromatic Aberration)**: 물체 가장자리에 무지개색 번짐
- **코스틱(Caustics)**: 투명 물체를 통과한 빛이 만드는 무늬
- **전반사(Total Internal Reflection)**: 물방울 내부 벽면의 거울 효과
- **스펙트럼 분리**: 백색광이 프리즘을 통과해 7색으로 분리되는 효과
- **프리즘 키워드**: `prismatic light refraction, rainbow caustics, chromatic aberration, light spectrum dispersion, iridescent shimmer, holographic surface`

### 3.5 질감 키워드

```
surreal microscopic world, scientific illustration meets fantasy,
crystalline structures, molecular lattice, organic cellular patterns,
wet glass surface, refractive index visualization,
nano-scale texture detail, electron microscope aesthetic with artistic interpretation,
volumetric light scattering, subsurface scattering on translucent bodies
```

### 3.6 조명

- **기본 조명**: 다방향 확산광 + 물체 내부 자체 발광. 단일 광원 금지
- **체적 조명(Volumetric Lighting)**: 빛이 매질을 통과하며 보이는 광선
- **코스틱 조명**: 투명 물체 뒤에 형성되는 집중된 빛 패턴
- **색온도**: 에피소드별 주도 색감에 따라 조정 (color-palette.md 참조)

---

## 4. 캐릭터별 스타일 규칙

### 4.1 박초은 (초은이)

**기본 정보**: 7세 한국인 소녀. 호기심이 많고 활발함. 트레이드마크는 목에 건 황동 돋보기와 파스텔 민트 탐험 조끼.

**현실 세계 스타일**:
- 수채화 피부톤: 따뜻한 피치 계열, 장밋빛 볼
- 선 처리: 부드러운 색연필 느낌, 외곽선 최소화
- 눈: 크고 반짝이는 눈. 동공에 하이라이트 2점 (호기심 표현)
- 머리카락: 검은 단발, 오른쪽에 하늘색 구슬로 묶은 작은 땋은 머리 (식별 포인트)
- 의상: 파스텔 민트 탐험 조끼 + 크림색 긴팔 셔츠 + 카키 반바지(큰 주머니 달린) + 양말 짝짝이(줄무늬 파랑+점무늬 초록) + 낡은 갈색 끈 부츠 (고정). 에피소드별 변형 없음
- 소품: 황동 돋보기 (가죽 끈으로 목에 걸림, 앤틱 느낌, 렌즈에 빛 반사)
- 표정 핵심: "눈이 반짝이는 호기심" (살짝 벌린 입, 크게 뜬 눈)

**미시 세계 스타일**:
- 기본 실루엣과 의상 동일하되, 프리즘 환경광이 의상과 피부에 반사
- 조끼 표면에 무지개빛 빛 입자 반사 오버레이 (환경 반사)
- 눈의 하이라이트가 프리즘 색으로 변화 (무지개빛 반짝임)
- 피부에 미세한 투과광 효과 (서브서피스 스캐터링)
- 황동 돋보기가 포착된 빛으로 은은하게 발광
- 구슬 땋은머리의 하늘색 구슬이 프리즘 환경에서 무지개빛으로 반사

**포즈 가이드**:
- 기본 포즈: 돋보기를 눈 앞에 들고 들여다보는 자세
- 이동 포즈: 뛰어다니거나 걸어다니며 주변을 탐색
- 감정 포즈: 놀람(양손 벌림), 기쁨(두 팔 위로), 집중(앞으로 몸 기울임)

### 4.2 할아버지 (박 박사)

**기본 정보**: 은퇴한 과학자. 마이크로 렌즈 발명가. 인자하고 지혜로운 이미지.

**현실 세계 스타일**:
- 수채화 피부톤: 따뜻한 밀색, 잔주름은 부드러운 선으로 표현, 손등에 세월의 혈관 표현
- 체형: 키가 크고 약간 구부정한 자세 (현미경 앞에서 평생을 보낸 학자 느낌)
- 머리카락: 은백색, 윗머리는 빈약하나 옆머리는 민들레 홀씨처럼 솜털 같은 풍성함
- 안경: 둥근 은색 와이어 프레임, 넓은 코 위에 낮게 걸침. 렌즈에 빛 반사
- 의상: 낡은 카멜 브라운 코르듀로이 카디건(팔꿈치 가죽 패치) + 빛바랜 체크 플란넬 셔츠 + 진한 갈색 울 바지 + 갈색 가죽 실내화 (연구실 캐주얼)
- 소품: 마이크로 렌즈(황동 고글 형태 + 수정체 프리즘 렌즈, 이마에 올리거나 목에 걸림), 레트로 무전기(올리브 그린+황동, 짧은 안테나, 카디건 주머니에 클립), 호주머니에 각종 도구
- 표정 핵심: 인자한 미소, 지혜로운 눈빛, 눈꺼풀이 거의 닫힐 듯한 초승달 미소

**미시 세계에서의 등장 방식**:
- 직접 등장하지 않음 (현실 세계에서만 물리적 등장)
- 무전기 음성 → 미시 세계에서 빛의 파동으로 시각화
- 물방울 표면에 얼굴이 왜곡되어 반사되는 연출
- 목소리가 빛 물결로 표현될 때, 할아버지의 따뜻한 톤 색감 (#F5DEB3, #CD853F) 사용

### 4.3 뭉이 (물곰/타디그레이드)

**기본 정보**: 미시 세계의 물곰(타디그레이드). 초은이의 미시 세계 가이드이자 친구.

**미시 세계 스타일 (전용)**:
- 체형: 실제 타디그레이드 기반의 배럴(통) 형태 유지. 둥글고 통통한 반투명 몸체. 과도한 의인화 지양 — "cute anime mascot" 탈피, 실제 물곰의 체형 존중
- 다리: 8개 짧고 뭉툭한 다리, 4쌍 대칭 배치. 각 다리 끝에 둥근 투명 발톱. 뒤뚱뒤뚱 교차 보행
- 투명도: 60~70%. 반투명 피부를 통해 내부가 은은하게 빛나는 '살아있는 보석' 컨셉
- 피부 표면: 비누방울 같은 프리즘 무지개빛(이리데선스)이 체표면에 감돌며 물방울 세계관과 시각적 통일
- 눈: 몸체 대비 매우 큰 원형 눈. 검은 동공 + 큰 하이라이트 (캐릭터성 핵심). 프리즘 세계를 반사하는 작은 스파클
- 입: 작고 둥근 입. 코 없음 → 단순하지만 표정이 풍부한 디자인
- 머리/목: 부드럽게 몸체와 연결, 별도의 목 구분 없음
- 표정: 기본 느긋하고 평화로운 표정 (입꼬리가 약간 올라간 영구적 미소). 위험 시 눈이 커지며 놀란 표정
- 움직임 특성: 뒤뚱뒤뚱 걷기, 몸체가 젤리처럼 탄력 있게 흔들림, 걸을 때마다 프리즘 빛이 물결침
- 발광: 몸체 가장자리에 은은한 바이오루미네선스 (외곽선 대체). 감정 고조 시 내부 발광 강화

**캐릭터 표면 질감**:
```
cute tardigrade character, translucent jelly-like round body,
8 stubby short legs, big friendly cartoon eyes with large highlights,
soft bioluminescent glow around body edges, pastel internal organs faintly visible,
squishy bouncy body physics, microscopic water bear,
subsurface scattering on translucent skin, iridescent body surface
```

---

## 5. 스타일 전환 규칙 (현실 <-> 미시)

### 5.1 현실 -> 미시 전환

**전환 트리거**: 초은이가 마이크로 렌즈를 장착하는 순간

**전환 시퀀스 (3단계)**:
1. **분해 단계**: 수채화풍 캐릭터의 몸체가 빛 입자로 분해됨
   - 수채화 브러시 스트로크가 조각나며 기하학적 빛 결정으로 변환
   - 따뜻한 금색 파티클에서 시작 → 무지개 스펙트럼 파티클로 변화
2. **축소 단계**: 급속 줌인 + 화면 회전. 스케일이 매크로→마이크로로 변환
   - 수채화 배경이 점점 흐려지며 프리즘 환경으로 대체
   - 칼레이도스코프 터널 효과
3. **도착 단계**: 미시 세계의 초현실 환경이 완전히 자리잡음
   - 프리즘 빛이 사방에서 굴절
   - 캐릭터에 환경 반사광 적용

**전환 색감 흐름**: 웜톤(금색, 파스텔) → 중립(백색 빛) → 쿨톤(프리즘, 스펙트럼)

### 5.2 미시 -> 현실 복귀

**복귀 시퀀스**: 전환의 역순이되, 더 부드럽고 점진적
1. 프리즘 빛이 서서히 따뜻한 톤으로 수렴
2. 미시 세계 배경이 수채화 번짐으로 녹아내림
3. 초은이가 현실 세계에서 돋보기를 들고 서있는 모습으로 컷

**복귀 색감 흐름**: 쿨톤(프리즘) → 중립(백색 빛) → 웜톤(골든아워 수채화)

---

## 6. 금지 스타일 목록

### 6.1 AI 아티팩트 — 반드시 네거티브 프롬프트에 포함

| 아티팩트 | 네거티브 키워드 |
|----------|----------------|
| 손가락 기형 | `extra fingers, mutated hands, fused fingers, too many fingers` |
| 얼굴 비대칭 | `asymmetric face, deformed face, disfigured` |
| 눈 이상 | `cross-eyed, wrong eye direction, uneven eyes, extra eyes` |
| 신체 비율 오류 | `bad anatomy, bad proportions, extra limbs, missing limbs` |
| 텍스트 생성 | `text, watermark, signature, logo, UI elements, subtitles` |
| 이미지 품질 | `low quality, blurry, pixelated, jpeg artifacts, noise, grainy` |
| 해상도 오류 | `low resolution, thumbnail, cropped awkwardly` |

### 6.2 부적절한 스타일 키워드 — 프롬프트에서 절대 사용 금지

| 금지 키워드 | 이유 |
|------------|------|
| `photorealistic, hyperrealistic` | 아동 캐릭터의 포토리얼리즘은 uncanny valley 유발 |
| `3D render, CGI, Pixar style` | 수채화/초현실 톤과 충돌 |
| `horror, scary, dark, gothic` | 아동 대상 콘텐츠에 부적절 |
| `sexy, mature, adult` | 아동 캐릭터에 절대 사용 금지 |
| `violence, blood, weapon` | 아동 콘텐츠 안전 기준 위반 |
| `anime screencap, manga panel` | 일본 애니메이션 스타일과 구분 필요 |
| `flat 2D, clipart` | 비주얼 품질 저하 |
| `neon, cyberpunk` | 현실 세계 톤과 충돌 (미시 세계에서도 네온은 특정 에피소드만 허용) |

### 6.3 스타일 충돌 방지 규칙

- 현실 세계 씬에 미시 세계 키워드(`prismatic, bioluminescent, microscopic`) 사용 금지
- 미시 세계 씬에 현실 세계 키워드(`watercolor, hand-painted, paper texture`) 사용 금지
- 전환 씬에서만 양쪽 키워드 혼합 허용 (전환 프리픽스 사용)
- 에피소드별 색감 톤 교차 사용 금지 (예: 1화에 6화의 네온 그린 사용 금지)

---

## 7. LoRA 학습 가이드라인

### 7.1 공통 설정 (SDXL 기반)

| 파라미터 | 권장값 | 비고 |
|----------|--------|------|
| 베이스 모델 | animagineXL v3.1 (SDXL 기반) | 1024x1024 기본 해상도 |
| 네트워크 타입 | LoRA (Low-Rank Adaptation) | LyCORIS보다 호환성 우선 |
| Network Dim (Rank) | 32 | 캐릭터 디테일 유지에 충분 |
| Network Alpha | 16 | Dim의 절반 (안정적 학습) |
| Learning Rate | 1e-4 (U-Net) / 5e-5 (Text Encoder) | 과적합 방지 |
| Optimizer | AdamW8bit | 메모리 효율적 |
| Scheduler | cosine_with_restarts | 수렴 안정성 |
| Mixed Precision | fp16 | VRAM 절약 |
| Clip Skip | 2 | SDXL 표준 |
| Resolution | 1024 x 1024 | 학습/추론 동일 |

### 7.2 캐릭터별 LoRA 학습 전략

#### 초은이 (Choeun Character LoRA)

| 항목 | 요건 |
|------|------|
| 학습 이미지 수 | 최소 20장, 권장 30~40장 |
| 필수 포즈 | 정면, 좌45도, 우45도, 후면, 전신, 상반신, 얼굴 클로즈업 |
| 필수 표정 | 기본(호기심), 기쁨, 놀람, 집중, 웃음 |
| 태그 규칙 | `1girl, choeun_girl, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, dark brown eyes, green vest, cream shirt, khaki shorts, cargo shorts, mismatched socks, brown boots, magnifying glass, brass, leather cord` |
| 정규화 이미지 | 수채화 스타일 다른 아동 캐릭터 20장 |
| 학습 에폭 | 25 |
| 추론 가중치 | 0.7~0.8 (현실 세계) / 0.6~0.7 (미시 세계, 환경 반사 허용) |

#### 할아버지 (Grandpa Character LoRA)

| 항목 | 요건 |
|------|------|
| 학습 이미지 수 | 최소 15장, 권장 20~25장 |
| 필수 포즈 | 정면, 좌45도, 우45도, 전신, 상반신, 얼굴 클로즈업 |
| 필수 표정 | 기본(인자한 미소), 걱정, 설명하는 표정, 웃음 |
| 태그 규칙 | `1boy, grandpa_scientist, elderly, 68yo, korean, silver hair, white hair, fluffy side hair, round glasses, wire-rimmed glasses, brown cardigan, corduroy, elbow patches, plaid shirt, flannel shirt, walkie-talkie, brass goggles` |
| 정규화 이미지 | 수채화 스타일 노인 캐릭터 15장 |
| 학습 에폭 | 20 |
| 추론 가중치 | 0.7~0.8 (현실 세계 전용) |

#### 뭉이 (Mungyi Character LoRA)

| 항목 | 요건 |
|------|------|
| 학습 이미지 수 | 최소 20장, 권장 30~40장 |
| 필수 포즈 | 정면, 좌45도, 우45도, 걷기, 기쁨(발 올림), 놀람 |
| 배경 처리 | 투명 배경 또는 단색 배경 (투명체 특성상 배경 분리 주의) |
| 태그 규칙 | `mungyi_tardigrade, no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body, translucent, semi-transparent, 8 legs, four pairs of legs, large eyes, bioluminescent` |
| 정규화 이미지 | 초현실 스타일 귀여운 미생물 캐릭터 20장 |
| 학습 에폭 | 25~30 (투명체 질감 학습에 더 많은 에폭 필요) |
| 추론 가중치 | 0.8~0.9 (미시 세계 전용) |

#### 수채화 스타일 (animagineXL 내장)

animagineXL v3.1은 `watercolor (medium)` 태그만으로 수채화 스타일 생성이 가능하므로, 별도 수채화 LoRA가 불필요하다. 미시 세계 스타일은 `fantasy, surreal, prismatic, iridescent` 태그 조합으로 표현한다.

### 7.3 LoRA 품질 검증 체크리스트

- [ ] 캐릭터 얼굴이 10회 생성 중 8회 이상 동일 인물로 인식 가능한가
- [ ] 다양한 포즈에서 의상/소품 색상이 팔레트와 일치하는가
- [ ] 과적합 징후 없는가 (배경이 학습 데이터의 배경으로 고정되지 않는가)
- [ ] 다른 LoRA와 동시 사용 시 충돌 없는가 (캐릭터+스타일 조합)
- [ ] 프롬프트의 표정/포즈 지시에 적절히 반응하는가

---

## 8. ComfyUI 프롬프트 템플릿

### 8.1 현실 세계 프리픽스 (Positive)

모든 현실 세계 씬의 프롬프트 시작부에 붙인다. (animagineXL Danbooru 태그 기반)

```
masterpiece, best quality, absurdres, highres,
watercolor (medium), illustration, warm colors, soft lighting,
children's book illustration,
```

### 8.2 현실 세계 서픽스 (Positive)

모든 현실 세계 씬의 프롬프트 끝부분에 붙인다.

```
, soft shading, soft ambient lighting, color bleeding,
paper texture, pastel colors, cozy atmosphere,
transparent coloring, 16:9 aspect ratio
```

### 8.3 현실 세계 네거티브 프롬프트 (고정)

```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits,
worst quality, low quality, normal quality, jpeg artifacts,
signature, watermark, username, blurry,
3d, photorealistic, neon colors, dark atmosphere, horror,
monochrome, flat lighting
```

### 8.4 미시 세계 프리픽스 (Positive)

모든 미시 세계 씬의 프롬프트 시작부에 붙인다. (animagineXL Danbooru 태그 기반)

```
masterpiece, best quality, absurdres, highres,
fantasy, surreal, prismatic, iridescent, transparent, crystal,
bioluminescent, microscopic world,
```

### 8.5 미시 세계 서픽스 (Positive)

모든 미시 세계 씬의 프롬프트 끝부분에 붙인다.

```
, volumetric lighting, chromatic aberration, rainbow, caustics,
ethereal, dreamlike atmosphere, microscopic scale,
subsurface scattering, light refraction,
16:9 aspect ratio
```

### 8.6 미시 세계 네거티브 프롬프트 (고정)

```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits,
worst quality, low quality, normal quality, jpeg artifacts,
signature, watermark, username, blurry,
watercolor (medium), paper texture, photorealistic,
dark atmosphere, horror, monochrome, desaturated, flat coloring
```

### 8.7 전환 씬 프리픽스 (Positive)

현실->미시 전환 시퀀스 전용. (animagineXL Danbooru 태그 기반)

```
masterpiece, best quality, absurdres, highres,
magical transformation, style change, particle effects, dissolving into light,
kaleidoscope, scale shift, macro to micro,
```

### 8.8 전환 씬 네거티브 프롬프트 (고정)

```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits,
worst quality, low quality, normal quality, jpeg artifacts,
signature, watermark, username, blurry,
static, horror, body horror, dark atmosphere, gothic,
flat coloring, monochrome
```

### 8.9 캐릭터별 프롬프트 삽입구

프리픽스 뒤, 씬 설명 앞에 캐릭터 키워드 블록을 삽입한다.

**초은이 (현실 세계)**:
```
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie,
dark brown eyes, round face, chubby cheeks, blush, small nose,
green vest, cream shirt, long sleeves, khaki shorts, cargo shorts,
mismatched socks, brown boots, lace-up boots,
magnifying glass, brass, leather cord, neck strap,
curious, sparkling eyes,
```

**초은이 (미시 세계)**:
```
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie,
dark brown eyes, round face, chubby cheeks,
green vest, cream shirt, khaki shorts, mismatched socks, brown boots,
magnifying glass, brass, leather cord, glowing,
miniaturized, prismatic, iridescent, rainbow reflection,
```

**할아버지 (현실 세계 전용)**:
```
1boy, solo, elderly, 68yo, korean, old man, grandfather, scientist,
silver hair, white hair, fluffy side hair, round glasses, wire-rimmed glasses,
smile lines, crow's feet, wrinkles, bushy eyebrows, silver eyebrows,
brown cardigan, corduroy, elbow patches, plaid shirt, flannel shirt,
walkie-talkie, clipped to pocket,
warm smile, kind eyes,
```

**뭉이 (미시 세계 전용)**:
```
no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body,
translucent, semi-transparent, bioluminescent, internal glow,
8 legs, four pairs of legs, stubby legs,
large eyes, round eyes, friendly eyes, gentle smile,
iridescent skin, prismatic, rainbow light,
```

---

## 9. IP-Adapter 설정 가이드

캐릭터 일관성 유지를 위한 IP-Adapter 설정.

### 9.1 기본 설정

| 파라미터 | 권장값 | 비고 |
|----------|--------|------|
| IP-Adapter 모델 | ip-adapter-plus-face_sdxl_vit-h | 얼굴 일관성 특화 |
| Weight | 0.5~0.7 | 너무 높으면 포즈/표정 자유도 감소 |
| Noise | 0.0 | 레퍼런스 이미지 충실 반영 |

### 9.2 캐릭터별 설정

**초은이**:
- IP-Adapter weight: 0.6 (현실), 0.5 (미시 — 환경 반사 허용)
- 레퍼런스 이미지: 정면 클로즈업 1장 (기본 표정)
- LoRA와 병용: IP-Adapter(얼굴) + LoRA(의상/전체) 조합

**할아버지**:
- IP-Adapter weight: 0.6 (현실 세계 전용)
- 레퍼런스 이미지: 정면 클로즈업 1장

**뭉이**:
- IP-Adapter 미사용 (비인간 캐릭터). LoRA만으로 일관성 유지
- 대안: ControlNet Depth로 체형 가이드

---

## 10. 에피소드별 비주얼 적용 요약

각 에피소드의 미시 세계 비주얼 톤은 color-palette.md에 정의된 색감을 따른다. 여기서는 스타일 적용 규칙만 요약한다.

| 에피소드 | 미시 세계 추가 키워드 | 설정 |
|----------|---------------------|------|
| 1화 물방울 속 우주 | `prismatic refraction, transparent sphere interior, light spectrum` | CFG 6.5, Steps 30 |
| 2화 꽃잎 위의 별빛 | `velvet petal texture, pollen particles, organic micro-surface` | CFG 6.0, Steps 30 |
| 3화 나비 날개의 비밀 | `nano structural color, scale patterns, diffraction grating` | CFG 6.5, Steps 30 |
| 4화 흙 속 지하도시 | `soil particles, mycelium network, underground cavern` | CFG 6.0, Steps 30 |
| 5화 눈 결정 미로 | `hexagonal crystal lattice, ice prism, symmetric fractal` | CFG 6.5, Steps 30 |
| 6화 산호 왕국의 밤 | `fluorescent marine life, bioluminescence, deep sea glow` | CFG 7.0, Steps 35 |
| 7화 과일 속 세포 마을 | `cell wall, chloroplast, vacuole, organic cellular` | CFG 6.0, Steps 30 |
| 8화 나뭇잎 혈관 탐험 | `leaf vein network, water channels, transmitted light` | CFG 6.0, Steps 30 |
| 9화 거미줄 다리 | `silk fiber, dew drops, geometric web structure` | CFG 6.0, Steps 30 |
| 10화 빗방울 대모험 | `cloud vapor, raindrop descent, earth impact splash` | CFG 6.0, Steps 30 |

---

## 부록 A: 생성 파라미터 빠른 참조

### SDXL 기본 설정 (모든 씬 공통)

| 파라미터 | 현실 세계 | 미시 세계 | 전환 씬 |
|----------|----------|----------|---------|
| Checkpoint | animagineXL31_v31.safetensors | animagineXL31_v31.safetensors | animagineXL31_v31.safetensors |
| Resolution | 1920x1080 | 1920x1080 | 1920x1080 |
| CFG Scale | 5.0~6.0 | 6.0~7.0 | 6.0 |
| Sampler | euler normal | dpmpp_2m karras | dpmpp_2m karras |
| Steps | 25~30 | 28~35 | 30 |
| Clip Skip | 2 | 2 | 2 |
| 스타일 LoRA | 없음 (animagine 자체 스타일) | 없음 | 없음 |
| ControlNet | OpenPose (캐릭터) | Depth (공간감) | 없음 |
| IP-Adapter | 0.5~0.6 (초은이) | 0.4~0.5 (초은이) | 없음 |

### Seed 관리 정책

- 배경 시드: 씬별 고정 (재사용 가능하게)
- 캐릭터 시드: 캐릭터별 고정 기본 시드 + variation 0.1~0.3 (포즈/표정 변화)
- 미시 세계 환경 시드: 에피소드 내에서 고정 (에피소드 간 변경)

---

## 부록 B: 검증 체크리스트

스타일가이드 준수 여부 확인용. 모든 생성 이미지에 대해 검증한다.

### 현실 세계 이미지 체크리스트
- [ ] 수채화 질감이 느껴지는가 (브러시 스트로크, 번짐)
- [ ] 색온도가 웜톤인가 (골든아워 느낌)
- [ ] 외곽선이 부드럽고 유기적인가 (날카로운 선 없음)
- [ ] 캐릭터 팔레트가 color-palette.md와 일치하는가
- [ ] AI 아티팩트 없는가 (손가락, 얼굴 확인)

### 미시 세계 이미지 체크리스트
- [ ] 프리즘/발광 효과가 적용되었는가
- [ ] 투명도와 체적광이 표현되었는가
- [ ] 에피소드별 색감 톤과 일치하는가
- [ ] 과학적으로 그럴듯한 구조인가 (작품소개서 비주얼 키워드 반영)
- [ ] 수채화 스타일이 섞이지 않았는가

### 캐릭터 일관성 체크리스트
- [ ] 초은이: 하늘색 구슬 땋은머리, 파스텔 민트 탐험 조끼, 카키 반바지, 양말 짝짝이, 갈색 부츠, 황동 돋보기(목걸이) 동일한가
- [ ] 초은이: 표정이 호기심/밝음 계열인가
- [ ] 할아버지: 은백 민들레 옆머리, 와이어 둥근 안경, 코르듀로이 카디건(팔꿈치 패치), 무전기, 마이크로렌즈 고글 동일한가
- [ ] 뭉이: 투명 둥근 몸체, 큰 눈, 8개 다리 동일한가
- [ ] 전환 전후로 캐릭터 실루엣이 유지되는가
