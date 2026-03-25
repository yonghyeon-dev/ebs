# Sprint Contract: WI-004 ~ WI-006 (Phase 2 배치)

## 기본 정보
- **WI**: WI-004-feat ~ WI-006-feat ComfyUI 캐릭터 레퍼런스 생성 (초은이 5종, 할아버지 3종, 뭉이 5종)
- **담당 팀**: character
- **생성자**: team-worker (character)
- **평가자**: evaluator
- **스프린트 기간**: 2026-03-26
- **선행 WI**: WI-001 (캐릭터 프롬프트), WI-002 (스타일가이드)

## 목표
Phase 1에서 작성한 캐릭터 프롬프트와 스타일가이드를 기반으로, ComfyUI SDXL + IP-Adapter를 사용하여 3명의 캐릭터 레퍼런스 이미지를 생성한다. 생성된 이미지는 LoRA 학습 데이터 및 이후 AnimateDiff 입력으로 사용된다.

## 입력물 (선행 조건)
- `production/prompts/characters/choeun-prompts.md` — 초은이 프롬프트 10종
- `production/prompts/characters/grandpa-prompts.md` — 할아버지 프롬프트 7종
- `production/prompts/characters/mungyi-prompts.md` — 뭉이 프롬프트 8종
- `production/characters/style-guide.md` — 전체 스타일가이드
- `production/characters/color-palette.md` — 색상 팔레트
- `production/prompts/workflows/comfyui-choeun-5ref.json` — 초은이 워크플로우
- `production/prompts/workflows/comfyui-grandpa-3ref.json` — 할아버지 워크플로우
- `production/prompts/workflows/comfyui-mungyi-5ref.json` — 뭉이 워크플로우
- `production/prompts/workflows/comfyui-ip-adapter-consistency.json` — IP-Adapter 템플릿
- `production/prompts/workflows/generation-guide.md` — 생성 순서 가이드

## 산출물 (결과 파일)

### WI-004: 초은이 레퍼런스 5종
| # | 파일 경로 | 설명 |
|---|---------|------|
| 1 | `production/characters/choeun/ref01-front-watercolor.png` | 정면 전신 현실세계 (수채화풍) |
| 2 | `production/characters/choeun/ref02-side-watercolor.png` | 측면 전신 현실세계 |
| 3 | `production/characters/choeun/ref03-back-watercolor.png` | 후면 전신 현실세계 |
| 4 | `production/characters/choeun/ref04-expression-curiosity.png` | 표정 호기심 |
| 5 | `production/characters/choeun/ref05-front-surreal.png` | 정면 전신 미시세계 (초현실) |

### WI-005: 할아버지 레퍼런스 3종
| # | 파일 경로 | 설명 |
|---|---------|------|
| 1 | `production/characters/grandpa/ref01-front-watercolor.png` | 정면 전신 현실세계 |
| 2 | `production/characters/grandpa/ref02-side-watercolor.png` | 측면 전신 현실세계 |
| 3 | `production/characters/grandpa/ref03-expression-smile.png` | 표정 미소 |

### WI-006: 뭉이 레퍼런스 5종
| # | 파일 경로 | 설명 |
|---|---------|------|
| 1 | `production/characters/mungyi/ref01-front-surreal.png` | 정면 전신 미시세계 |
| 2 | `production/characters/mungyi/ref02-side-surreal.png` | 측면 전신 미시세계 |
| 3 | `production/characters/mungyi/ref03-topdown-surreal.png` | 탑다운 뷰 미시세계 |
| 4 | `production/characters/mungyi/ref04-walking-surreal.png` | 뒤뚱걷기 동작 |
| 5 | `production/characters/mungyi/ref05-turnaround-surreal.png` | 4면 턴어라운드 시트 |

## 수용 기준

### WI-004 (초은이)
- [ ] 워크플로우 `comfyui-choeun-5ref.json`의 프롬프트가 `choeun-prompts.md` Prompt 01~04, 07과 정확 일치
- [ ] Ref01~04는 watercolor LoRA(`watercolor_style_sdxl`) 사용, Ref05는 prismatic LoRA(`prismatic_surreal_sdxl`) 사용
- [ ] Ref01~04 파라미터: Steps 35, CFG 7.0, Sampler dpmpp_2m/karras
- [ ] Ref05 파라미터: Steps 40, CFG 6.5, Sampler dpmpp_sde/karras
- [ ] 해상도: Ref01~03, 05 = 896x1152 (세로), Ref04 = 1024x1024 (정사각)
- [ ] Ref01 정면 이미지를 IP-Adapter 기준으로 사용 (generation-guide.md Step 2 절차 준수)

