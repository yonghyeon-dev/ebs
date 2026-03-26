# 초은이 (박초은, 7세) — 캐릭터 프롬프트 세트

> ComfyUI animagineXL v3.1 Danbooru 태그 기반 프롬프트. 현실 세계(수채화풍)와 미시 세계(초현실) 두 스타일 버전 포함.

---

## 공통 캐릭터 태그 (Character Tag Block)

```
# 모든 프롬프트에 삽입하는 캐릭터 기본 태그
choeun_tags = "1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, dark brown eyes, round face, chubby cheeks, blush, small nose"

choeun_outfit = "green vest, cream shirt, long sleeves, khaki shorts, cargo shorts, oversized pockets, mismatched socks, striped socks, blue socks, green socks, polka dot socks, brown boots, lace-up boots"

choeun_props = "magnifying glass, brass, leather cord, neck strap"
```

<!-- 캐릭터 정체성 메모:
- 뻔한 애니메이션 소녀가 아닌 '현장 탐험가' 느낌의 7세 소녀
- 돋보기는 목에 걸려 있는 황동 돋보기 (트레이드마크)
- 파스텔 민트 탐험 조끼 + 카키 반바지 → 자연탐험가 이미지
- 양말 짝짝이 → 7세다운 엉뚱함과 개성 표현
- 머리 한쪽에 하늘색 구슬로 묶은 작은 땋은 머리 → 식별 포인트
-->

---

## 권장 기본 파라미터

| 항목 | 권장 값 |
|------|--------|
| **Checkpoint** | animagineXL31_v31.safetensors |
| **Sampler** | euler normal (현실) / dpmpp_2m karras (미시) |
| **Steps** | 25~30 |
| **CFG Scale** | 5.0~7.0 |
| **Resolution** | 1024x1024 (정사각) 또는 896x1152 (세로 캐릭터 시트) |
| **Seed** | 캐릭터 일관성용 고정 시드 사용 권장 (IP-Adapter 병행 시 자유) |
| **VAE** | sdxl_vae.safetensors |
| **LoRA** | 없음 (animagineXL은 자체 스타일 지원) |

---

## Quality / Negative 공통 블록

**Quality Prefix (모든 Positive 앞에):**
```
masterpiece, best quality, absurdres, highres,
```

