# 뭉이 — 물곰 타디그레이드 (에피소드 1 친구 캐릭터) — 캐릭터 프롬프트 세트

> ComfyUI animagineXL v3.1 Danbooru 태그 기반 프롬프트. 뭉이는 미시 세계 캐릭터이므로 대부분 초현실 스타일.
> 현실 세계 엔딩(뭉이 인사 장면)용 수채화풍 1종 포함.

---

## 공통 캐릭터 태그 (Character Tag Block)

```
# 모든 프롬프트에 삽입하는 캐릭터 기본 태그
mungyi_tags = "no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body, translucent, semi-transparent, bioluminescent, internal glow, iridescent skin, prismatic"

mungyi_features = "8 legs, four pairs of legs, stubby legs, short legs, symmetrical, rounded claws, large eyes, round eyes, dark eyes, friendly eyes, gentle smile, small round mouth, no nose, smooth head"

mungyi_color = "translucent pale blue-green body, rainbow light, soft warm glow, soap bubble iridescence"
```

<!-- 캐릭터 정체성 메모:
- 실제 타디그레이드의 형태를 기반으로 하되 의인화 → 귀엽고 친근하게
- 핵심 차별점: 투명한 몸체 → 내부가 은은하게 빛나는 '살아있는 보석' 컨셉
- 비누방울 같은 프리즘 무지개빛이 피부 표면에 감돌며 → 물방울 세계관과 시각적 통일
- 8개 다리는 뭉뚝하고 짧게 → 뒤뚱뒤뚱 걸음걸이의 귀여움 극대화
- 얼굴은 큰 눈 + 작은 입 + 코 없음 → 단순하지만 표정이 풍부한 디자인
- 성격: 느긋하고 듬직한 안내자 → 천천히 움직이지만 믿음직한 존재감
- "cute anime mascot" 탈피: 실제 타디그레이드의 통통한 배럴 형태 유지, 과도한 의인화 지양
-->

---

## 권장 기본 파라미터

| 항목 | 권장 값 |
|------|--------|
| **Checkpoint** | animagineXL31_v31.safetensors |
| **Sampler** | dpmpp_2m karras (초현실 기본) / euler normal (수채화풍) |
| **Steps** | 28~35 |
| **CFG Scale** | 5.0~7.0 (투명도/반투명 표현을 위해 낮게) |
| **Resolution** | 1024x1024 (정사각) 또는 896x1152 (세로 캐릭터 시트) |
| **Seed** | 캐릭터 일관성용 고정 시드 사용 권장 |
| **VAE** | sdxl_vae.safetensors |
| **LoRA** | 없음 (animagineXL 자체 스타일 지원) |

---

## Prompt 01: 정면 전신 — 미시 세계 (초현실 스타일)

<!-- 의도: 뭉이 캐릭터의 기준 정면 레퍼런스. 8개 다리, 투명 몸체, 큰 눈 등 핵심 특징 확립.
     Scene 3-1 뭉이 등장 시 기본 형태 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body, translucent, semi-transparent, bioluminescent, internal glow,
