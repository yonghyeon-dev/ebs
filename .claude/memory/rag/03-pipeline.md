# 제작 파이프라인 상태

> AI 애니메이션 제작 도구별 진행 상태 및 워크플로우 참조.

## 파이프라인 개요

```
[1] 프롬프트 작성 ──→ [2] ComfyUI 이미지 생성 ──→ [3] Runway/Kling 영상 생성
        |                      |                           |
   (텍스트 작업)        (캐릭터 + 배경)            (배경 영상 + 전환)
        |                      |                           |
      완료               Phase 2 예정              Phase 3 예정
                                                           |
                               ┌───────────────────────────┘
                               v
                    [4] 캐릭터 애니메이션 ──→ [5] 합성/편집 ──→ [6] 최종 출력
                      (AnimateDiff)         (AE/DaVinci)      (MP4 FHD)
                     Phase 4 예정          Phase 5 예정     Phase 6 예정
```

## 실제 ComfyUI 환경 (2026-03-26 확인)

- **ComfyUI**: v0.18.2, 포트 8000 (`http://127.0.0.1:8000`)
- **GPU**: NVIDIA RTX 4070 (VRAM 12GB)
- **노드 수**: 1,226개
- **MCP**: comfyui-mcp@0.3.2 전역 설치됨 (포트 8000)

### 설치된 모델

| 유형 | 파일명 | 크기 |
|------|--------|------|
| 체크포인트 | `DreamShaperXL_Turbo_v2_1.safetensors` | 6.5GB |
| 체크포인트 | `animagineXL31_v31.safetensors` | — |
| 체크포인트 | `sd_xl_base_1.0.safetensors` | — |
| VAE | `sdxl_vae.safetensors` (fp16-fix) | 320MB |
| LoRA (수채화) | `ral-wtrclr-sdxl.safetensors` | 218MB |
| LoRA (크리스탈) | `ral-crztlgls-sdxl.safetensors` | 218MB |
| IP-Adapter | `ip-adapter-plus_sdxl_vit-h.safetensors` | — |
| CLIP Vision | `CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors` | — |

### LoRA trigger word

| LoRA | trigger word | 용도 |
|------|-------------|------|
| `ral-wtrclr-sdxl` | `ral-wtrclr` | 현실세계 수채화풍 |
| `ral-crztlgls-sdxl` | `ral-crztlgls` | 미시세계 크리스탈/프리즘 |

### 영상 생성 노드 (ComfyUI 내장 — 외부 서비스 아님)

| 도구 | 노드 예시 | 비고 |
|------|---------|------|
| **Kling** | KlingImage2VideoNode, KlingCameraControlI2VNode 등 20+ | ComfyUI 크레딧 사용 |
| **Runway** | RunwayImageToVideoNodeGen3a, Gen4 | ComfyUI 노드 |
| **Wan Video** | WanImageToVideo, WanVideoSampler 등 100+ | 가장 대규모 |
| **Hunyuan Video** | HunyuanVideoImageToVideo 등 | |
| **기타** | LumaVideoNode, PixverseI2V, Vidu, Veo3, GrokVideo 등 | |

**중요**: 기존 설계는 Runway/Kling을 외부 웹사이트로 가정했으나, 실제로는 ComfyUI 노드로 통합되어 있음. 워크플로우를 ComfyUI 내부 파이프라인으로 재설계 필요.

## 도구별 상태

### ComfyUI (SDXL)
- **용도**: 캐릭터 레퍼런스 + 배경 + 영상 생성 (올인원)
- **상태**: 워크플로우 JSON 준비 완료, 모델명 수정 PR 대기 중
- **워크플로우**: `production/prompts/workflows/comfyui-*.json` (11종)

### IP-Adapter + LoRA
- **용도**: 에피소드 간 캐릭터 동일성 유지
- **상태**: 워크플로우 준비 완료, 가이드 작성 완료
- **가이드**: `production/characters/ip-adapter-guide.md`, `production/characters/lora-training-spec.md`
- **IP-Adapter weight**: 현실 0.6~0.8, 미시 0.5
- **LoRA trigger**: choeun_girl, grandpa_scientist, mungyi_tardigrade

### Kling / Runway (img2video) — ComfyUI 노드
- **용도**: 배경 영상 생성, 장면 전환
- **상태**: 프롬프트 완료, ComfyUI 노드 기반 재설계 필요
- **프롬프트 파일**: `production/prompts/scenes/ep01-runway-prompts.md`
- **Kling**: ComfyUI 크레딧 사용 (KlingImage2VideoNode)
- **Runway**: ComfyUI 노드 (RunwayImageToVideoNodeGen3a/Gen4)
- **Wan Video**: 로컬 실행 가능 (WanImageToVideo) — VRAM 12GB 제약 확인 필요

### AnimateDiff / Wan Video
- **용도**: 캐릭터 모션 생성
- **상태**: 미착수 (Phase 4)
- **Wan Video가 AnimateDiff 대체 가능**: WanAnimateToVideo 등 노드 확인됨

### After Effects / DaVinci Resolve
- **용도**: 레이어 합성, 색보정, 최종 편집
- **상태**: 미착수 (Phase 5)

## 워크플로우 파일 위치
- 프롬프트: `production/prompts/`
- 캐릭터 레퍼런스: `production/characters/` (생성 후)
- 에피소드 에셋: `production/episodes/ep01/` (생성 후)
- ComfyUI 워크플로우 JSON: `production/prompts/workflows/` (11종 생성됨)
- LoRA 사양서: `production/characters/lora-training-spec.md`
- IP-Adapter 가이드: `production/characters/ip-adapter-guide.md`