**Standard Negative (모든 씬 공통):**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry
```

---

## Prompt 01: 정면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 캐릭터 레퍼런스 시트의 기준이 되는 정면 전신. 수채화 스타일의 따뜻한 정원 배경 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, dark brown eyes, round face, chubby cheeks, blush, small nose, curious smile, gap teeth,
green vest, cream shirt, long sleeves, khaki shorts, cargo shorts, oversized pockets, mismatched socks, striped socks, blue socks, green socks, polka dot socks, brown boots, lace-up boots, mud on shoes,
magnifying glass, brass, leather cord, neck strap,
character reference sheet, front view, full body, standing,
watercolor (medium), illustration, warm colors, soft lighting, sunlit, garden, after rain, white background, children's book illustration, character design
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, super deformed, adult, mature, makeup, high heels, revealing clothing, dark atmosphere, horror, gore, neon colors, school uniform, magical girl
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 896x1152

---

## Prompt 02: 측면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 90도 측면 프로필. 머리 뒤의 땋은 머리와 조끼 옆면 디테일 확인용 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, dark brown eyes, round face, chubby cheeks, blush,
green vest, cream shirt, long sleeves, khaki shorts, cargo shorts, mismatched socks, brown boots, lace-up boots,
magnifying glass, brass, leather cord, neck strap,
character reference sheet, side view, full body, profile, walking, one foot forward,
watercolor (medium), illustration, warm colors, soft lighting, clean background, character design, side profile reference
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, super deformed, adult, mature, makeup, dark atmosphere, horror, neon colors, facing camera, front view
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 896x1152

---

## Prompt 03: 후면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 등 뒤에서 본 모습. 조끼 뒷면, 반바지 뒷주머니, 부츠 등 확인용 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, from behind, back,
green vest, cream shirt, long sleeves, khaki shorts, cargo shorts, back pocket, notebook in pocket, mismatched socks, brown boots, lace-up boots,
leather cord around neck, magnifying glass,
character reference sheet, back view, full body, standing, looking ahead,
watercolor (medium), illustration, warm colors, soft afternoon sunlight, clean background, character design, back reference
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, super deformed, adult, face visible, front view, side view, dark atmosphere, horror, neon colors
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 896x1152

---

## Prompt 04: 표정 시트 — 호기심 (Curiosity)

<!-- 의도: Scene 1-2에서 물방울 발견 시 호기심 가득한 표정. 눈이 반짝이는 느낌 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, dark brown eyes, round face, chubby cheeks, blush,
close-up, portrait, head and shoulders, upper body,
wide eyes, sparkling eyes, open mouth, surprised, curious, wonder, fascinated,
holding magnifying glass, brass magnifying glass, looking through lens, one eye enlarged,
watercolor (medium), illustration, warm colors, golden hour, soft lighting, warm tones, clean background, expression reference sheet
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, adult, mature, makeup, dark atmosphere, horror, neutral expression, bored, neon colors
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 1024x1024

---

## Prompt 05: 표정 시트 — 놀람 (Surprise)

<!-- 의도: Scene 2-1에서 미시 세계 진입 시 / Scene 4-1에서 위기 시 놀라는 표정 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, dark brown eyes, round face, chubby cheeks,
close-up, portrait, head and shoulders, upper body,
wide eyes, shocked, surprised, open mouth, jaw drop, raised eyebrows, windswept hair,
hands up, spread fingers, startled gesture, magnifying glass, leather cord, swinging,
watercolor (medium), illustration, warm colors, dramatic lighting, backlight, motion lines, clean background, expression reference sheet
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, adult, mature, dark atmosphere, horror, terror, screaming, calm expression, neon colors
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 1024x1024

---

## Prompt 06: 표정 시트 — 기쁨 (Joy)

<!-- 의도: Scene 5-2에서 현실 복귀 후 기쁨에 찬 표정. "할아버지, 물방울 속에 우주가 있었어!" -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, dark brown eyes, round face, chubby cheeks, blush,
close-up, portrait, head and shoulders, upper body,
closed eyes, crinkled eyes, big smile, grin, gap teeth, intense blush, messy hair, dirt on forehead,
one hand waving, other hand holding magnifying glass, clutching to chest, excited,
watercolor (medium), illustration, warm colors, bright sunlight, golden hour, lens flare, clean background, expression reference sheet
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, adult, mature, dark atmosphere, horror, subtle smile, polite, forced smile, neon colors
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 1024x1024

---

## Prompt 07: 정면 전신 — 미시 세계 (초현실 스타일)

<!-- 의도: 미시 세계(물방울 내부)에 들어간 초은이. 수채화풍이 아닌 초현실적 프리즘 세계 속의 캐릭터.
     Scene 2-2, 3-1, 3-2에서 사용. 같은 캐릭터이지만 세계관 전환으로 비주얼 톤이 달라짐 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, dark brown eyes, round face, chubby cheeks,
green vest, cream shirt, long sleeves, khaki shorts, cargo shorts, mismatched socks, brown boots,
magnifying glass, brass, leather cord, neck strap, glowing,
front view, full body, standing, miniaturized,
fantasy, surreal, prismatic, iridescent, transparent, crystal, rainbow light, inside water droplet, floating particles, water molecules, microscopic world,
volumetric lighting, light spectrum, ethereal glow, dreamlike atmosphere, prismatic refraction
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, chibi, super deformed, adult, mature, dark atmosphere, horror, gore, monochrome, desaturated, watercolor (medium), paper texture
```

**Parameters:** Steps 30, CFG 6.5, Sampler dpmpp_2m karras, 896x1152

---

## Prompt 08: 액션 포즈 — 표면장력 서핑 (미시 세계)

<!-- 의도: Scene 3-3 표면장력 서핑. 초은이가 물 표면 위에서 서핑하는 역동적 장면.
     핵심 액션 씬이자 교육 포인트(표면장력) 시각화 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1girl, solo, 7yo, child, korean, black hair, bob cut, single side braid, blue bead hair tie, dark brown eyes, round face, wide sparkling eyes, thrilled expression,