iridescent skin, soap bubble, prismatic, rainbow refraction,
8 legs, four pairs of legs, stubby legs, short legs, symmetrical, rounded claws, front legs raised, greeting gesture,
large eyes, round eyes, dark eyes, friendly eyes, gentle smile, sparkle in eyes, small round mouth, no nose, smooth head,
translucent pale blue-green body, rainbow light, internal structures visible, soft warm glow,
character reference sheet, front view, full body, standing,
fantasy, surreal, prismatic, iridescent, crystal, inside water droplet, floating particles, water molecules, microscopic world,
volumetric lighting, prismatic color palette, creature design reference sheet
```

**Negative Prompt:**
```
lowres, bad anatomy, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, realistic tardigrade, scary bug, insect horror, dark creepy, hairy body, slimy, opaque solid body, human face, bipedal, wearing clothes, anthropomorphic, chibi anime mascot, hair bow, generic cartoon blob, extra limbs, monochrome, flat coloring
```

**Parameters:** Steps 30, CFG 6.0, Sampler dpmpp_2m karras, 896x1152

---

## Prompt 02: 측면 전신 — 미시 세계 (초현실 스타일)

<!-- 의도: 측면에서 본 뭉이. 4쌍의 다리 배치, 배럴 형태의 몸체 비율, 걸음 실루엣 확인용 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body, translucent, semi-transparent, iridescent skin, internal glow,
8 legs, four pairs of legs, stubby legs, walking, mid-stride, waddle, alternating legs,
large round eye, profile, gentle smile, small round mouth, smooth rounded head,
translucent pale blue-green body, light passing through, rainbow caustic patterns on ground,
character reference sheet, side view, full body, profile view,
fantasy, surreal, prismatic, iridescent, inside water droplet, microscopic world,
volumetric side lighting, translucency effects, prismatic color palette, creature design, side profile reference
```

**Negative Prompt:**
```
lowres, bad anatomy, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, realistic tardigrade, scary bug, dark creepy, hairy body, opaque solid body, human proportions, wearing clothes, chibi anime, dark atmosphere, horror, extra limbs, facing camera, front view, monochrome, flat coloring
```

**Parameters:** Steps 30, CFG 6.0, Sampler dpmpp_2m karras, 896x1152

---

## Prompt 03: 위에서 본 전신 — 미시 세계 (초현실 스타일)

<!-- 의도: 탑다운 뷰. 8개 다리의 대칭 배치를 명확히 보여주는 뷰.
     타디그레이드의 실제 형태를 반영하면서 캐릭터화된 비율 확인 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body, translucent, semi-transparent, iridescent skin, soap bubble, concentric rainbow rings,
8 legs, four pairs of legs, stubby legs, splayed outward, symmetrical, rounded claws, relaxed standing,
top of head visible, large round eyes peeking from front edge,
internal structures visible, soft glowing shapes, living lantern,
character reference sheet, top-down view, bird's eye view, looking straight down, from above,
fantasy, surreal, prismatic, translucent surface, rainbow caustic light patterns, microscopic world,
top-down lighting, translucency effects, iridescent color palette, anatomical reference from above
```

**Negative Prompt:**
```
lowres, bad anatomy, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, realistic tardigrade, scanning electron microscope, scary bug, dark creepy, hairy body, opaque solid body, human proportions, chibi anime, dark atmosphere, horror, extra limbs, side view, front view, monochrome, flat coloring
```

**Parameters:** Steps 30, CFG 5.5, Sampler dpmpp_2m karras, 1024x1024

---

## Prompt 04: 동작 — 뒤뚱뒤뚱 걷기 (Waddling Walk)

<!-- 의도: Scene 3-1 "8개 다리로 뒤뚱뒤뚱 다가옴". 뭉이의 대표 동작.
     느긋하고 듬직한 성격이 걸음걸이에서 드러나도록 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body, translucent, semi-transparent, iridescent skin, prismatic rippling,
8 legs, four pairs of legs, stubby legs, walking, alternating legs, wobbling gait, front-right and back-left lifted, mid-step,
large round eyes, looking ahead, calm, friendly, gentle smile, content expression, unhurried,
motion blur on lifted legs, prismatic light particles, rainbow trail,
character action pose, full body, three-quarter view,
fantasy, surreal, prismatic, rainbow light path, inside water droplet, floating water molecules, microscopic world,
warm iridescent volumetric lighting, dynamic gentle movement, character personality
```

**Negative Prompt:**
```
lowres, bad anatomy, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, realistic tardigrade, scary bug, running fast, aggressive, static standing still, dark creepy, opaque solid body, bipedal, chibi anime, dark atmosphere, horror, extra limbs, monochrome, flat coloring, rigid stiff pose
```

