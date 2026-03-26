# Sprint Contract: WI-007 (Phase 2 컨셉아트)

## 기본 정보
- **WI**: WI-007-feat 컨셉아트 생성 (현실세계 정원 + 미시세계 프리즘)
- **담당 팀**: visual
- **생성자**: team-worker (visual)
- **평가자**: evaluator
- **스프린트 기간**: 2026-03-26
- **선행 WI**: WI-003 (씬별 배경 프롬프트)

## 목표
EP01 '물방울 속 우주'의 핵심 컨셉아트 2종을 ComfyUI SDXL로 생성한다.
현실세계 정원(수채화풍)과 미시세계 프리즘 내부(초현실)의 비주얼 이중 레이어를 확립하는 키 비주얼.

## 입력물 (선행 조건)
- `production/prompts/workflows/comfyui-conceptart-ep01.json` — 컨셉아트 워크플로우
- `production/prompts/scenes/ep01-scene-prompts.md` — 씬별 프롬프트 (참조)
- `production/characters/style-guide.md` — 스타일가이드
- `production/characters/color-palette.md` — 색상 팔레트

## 산출물 (Deliverables)
| # | 파일 경로 | 설명 |
|---|---------|------|
| 1 | `production/episodes/ep01/concept-art/concept01-garden-watercolor.png` | 현실세계 정원 전경 (16:9 수채화풍) |
| 2 | `production/episodes/ep01/concept-art/concept02-prism-world-surreal.png` | 미시세계 프리즘 내부 (16:9 초현실) |

## 수용 기준 (Acceptance Criteria)
- [ ] Concept01은 watercolor LoRA(`ral-wtrclr-sdxl`) 사용, strength_model 0.7
- [ ] Concept02는 prismatic LoRA(`ral-crztlgls-sdxl`) 사용, strength_model 0.8
- [ ] Concept01 파라미터: Steps 35, CFG 7.0, Sampler dpmpp_2m/karras
- [ ] Concept02 파라미터: Steps 40, CFG 6.5, Sampler dpmpp_sde/karras
- [ ] 해상도: 16:9 비율 (워크플로우 기준 1920x1080이나 VRAM 제약 시 1344x768로 조정 허용)
- [ ] 체크포인트: DreamShaperXL_Turbo_v2_1.safetensors 사용
- [ ] VAE: sdxl_vae.safetensors 사용
- [ ] ComfyUI MCP로 워크플로우 validate 통과
- [ ] 생성 이미지가 production/episodes/ep01/concept-art/ 경로에 저장

## 검증 방법
1. 워크플로우 JSON의 LoRA/KSampler/EmptyLatentImage 노드 파라미터를 수용 기준과 대조
2. ComfyUI MCP validate_workflow로 워크플로우 유효성 검증
3. 생성 결과 이미지 파일 존재 여부 확인
4. 스타일가이드의 비주얼 이중 레이어(현실 수채화 ↔ 미시 초현실) 구분이 반영되었는지 확인

## 제약 (Constraints)
- RTX 4070 (12GB VRAM) — 1920x1080이 OOM 발생 시 1344x768로 다운스케일 허용
- 다른 팀(character, animation) 소유 디렉토리 수정 금지
- ComfyUI 워크플로우 JSON은 API 포맷(노드 ID 기반)

## 평가 기준 (비주얼 프로젝트)
| 기준 | 가중치 | 이 WI에서 중점 확인 사항 |
|------|--------|----------------------|
| 디자인 품질 | 25% | 수채화/초현실 비주얼이 스타일가이드와 부합하는지 |
| 독창성 | 30% | 마이크로 보이저 고유 비주얼(이중 레이어)이 키 비주얼로 확립되는지 |
| 기술 완성도 | 25% | ComfyUI 워크플로우 정합성, 노드 연결 정확성 |
| 정확성 | 20% | 파라미터 일치, LoRA trigger word 포함, 파일 경로 정확성 |

type: visual

## 통과 기준
- 총점 **9.0 이상** PASS
- 9.0 미만 FAIL → 재작업 (최대 3회)