green vest, fluttering, cream shirt, khaki shorts, mismatched socks, brown boots,
magnifying glass, leather cord,
dynamic pose, surfing, arms outstretched, balance, bent knees, action,
standing on water surface, elastic surface, transparent water, water molecules, connected spheres,
fantasy, surreal, prismatic, rainbow light, inside water droplet, floating particles, microscopic world,
volumetric lighting, dynamic angle, from below, motion blur, speed lines, sense of speed
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, chibi, static pose, standing still, adult, mature, dark atmosphere, horror, ocean surfing, beach, real waves, monochrome, watercolor (medium), paper texture
```

**Parameters:** Steps 30, CFG 7.0, Sampler dpmpp_2m karras, 1152x896 (가로 구도 - 서핑 역동성)

---

## Prompt 09: 돋보기 소품 상세 클로즈업

<!-- 의도: 초은이의 트레이드마크 돋보기를 단독으로 상세 묘사. 소품 레퍼런스 시트용.
     두 스타일 모두에서 동일한 소품이 등장해야 하므로 기준 확립 필요 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, still life, object focus,
magnifying glass, antique, brass, tarnished, patina, round lens, ornate handle, leaf vine engravings, leather cord, neck strap,
light refraction, rainbow prism, glass reflection,
multiple views, front view, side view, detail view,
watercolor (medium), illustration, warm lighting, white background, object reference sheet, product design
```

**Negative Prompt:**
```
lowres, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, plastic toy, modern design, chrome, broken, cracked, dark atmosphere, hands, character, neon colors
```

**Parameters:** Steps 28, CFG 7.0, Sampler euler normal, 1024x1024

---

## Prompt 10: 초은이 + 뭉이 투샷 — 미시 세계

<!-- 의도: Scene 3-2 프리즘 세계 탐험. 초은이와 뭉이가 나란히 걷는 모습.
     두 캐릭터 간 크기 비율과 관계성 확립용 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1girl, child, 7yo, korean, black hair, bob cut, single side braid, blue bead hair tie, green vest, khaki shorts, mismatched socks, brown boots, magnifying glass, leather cord,
walking, happy, gentle smile,
creature, tardigrade, water bear, cute, round translucent body, 8 stubby legs, big friendly eyes, waddling,
2characters, walking together, medium shot, side by side, size comparison, creature at knee height,
fantasy, surreal, prismatic, rainbow light tunnel, inside water droplet, light spectrum path, floating water molecules,
warm companionship, adventure, friendship,
iridescent volumetric lighting, prismatic color palette, dreamlike atmosphere
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, chibi, adult, dark atmosphere, horror, gore, monochrome, realistic tardigrade, scary creature, single character only, watercolor (medium), paper texture
```

**Parameters:** Steps 30, CFG 6.5, Sampler dpmpp_2m karras, 1152x896 (가로 - 두 캐릭터 나란히)

---

## 사용 가이드

### IP-Adapter 연동
1. Prompt 01(정면)을 기준 생성 → 가장 만족스러운 결과를 IP-Adapter 레퍼런스 이미지로 등록
2. 이후 모든 프롬프트 생성 시 IP-Adapter weight 0.6~0.8로 일관성 유지
3. 미시 세계 프롬프트(07, 08, 10)는 IP-Adapter weight를 0.5로 낮추어 스타일 전환 허용

### LoRA 학습 계획
- 정면/측면/후면 기준 이미지 확정 후 → 초은이 전용 LoRA 학습 (20~30장 레퍼런스)
- trigger word: `choeun_girl`
- LoRA weight: 0.7~0.9

### 씬별 프롬프트 선택 가이드
| 씬 | 사용 프롬프트 |
|----|-------------|
| Scene 1-2 (정원에서 물방울 발견) | Prompt 01 + 04 (호기심) |
| Scene 2-1 (미시 세계 진입) | Prompt 05 (놀람) → Prompt 07 (미시 정면) |
| Scene 3-1 (뭉이 만남) | Prompt 07 + 10 (투샷) |
| Scene 3-2 (프리즘 탐험) | Prompt 10 (투샷 걷기) |
| Scene 3-3 (표면장력 서핑) | Prompt 08 (서핑 액션) |
| Scene 4-1 (위기) | Prompt 05 (놀람, 미시 세계 배경으로 수정) |
| Scene 5-2 (현실 복귀) | Prompt 06 (기쁨) |
| Scene 6-1 (다음 화 예고) | Prompt 01 변형 (장미꽃 바라보기) |
