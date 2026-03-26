# 작업 타임라인 — 마이크로 보이저

> WI 진행 이력. 세션 간 상태 복원용.

## Phase 1: D-Day 1 (2026-03-25) — 기반 + 캐릭터

| WI | 상태 | 커밋 | PR | 담당 팀 | 비고 |
|----|------|------|----|---------|------|
| WI-001-feat 캐릭터 디자인 프롬프트 | 완료 (8.7/10 PASS) | 90d6d96 | #1 (merged) | character | 초은이 10종, 할아버지 7종, 뭉이 8종 |
| WI-002-feat 캐릭터 스타일가이드 | 완료 (9.0/10 PASS) | 02f7114 | #2 (merged) | character | 현실/미시 스타일 정의, 색상 팔레트, LoRA 가이드 |
| WI-003-feat 씬별 배경 프롬프트 | 완료 (9.2/10 PASS) | 59d99dd | #3 (merged) | visual | Scene 1~6 (14 서브씬) + Runway/Kling 프롬프트 |
| WI-chore 서브에이전트 Stop hook | 완료 | 05bac4b | #4 (merged) | — | stop-rag-check.sh 추가 |
| WI-fix 캐릭터 의상 일관성 | 완료 | f38501f | #5 (merged) | character | style-guide/color-palette를 WI-001 기준으로 통일 |
| WI-fix 씬 프롬프트 의상 참조 | 완료 | 34460df | #6 (merged) | visual | 씬 3개 파일의 구버전 의상 참조 수정 |
| WI-chore RAG 시스템 셋업 | 완료 | b953627 | #7 (merged) | — | 로컬+Vault RAG 6개, stop-hook 경로 수정 |

### 의사결정: 캐릭터 의상 통일 (2026-03-25)
- WI-001 프롬프트(파스텔 민트 조끼 + 카키 반바지)와 WI-002 스타일가이드(노란 머리띠 + 멜빵바지) 불일치 발견
- WI-001 기준으로 통일 결정 (선행 WI 우선 + 독창성 우위 + 역방향 수정 비용)
- PR #5, #6 머지 완료

## Phase 2: D-Day 2 (2026-03-26) — 캐릭터 생성 + 컨셉아트

| WI | 상태 | 커밋 | PR | 담당 팀 | 비고 |
|----|------|------|----|---------|------|
| WI-004-feat ComfyUI 캐릭터 생성 (초은이 5종) | 워크플로우 준비 완료, evaluator PASS | e49c63d, f838bb8 | #10,#12 (merged) | character | 5종 JSON + IP-Adapter 템플릿, evaluator 이슈 5건 수정 완료 |
| WI-005-feat ComfyUI 캐릭터 생성 (할아버지 3종) | 워크플로우 준비 완료 | e49c63d | #10 (merged) | character | 3종 JSON |
| WI-006-feat ComfyUI 캐릭터 생성 (뭉이 5종) | 워크플로우 준비 완료 | e49c63d | #10 (merged) | character | 5종 JSON + 투명체 파라미터 최적화 |
| WI-007-feat 컨셉아트 생성 (정원 + 프리즘) | 워크플로우 준비 완료 | e49c63d | #10 (merged) | visual | 16:9 컨셉아트 2종 JSON |

## Phase 3: D-Day 2 (2026-03-26) — 배경 영상 워크플로우

| WI | 상태 | 커밋 | PR | 담당 팀 | 비고 |
|----|------|------|----|---------|------|
| WI-008-feat Scene 1 배경 (정원) | 워크플로우 준비 완료 | — | — | visual | 3종 (정원 전경, 초은이 미디엄, 물방울 매크로) |
| WI-009-feat Scene 2 배경 (전환) | 워크플로우 준비 완료 | — | — | visual | 5종 (전환 키프레임 3 + 파노라마 2) |
| WI-010-feat Scene 3 배경 (프리즘) | 워크플로우 준비 완료 | — | — | visual | 5종 (뭉이 2 + 탐험 1 + 서핑 2) |
| WI-011-feat Scene 4 배경 (위기) | 워크플로우 준비 완료 | — | — | visual | 7종 (위기 3 + 무전 2 + 복원 2) |
| WI-012-feat Scene 5-6 배경 (결말) | 워크플로우 준비 완료 | — | — | visual | 6종 (이별 2 + 복귀 2 + 티저 2) |

### 산출물 (Phase 3)
- ComfyUI 워크플로우: `comfyui-ep01-scene01~06.json` (6파일, 26종 배경 이미지)
- 영상 파이프라인 가이드: `ep01-video-pipeline-guide.md`
- 14개 클립 ID (RW-0100~0601) → Runway/Kling 설정 매핑 완료

### 의사결정: ComfyUI 환경 기반 재설계 (2026-03-26)
- 실제 ComfyUI 환경 확인: v0.18.2, 포트 8000, RTX 4070 (12GB), 1226 노드
- Kling/Runway가 외부 서비스가 아닌 ComfyUI 노드로 통합되어 있음 확인
- Wan Video 노드 100+ 설치 확인 — AnimateDiff 대체 가능성
- 모델 다운로드 완료: DreamShaperXL_Turbo_v2_1, sdxl_vae(fp16-fix), ral-wtrclr-sdxl, ral-crztlgls-sdxl
- LoRA trigger word: ral-wtrclr (수채화), ral-crztlgls (크리스탈)
- 워크플로우 모델명 수정 완료 — PR #12 머지 (2026-03-25)
- ComfyUI MCP 전역 설정 완료 (포트 8000)
- 영상 파이프라인 ComfyUI 노드 기반 재설계 완료 — PR #13 머지 (ep01-video-pipeline-guide.md v2)

### 해결 완료 이슈 (Phase 1~2 준비)
- evaluator 피드백 5건 수정 완료 (PR #12): 뭉이 LoRA weight, IP-Adapter 모델명, Clip Skip, 정규화 이미지, 학습 장수
- 워크플로우 모델명 일괄 변경 완료 (PR #12): ral-wtrclr-sdxl, ral-crztlgls-sdxl 적용
- 영상 파이프라인 ComfyUI 노드 기반 재설계 완료 (PR #13)

### animagineXL31 전환 (2026-03-26, DEC-005)
- 전체 파이프라인 animagineXL31_v31 기반으로 재설계 완료
- 워크플로우 JSON 11종 + 프롬프트 MD 10종 + 가이드 5종 = 26개 파일 수정
- LoRA 완전 제거, Danbooru 태그 기반 프롬프트로 전환
- Vault 세션 로그 개선 완료 (일별 통합 + 쿨다운)

### 현재 미해결 이슈 (2026-03-26)
- Phase 2 이미지 재생성 필요 (animagine 기준 워크플로우로 ComfyUI enqueue)
- 커밋/PR 미완 (animagine 전환 변경사항 26개 파일)

## Phase 4~6: 미착수

- Phase 4 (3/28): 캐릭터 애니메이션 + 합성 (WI-013~015)
- Phase 5 (3/29-30): 편집 + 서류 (WI-016~019)
- Phase 6 (3/31): 최종 점검 + 제출 (WI-020)
