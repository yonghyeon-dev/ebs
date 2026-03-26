# 할아버지 — '박사 할배' (68세) — 캐릭터 프롬프트 세트

> ComfyUI animagineXL v3.1 Danbooru 태그 기반 프롬프트. 현실 세계(수채화풍) 전용.

---

## 공통 캐릭터 태그 (Character Tag Block)

```
# 모든 프롬프트에 삽입하는 캐릭터 기본 태그
grandpa_tags = "1boy, solo, elderly, 68yo, korean, old man, grandfather, scientist, silver hair, white hair, thinning hair, fluffy side hair, round glasses, wire-rimmed glasses, glasses on nose, smile lines, crow's feet, wrinkles, bushy eyebrows, silver eyebrows, slightly hunched posture"

grandpa_outfit = "brown cardigan, corduroy, elbow patches, leather patches, plaid shirt, flannel shirt, red plaid, dark brown pants, brown slippers"

grandpa_props = "walkie-talkie, clipped to pocket, short antenna, brass goggles, goggles on forehead, crystalline lenses"
```

<!-- 캐릭터 정체성 메모:
- 은퇴한 과학자 → 지적이면서 따뜻한 느낌
- 은백색 민들레 홀씨 같은 옆머리 → 과학자+할아버지 동시 표현
- 코르듀로이 카디건 + 팔꿈치 패치 → 학자 느낌의 클래식한 캐주얼
- 무전기는 레트로 디자인(최신 슬림 아님) → 다락방 발명가 이미지
- 마이크로 렌즈 = 황동 고글 형태 + 수정체 렌즈 → SF 발명품 느낌
- 키가 크고 약간 구부정 → 현미경 앞에서 평생을 보낸 과학자
-->

---

## 권장 기본 파라미터

| 항목 | 권장 값 |
|------|--------|
| **Checkpoint** | animagineXL31_v31.safetensors |
| **Sampler** | euler normal |
| **Steps** | 25~30 |
| **CFG Scale** | 5.0~7.0 |
| **Resolution** | 1024x1024 (정사각) 또는 896x1152 (세로 캐릭터 시트) |
| **Seed** | 캐릭터 일관성용 고정 시드 사용 권장 (IP-Adapter 병행 시 자유) |
| **VAE** | sdxl_vae.safetensors |
| **LoRA** | 없음 (animagineXL 자체 스타일 지원) |

---

## Prompt 01: 정면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 할아버지 캐릭터 기준 정면 레퍼런스. Scene 1-3에서 마이크로 렌즈를 건네는 장면의 기본형 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1boy, solo, elderly, 68yo, korean, old man, grandfather, scientist,
silver hair, white hair, thinning hair, fluffy side hair, round glasses, wire-rimmed glasses, glasses on nose, smile lines, crow's feet, wrinkles, bushy eyebrows, silver eyebrows, weathered hands, visible veins,
brown cardigan, corduroy, elbow patches, leather patches, plaid shirt, flannel shirt, red plaid, dark brown pants, brown slippers,
walkie-talkie, clipped to pocket, short antenna, brass goggles, goggles on forehead, crystalline lenses,
character reference sheet, front view, full body, standing, slightly hunched posture,
watercolor (medium), illustration, warm colors, soft afternoon lighting, attic laboratory, cozy interior, warm atmosphere, character design
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, young man, muscular, intimidating, stern, military uniform, suit, smartphone, dark atmosphere, horror, neon colors, santa claus, wizard
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 896x1152

---

## Prompt 02: 측면 전신 — 현실 세계 (수채화풍)

<!-- 의도: 프로필 뷰. 구부정한 자세와 카디건 실루엣, 무전기/마이크로렌즈 위치 확인용 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1boy, solo, elderly, 68yo, korean, old man, grandfather, scientist,
silver hair, white hair, fluffy side hair, round glasses, wire-rimmed glasses, bushy silver eyebrows,
brown cardigan, corduroy, elbow patches, leather patches, plaid shirt, flannel shirt, dark brown pants, brown slippers,
walkie-talkie, clipped to pocket, antenna, brass goggles, goggles on forehead,
character reference sheet, side view, full body, profile, hands behind back, contemplative pose, forward lean,
watercolor (medium), illustration, warm colors, soft side lighting, clean background, character design, side profile reference
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, young man, muscular, straight posture, dark atmosphere, horror, neon colors, facing camera, front view
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 896x1152

---

## Prompt 03: 표정 시트 — 미소 (Warm Smile)

<!-- 의도: Scene 1-3에서 마이크로 렌즈를 건네며 웃는 장면 / Scene 5-2에서 초은이 이야기 듣는 장면.
     "다음엔 어디를 들여다볼까?" 하고 웃는 따뜻한 미소 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1boy, solo, elderly, 68yo, korean, old man, grandfather, scientist,
silver hair, white hair, fluffy side hair, round glasses, wire-rimmed glasses, closed eyes, crescent eyes, warm smile, gentle smile, deep smile lines, crow's feet, bushy silver eyebrows, age spots,
brown cardigan, corduroy, plaid shirt collar,
brass goggles, goggles on forehead, warm light reflection,
close-up, portrait, head and shoulders, upper body,
expression: warm smile, grandfatherly pride, gentle, kind,
watercolor (medium), illustration, warm colors, golden interior lighting, warm tones, clean background, expression reference sheet
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, young face, stern, angry, cold, dark atmosphere, horror, neutral expression, smirking, sarcastic, neon colors
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 1024x1024

---

## Prompt 04: 표정 시트 — 놀람 (Surprise)

<!-- 의도: 작품소개서 "가끔 본인도 모르는 현상이 나타나서 함께 놀라기도" 표현.
     Scene 4 위기 상황에서 무전으로 교신하며 놀라는 장면에도 활용 가능 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1boy, solo, elderly, 68yo, korean, old man, grandfather, scientist,