**Parameters:** Steps 30, CFG 6.0, Sampler dpmpp_2m karras, 1152x896 (가로 - 이동 방향 강조)

---

## Prompt 05: 동작 — 표면장력 서핑 (Surface Tension Surfing)

<!-- 의도: Scene 3-3 표면장력 서핑. 뭉이가 초은이와 함께 물 표면에서 서핑하는 장면.
     뭉이의 8개 다리가 표면장력 위에서 균형 잡는 독특한 자세 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body, translucent, semi-transparent, iridescent skin, speed lines, rainbow trails,
8 legs, four pairs of legs, stubby legs, front legs gripping surface, back legs lifted, surfing, balance, leaning forward,
large round eyes, wide eyes, joyful, open mouth, gleeful, exhilarated,
elastic water surface, transparent, dimpling, trampoline-like, water molecule chains, connected spheres,
dynamic pose, full body, action,
fantasy, surreal, prismatic, rainbow light, inside water droplet, microscopic world,
dynamic volumetric lighting, motion lines, prismatic spray, speed, adventure
```

**Negative Prompt:**
```
lowres, bad anatomy, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, realistic tardigrade, scary bug, static pose, standing still, ocean surfing, surfboard, beach waves, dark creepy, opaque solid body, chibi anime, dark atmosphere, horror, extra limbs, monochrome, flat coloring, sad expression
```

**Parameters:** Steps 30, CFG 7.0, Sampler dpmpp_2m karras, 1152x896 (가로 - 서핑 역동성)

---

## Prompt 06: 동작 — 인사/이별 (Farewell Wave)

<!-- 의도: Scene 5-1 "뭉이에게 인사". 초은이가 떠나기 전 뭉이가 앞다리를 들어 인사하는 장면.
     감정적 순간 — 작지만 듬직한 친구의 이별 인사 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body, translucent, semi-transparent, iridescent skin, glowing brighter, intensified internal glow,
front legs raised, waving, farewell gesture, 6 legs on ground, tilted back, tiny claws spread open,
large round eyes, glistening eyes, bittersweet, brave smile, small round mouth, hopeful expression,
emotional pose, full body, front-facing three-quarter view,
fantasy, surreal, prismatic, warm golden prismatic lighting, inside water droplet, brilliant warm sunlight, glowing like jewels,
emotional farewell, warm affection, small creature big heart
```

**Negative Prompt:**
```
lowres, bad anatomy, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, realistic tardigrade, scary bug, crying, devastated, dark gloomy, depressing, opaque solid body, human hand, chibi anime, dark atmosphere, horror, extra limbs, monochrome, flat coloring, cold lighting, indifferent
```

**Parameters:** Steps 30, CFG 6.0, Sampler dpmpp_2m karras, 896x1152

---

## Prompt 07: 수채화풍 뭉이 — 현실 세계 인서트

<!-- 의도: 결말부에서 초은이가 현실로 돌아온 후 회상하거나, 차기 에피소드 예고에서
     수채화풍으로 뭉이를 보여주는 인서트 컷. 미시 세계와 다른 스타일로 같은 캐릭터 표현 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body,
robin egg blue, soft color, subtle rainbow hint,
8 legs, four pairs of legs, stubby legs, large round eyes, friendly eyes, content smile,
sitting, on leaf, water droplet nearby, rainbow reflection,
watercolor (medium), illustration, warm colors, soft natural lighting, paper texture, visible brush strokes, hand-painted quality, children's book illustration, gentle creature design
```

**Negative Prompt:**
```
lowres, bad anatomy, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, realistic tardigrade, scanning electron microscope, scary bug, digital art, glossy CG, dark atmosphere, horror, extra limbs, neon colors, monochrome, prismatic surreal lighting, microscopic world background
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 1024x1024

---

## Prompt 08: 뭉이 다각도 턴어라운드 시트