### WI-005 (할아버지)
- [ ] 워크플로우 `comfyui-grandpa-3ref.json`의 프롬프트가 `grandpa-prompts.md` Prompt 01~03과 정확 일치
- [ ] 전체 watercolor LoRA만 사용 (할아버지는 현실세계 전용)
- [ ] 파라미터: Steps 35, CFG 7.0, Sampler dpmpp_2m/karras
- [ ] 해상도: Ref01~02 = 896x1152, Ref03 = 1024x1024

### WI-006 (뭉이)
- [ ] 워크플로우 `comfyui-mungyi-5ref.json`의 프롬프트가 `mungyi-prompts.md` Prompt 01~04, 08과 정확 일치
- [ ] 전체 prismatic LoRA만 사용 (뭉이는 미시세계 전용)
- [ ] CFG 6.0~6.5로 낮게 설정 (투명 몸체 표현)
- [ ] Steps 40~45로 높게 설정 (투명체 내부 디테일)
- [ ] Ref05 턴어라운드 해상도: 1536x640 (초와이드 4뷰)

### 공통
- [ ] IP-Adapter 워크플로우(`comfyui-ip-adapter-consistency.json`)가 범용 템플릿으로 사용 가능
- [ ] generation-guide.md에 생성 순서(Step 1~5), IP-Adapter weight 가이드, 결과물 저장 경로, 트러블슈팅 안내 포함
- [ ] 스타일가이드(style-guide.md) 및 색상팔레트(color-palette.md)의 캐릭터별 색상 HEX가 프롬프트와 일관

## 검증 방법
1. 각 워크플로우 JSON의 CLIPTextEncode 노드 텍스트를 해당 프롬프트 MD 파일과 diff 비교
2. KSampler 노드의 파라미터(steps, cfg, sampler_name, scheduler)를 프롬프트 MD의 권장 파라미터와 대조
3. LoRA 연결(model 참조)이 현실세계/미시세계 구분에 맞게 되어 있는지 노드 그래프 추적
4. EmptyLatentImage 노드의 width/height가 프롬프트 MD의 Resolution과 일치하는지 확인
5. IP-Adapter 워크플로우의 노드 연결 구조가 ComfyUI 표준 패턴 준수하는지 확인
6. generation-guide.md의 생성 순서가 캐릭터 간 IP-Adapter 의존성을 올바르게 반영하는지 확인

## 제약 (Constraints)
- ComfyUI 워크플로우 JSON은 API 포맷(노드 ID 기반)으로 작성 — UI 포맷 아님
- LoRA 파일명은 실제 다운로드한 파일에 맞게 사용자가 조정할 수 있음 (가이드에 명시)
- 이미지 생성 자체는 ComfyUI 로컬 실행이 필요 — 워크플로우 파일과 가이드 문서가 산출물
- 다른 팀(visual, animation) 소유 디렉토리 수정 금지

## 평가 기준 (비주얼 프로젝트)
| 기준 | 가중치 | 이 WI에서 중점 확인 사항 |
|------|--------|----------------------|
| 디자인 품질 | 25% | 워크플로우가 스타일가이드/색상팔레트의 캐릭터 비주얼을 정확히 구현하는지 |
| 독창성 | 30% | 마이크로 보이저 고유 비주얼(수채화/프리즘 이중 레이어)이 워크플로우에 반영되는지 |
| 기술 완성도 | 25% | ComfyUI API 포맷 정합성, 노드 연결 정확성, IP-Adapter 설정 적절성 |
| 정확성 | 20% | 프롬프트↔워크플로우 일치, 파라미터↔가이드 일치, 파일 경로 정확성 |

type: visual

## 통과 기준
- 총점 **7.0 이상** PASS
- 7.0 미만 FAIL → 재작업 (최대 3회)

## 참조 문서
- `production/prompts/characters/*.md` — 캐릭터 프롬프트 (WI-001 산출물)
- `production/characters/style-guide.md` — 스타일가이드 (WI-002 산출물)
- `production/characters/color-palette.md` — 색상 팔레트 (WI-002 산출물)
- `.flowset/contracts/production-pipeline.md` — 팀간 에셋 전달 규칙