silver hair, white hair, fluffy side hair, disheveled, round glasses, wire-rimmed glasses, glasses askew, slipping glasses, wide eyes, surprised, open mouth, raised eyebrows, bushy silver eyebrows, wrinkles animated,
one hand adjusting glasses, other hand holding walkie-talkie, antenna extended,
close-up, portrait, head and shoulders, upper body,
expression: genuine surprise, scientific fascination, astonished, not fearful,
watercolor (medium), illustration, warm colors, dramatic lighting, light burst, clean background, expression reference sheet
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, chibi, young face, terrified, screaming, horror, dark atmosphere, calm expression, neon colors, smartphone
```

**Parameters:** Steps 28, CFG 6.0, Sampler euler normal, 1024x1024

---

## Prompt 05: 무전기 + 마이크로렌즈 소품 상세

<!-- 의도: 할아버지의 핵심 소품 두 가지를 단독 레퍼런스 시트로 확립.
     무전기 = 현실 세계에서 교신 도구, 마이크로 렌즈 = 미시 세계 진입 장치 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
no humans, still life, object focus,
walkie-talkie, vintage, retro, olive green, brass, rounded edges, telescoping antenna, circular speaker grille, toggle switches, leather belt clip, amber indicator light, handcrafted,
brass goggles, steampunk, crystalline lenses, prismatic, iridescent, adjustable brass frame, gear mechanisms, brown leather headband, brass buckle, engraved markings,
multiple views, front view, side view, detail view,
watercolor (medium), illustration, warm lighting, white background, object reference sheet, product design
```

**Negative Prompt:**
```
lowres, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, modern technology, smartphone, digital screen, plastic toy, dark atmosphere, hands, character, neon colors
```

**Parameters:** Steps 28, CFG 7.0, Sampler euler normal, 1152x896 (가로 - 두 소품 나란히)

---

## Prompt 06: 다락방 연구실 — 할아버지 환경 (현실 세계)

<!-- 의도: 할아버지의 활동 공간인 다락방 연구실. 캐릭터 세계관 확립 + Scene 1 배경 요소.
     할아버지가 여기서 마이크로 렌즈를 꺼내오는 장면 활용 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1boy, solo, elderly, silver hair, brown cardigan, corduroy, standing at workbench,
interior, attic, laboratory, cozy, cluttered,
sloped wooden ceiling, exposed beams, round window, afternoon sunlight, dust motes, bookshelves, scientific journals, leather-bound books, glass specimen jars, preserved plants, brass microscope, scattered diagrams, corkboard, persian rug, wooden floor, desk lamp, green glass shade, potted plants, windowsill, small chalkboard, molecular diagrams,
watercolor (medium), illustration, warm colors, golden afternoon light, cozy atmosphere, wide shot, detailed interior
```

**Negative Prompt:**
```
lowres, bad anatomy, text, error, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, 3d, photorealistic, modern laboratory, sterile, fluorescent lighting, high-tech, computer screens, dark dungeon, horror, abandoned, neon colors, cold blue lighting, empty room
```

**Parameters:** Steps 30, CFG 6.0, Sampler euler normal, 1152x896 (가로 - 배경 공간)

---

## Prompt 07: 할아버지 반사상 — 미시 세계 (초현실)

<!-- 의도: Scene 4-2 "할아버지 얼굴이 물방울 표면에 비침" + 무전기 음파 빛 파동 시각화.
     할아버지는 직접 미시 세계에 들어가지 않지만, 물방울 표면에 반사되는 형태로 등장 -->

**Positive Prompt:**
```
masterpiece, best quality, absurdres, highres,
1boy, elderly, silver hair, round glasses, wire-rimmed glasses, open mouth, speaking, caring expression,
reflection, distorted face, curved surface, water droplet, spherical distortion, warped, funhouse mirror,
sound waves, concentric rings, golden light ripples, amber wave patterns, expanding outward,
inside water droplet, prismatic rainbow refraction, transparent curved walls, distorted outside world,
fantasy, surreal, prismatic, iridescent, volumetric lighting, warm presence, crisis tension,
communication between worlds, macro and micro worlds
```

**Negative Prompt:**
```
lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, worst quality, low quality, normal quality, jpeg artifacts, signature, watermark, username, blurry, photorealistic, chibi, clear undistorted face, character inside water droplet, dark horror, scary, ugly, monochrome, watercolor (medium), paper texture, smartphone
```

**Parameters:** Steps 30, CFG 6.5, Sampler dpmpp_2m karras, 1024x1024

---

## 사용 가이드

### IP-Adapter 연동
1. Prompt 01(정면)을 기준 생성 → IP-Adapter 레퍼런스 이미지로 등록
2. 이후 모든 프롬프트에서 IP-Adapter weight 0.6~0.8 적용
3. Prompt 07(미시 세계 반사상)은 IP-Adapter weight 0.4로 낮추어 왜곡 허용

### LoRA 학습 계획
- 정면/측면 기준 이미지 확정 후 → 할아버지 전용 LoRA 학습 (15~20장)
- trigger word: `grandpa_scientist`
- LoRA weight: 0.7~0.9

### 씬별 프롬프트 선택 가이드
| 씬 | 사용 프롬프트 |
|----|-------------|
| Scene 1-3 (마이크로 렌즈 건네기) | Prompt 01 + 03 (미소) + 06 (다락방) |
| Scene 4-2 (무전 교신) | Prompt 04 (놀람) + 07 (반사상) |
| Scene 5-2 (초은이 이야기 듣기) | Prompt 03 (미소) |
| Scene 6-1 (다음 화 예고) | Prompt 03 (미소) 변형 |