<!-- 의도: 정면/좌측면/후면/우측면을 한 장에 배치하는 턴어라운드 시트.
     LoRA 학습 및 AnimateDiff 입력용 종합 레퍼런스 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, creature, tardigrade, water bear, cute, round body, barrel-shaped body, translucent, semi-transparent, iridescent skin, prismatic,
8 legs, four pairs of legs, stubby legs, symmetrical,
large round eyes, friendly, small round mouth, smooth head,
translucent pale blue-green body, soft internal glow, rainbow light,
character turnaround sheet, multiple views, model sheet, front view, right side view, back view, left side view, 4 angles, horizontally arranged,
consistent design, neutral standing pose, simple reflective prismatic surface,
clean white background, prismatic light effects, consistent proportions, technical reference quality
```

**Negative Prompt:**
```
lowres, bad anatomy, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, realistic tardigrade, scary bug, inconsistent design, different sizes, different colors between views, dark atmosphere, horror, opaque solid body, human proportions, chibi anime, extra limbs, complex background, single view only, monochrome, flat coloring, action pose
```

**Parameters:** Steps 35, CFG 7.0, Sampler dpmpp_2m karras, 1536x640 (초와이드 - 4뷰 가로 배치) 또는 1152x896

---

## 사용 가이드

### 투명 몸체 표현 팁
1. **CFG를 낮게 유지 (5.0~6.0)**: 높은 CFG는 몸체를 불투명하게 만드는 경향이 있음
2. **Steps를 적절히 (28~35)**: animagineXL은 적은 스텝으로도 충분한 품질 도달
3. **ControlNet Depth 활용**: 뭉이의 둥근 형태를 유지하면서 투명도를 확보하려면 Depth Map 가이드 권장
4. **후처리**: 투명도가 부족한 결과물은 ComfyUI의 Opacity/Blend 노드로 보정 가능

### IP-Adapter 연동
1. Prompt 01(정면)을 기준 생성 → IP-Adapter 레퍼런스로 등록
2. 모든 뭉이 프롬프트에 IP-Adapter weight 0.5~0.7 (투명 캐릭터 특성상 약간 낮게)
3. Prompt 07(수채화풍)은 IP-Adapter weight 0.4로 스타일 전환 허용

### LoRA 학습 계획
- Prompt 08(턴어라운드)로 기본 4뷰 확보 후 추가 앵글/동작으로 15~20장 수집
- trigger word: `mungyi_tardigrade`
- LoRA weight: 0.6~0.8 (투명체이므로 과도한 weight는 디테일 손실 유발)

### 씬별 프롬프트 선택 가이드
| 씬 | 사용 프롬프트 |
|----|-------------|
| Scene 3-1 (뭉이 등장) | Prompt 01 (정면) + 04 (걷기) |
| Scene 3-2 (프리즘 탐험) | Prompt 04 (걷기) — 초은이 투샷은 choeun-prompts Prompt 10 참조 |
| Scene 3-3 (표면장력 서핑) | Prompt 05 (서핑) |
| Scene 4-3 (협력 해결) | Prompt 01 변형 (분자 결합 강화 장면 추가) |
| Scene 5-1 (이별 인사) | Prompt 06 (인사) |
| Scene 5-2 (현실 복귀 회상) | Prompt 07 (수채화풍) |
| AnimateDiff 입력용 | Prompt 08 (턴어라운드 시트) |

### 뭉이의 8개 다리 생성 안정화
SDXL은 다리 수를 정확히 생성하는 데 어려움이 있을 수 있으므로:
1. "8 legs" 대신 "4 pairs of stubby legs arranged symmetrically"로 기술
2. ControlNet의 OpenPose 또는 Scribble을 사용해 다리 위치를 수동 가이드
3. 생성 후 Inpaint로 다리 수 보정 (ComfyUI Inpaint 노드 활용)
4. 다리가 6개 또는 10개로 나올 경우 시드를 변경하며 재생성 후 최적 결과 선별
