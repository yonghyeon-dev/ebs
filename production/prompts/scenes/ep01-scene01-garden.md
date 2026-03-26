# EP01 Scene 1: 정원의 발견 (0:00~0:30)

<!-- 현실 세계 — 수채화풍 따뜻한 톤. 비 갠 오후 정원에서 초은이가 물방울을 발견하는 도입부 -->

> **비주얼 레이어**: 현실 세계
> **스타일 톤**: 따뜻한 수채화 느낌, 손그림 질감, 부드럽고 친근한 톤
> **1화 색감**: 무지개 + 투명 블루 (물방울 클로즈업에서 시작)
> **생성 도구**: ComfyUI (animagineXL v3.1, Danbooru 태그 기반)

---

## Sub-Scene 1-1: 정원 전경 (0:00~0:10)

<!-- 비 갠 오후 정원. 와이드 샷에서 서서히 줌인하며 촉촉한 정원의 온기를 전달 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
scenery, landscape, no humans,
watercolor (medium), illustration, warm colors, hand-painted texture, soft brush strokes,
garden, after rain, late afternoon, golden sunlight, sunbeams, clouds,
lush vegetation, flower bed, colorful flowers, wet grass, water droplets on leaves, glistening,
warm color palette, soft yellow, green, muted pink,
atmospheric perspective, depth of field, lens flare, volumetric lighting, mist,
wide shot, establishing shot, serene, peaceful,
16:9 aspect ratio, animation background
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
harsh shadows, dark mood, horror, night scene, urban, indoor,
oversaturated neon colors, flat lighting, monochrome,
deformed plants, floating objects, impossible geometry
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 (Danbooru 태그 기반) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.0 |
| Sampler | euler / normal |
| Steps | 30 |
| Seed | 고정 후 배리에이션 (seed: 1001 기준, variation 0.1~0.3) |
| ControlNet | None (배경 전용) |

### 생성 가이드

- 와이드 → 줌인 트랜지션은 두 장의 이미지(와이드/미디엄)를 생성 후 Kling/Runway ComfyUI 노드로 카메라 무브먼트 적용
- 물방울 반짝임은 후반 합성(After Effects)에서 글리터 이펙트로 추가
- 색온도: 따뜻한 골든아워 톤 (color temperature ~5500K 느낌)
- 정원 레퍼런스: 한국 시골집 정원 + 유럽식 코티지 가든 혼합

---

## Sub-Scene 1-2: 초은이 등장 (0:10~0:20)

<!-- 초은이가 정원에서 놀다가 나뭇잎 위 물방울 발견. 호기심 가득한 표정의 미디엄→클로즈업 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
1girl, child, 7 years old, korean,
watercolor (medium), illustration, warm colors, hand-painted texture, soft brush strokes,
short bob hair, black hair, single braid, blue bead hair tie, round face, large eyes, dark brown eyes,
pastel mint vest, cream long sleeve shirt, khaki cargo shorts, oversized pockets,
mismatched socks, brown lace-up boots, brass magnifying glass, leather cord necklace,
holding magnifying glass, looking through, examining water droplet on leaf,
curious expression, sparkling eyes, wonder,
medium shot, soft focus background, garden,
warm afternoon sunlight, rosy cheeks, gentle shading,
bokeh background, green foliage, children's animation,
expressive eyes, subtle smile
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
adult proportions, mature face, makeup, glamorous,
dark mood, horror, scary expression,
oversaturated, flat lighting, harsh shadows,
deformed face, extra fingers, mutated hands,
wrong eye direction, cross-eyed, asymmetric face
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 + IP-Adapter (Choeun 얼굴 일관성) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.5 |
| Sampler | euler / normal |
| Steps | 30 |
| Seed | 캐릭터 일관성용 고정 seed (seed: 2001) |
| ControlNet | OpenPose (포즈 가이드) + IP-Adapter (얼굴 일관성) |
| IP-Adapter | weight 0.6, Choeun reference image |

### 생성 가이드

- 미디엄 샷과 클로즈업 두 장 개별 생성 → Kling/Runway ComfyUI 노드로 카메라 무브먼트 연결
- IP-Adapter로 초은이 얼굴 일관성 유지 (레퍼런스 이미지 필수)
- 표정 핵심: "눈이 반짝이는 호기심" — 동공에 하이라이트 두 점, 살짝 벌린 입
- 돋보기는 금속 테두리 + 유리 렌즈의 빛 반사 디테일 포함

---

## Sub-Scene 1-3: 물방울 클로즈업 (0:20~0:30)

<!-- 나뭇잎 위 물방울 매크로 샷. 물방울 안에 무지개빛 굴절 반사. 할아버지가 마이크로 렌즈 건넴. 현실→미시 세계 전환 직전의 결정적 순간 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
scenery, no humans, macro, close-up,
watercolor (medium), illustration, warm colors,
single water droplet, sitting on green leaf, extreme close-up,
rainbow light refraction inside water drop, prismatic spectrum,
distorted garden landscape reflected through spherical water surface,
transparent water, internal caustics, crystal clear,
surface tension visible at contact point with leaf,
leaf vein texture beneath the drop, morning dew,
tiny rainbow arcs inside the drop, hidden universe,
soft bokeh background, warm watercolor garden, prismatic blue hints,
golden sunlight, spectral highlights,
scientific accuracy, convex lens effect
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
flat water, opaque liquid, no refraction, no rainbow, dull gray water,
dirty water, muddy, contaminated appearance,
multiple water drops, splashing water,
dead leaf, brown dried plant, wilted vegetation,
artificial looking, plastic, incorrect refraction physics, inverted reflection
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 7.0 |
| Sampler | dpmpp_2m / karras |
| Steps | 35 |
| Seed | seed: 3001 기준 |
| ControlNet | Depth (물방울 입체감) |

### 생성 가이드

- 이 씬은 현실→미시 세계 전환의 브릿지 역할. 수채화 톤을 유지하되 물방울 내부에 프리즘 색감 힌트
- 물방울 내부 굴절은 과학적으로 정확해야 함: 볼록렌즈 효과로 배경이 상하 반전되어 보임 (실제 물방울 광학)
- 할아버지 손이 프레임 가장자리에서 마이크로 렌즈(안경형 장치)를 건네는 모습은 별도 레이어로 합성
- 줌인 애니메이션은 Kling/Runway ComfyUI 노드에서 처리 (이 이미지가 Scene 2 트랜지션의 시작점)
- 물방울 크기 대비 주변부 보케가 자연스럽게 수채화 질감으로 녹아야 함
