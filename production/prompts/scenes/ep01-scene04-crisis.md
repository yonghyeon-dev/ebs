# EP01 Scene 4: 위기와 해결 (1:30~2:15)

<!-- 미시 세계 위기. 물방울이 흔들리고, 할아버지의 조언으로 표면장력을 이용해 위기를 해결하는 클라이맥스 -->

> **비주얼 레이어**: 미시 세계
> **스타일 톤**: 초현실 프리즘 — 불안정→긴장→안정 회복의 감정 곡선
> **1화 색감**: 무지개 + 투명 블루 (위기 시 색감 불안정화 → 해결 후 복원)
> **생성 도구**: ComfyUI (animagineXL v3.1) + Kling/Runway ComfyUI 노드 (motion effects)

---

## Sub-Scene 4-1: 물방울 흔들림 (1:30~1:50)

<!-- 바람이 불어 물방울이 나뭇잎에서 떨어지려 함. 프리즘 세계가 왜곡되며 진동하고 물벽이 출렁이는 긴장 장면 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
1girl, child, creature, dramatic, action,
fantasy, surreal, prismatic, iridescent, crystal, transparent, rainbow,
inside water droplet, molecular structure, light refraction,
prismatic world violently shaking and distorting,
transparent water walls trembling and bulging dangerously,
light spectrum fragmenting and flickering,
prismatic colors stretching and warping, spherical drop deforming,
external wind force, massive pressure waves on walls,
girl and tardigrade struggling to maintain balance,
wide stance, alarmed expression, wind-blown hair,
tardigrade gripping molecular surface with 8 legs, worried eyes,
water molecules breaking bonds, gaps forming in molecular chain,
handheld camera shake, rapid zoom-out, unstable shape,
color shift warm prismatic to anxious blue-violet,
crystalline structures cracking and fracturing,
light pillars tilting and flickering,
sense of imminent danger, microscopic universe collapse,
scientific accuracy, wind pressure differential, surface tension vs gravity
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
calm peaceful scene, serene atmosphere, relaxed characters,
stable geometry, warm happy lighting, golden hour,
watercolor style, flat 2D, no depth,
explosion, fire, lava, horror gore, blood,
characters smiling or relaxed, ocean storm,
monochrome, completely desaturated
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.0 |
| Sampler | euler / normal |
| Steps | 30 |
| Seed | seed: 5401 기준 |
| ControlNet | None (불안정한 자유로운 왜곡 표현) |

### 생성 가이드

- 핸드헬드 흔들림: Kling/Runway ComfyUI 노드의 motion effects로 카메라 쉐이크 적용
- 색감 변화 전략:
  - 안정 상태: 밝은 무지개 + 투명 블루
  - 위기 상태: 색감이 불안정하게 깜빡이며, 따뜻한 톤이 차가운 블루-바이올렛으로 이동
  - 색수차(chromatic aberration) 효과로 불안감 표현
- 물방울 변형: 구형에서 찌그러진 타원형으로 변형. 한쪽 벽이 위험하게 늘어남
- 물 분자 체인 파손: 표면의 물 분자 손잡기 체인에서 일부 결합이 끊어지는 모습 (위기 시각화)
- 키프레임 3장: (A) 첫 흔들림 감지, (B) 최대 변형 — 물방울이 나뭇잎에서 거의 떨어질 뻔, (C) 긴장 속 균형 유지
- 사운드 싱크 포인트: 진동음 + 긴장 음악 시작

---

## Sub-Scene 4-2: 할아버지 무전 (1:50~2:00)

<!-- 할아버지 목소리 "표면장력을 이용해!" — 무전기에서 목소리가 빛의 파동으로 시각화. 할아버지 얼굴이 물방울 표면에 비침 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
1girl, child, creature, 1boy, elderly man,
fantasy, surreal, prismatic, iridescent, crystal, transparent, rainbow,
inside water droplet, molecular structure, light refraction,
radio communication visualized in microscopic prismatic world,
sound waves transforming into rippling light waves,
concentric rings of warm golden light expanding outward from small radio device,
grandfather's kind elderly face reflected and refracted on curved water drop surface,
reflection warped by spherical water surface, warm wise expression, prismatic fragments,
warm guiding light cutting through anxious blue-violet atmosphere,
golden sound-light waves bringing warmth back,
girl holding small communication device, looking up with hope,
tardigrade beside her, curious wide eyes at light waves,
close-up composition, radio in foreground, light wave ripples expanding,
grandfather face visible on water wall surface in background,
color transition, blue-violet warming with grandfather's golden light,
scientific accuracy, sound compression waves, electromagnetic radiation, oscillating light patterns
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
realistic radio, modern smartphone,
dark scary voice, villain communication, grandfather angry or stern,
watercolor style, flat 2D, no wave propagation effect, no light ripples, static image,
monochrome, desaturated,
horror atmosphere, dark spirits, ghostly face
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.5 |
| Sampler | dpmpp_2m / karras |
| Steps | 30 |
| Seed | seed: 5501 기준 |
| ControlNet | Depth (파동 원근감) |

### 생성 가이드

- 음파→빛 파동 변환: 무전기에서 나오는 할아버지 목소리가 미시 세계에서는 빛의 동심원 파동으로 시각화
- 할아버지 얼굴 반사: 물방울 표면(내부에서 본)에 할아버지 얼굴이 어렴풋이 비침. 볼록렌즈 왜곡 적용
- 감정 전환 핵심: 이 씬에서 불안(블루-바이올렛) → 희망(골든 웜톤)으로 색감이 서서히 변화 시작
- 할아버지 대사 "표면장력을 이용해!" — 이 대사가 다음 서브씬의 액션을 유도
- 키프레임 2장: (A) 무전기에서 빛 파동이 퍼지기 시작, (B) 할아버지 얼굴이 물벽에 나타남

---

## Sub-Scene 4-3: 협력 해결 (2:00~2:15)

<!-- 초은이와 뭉이가 물 분자들의 결합력을 이용해 물방울 안정시킴. 분자들이 더 단단히 손잡고, 프리즘 세계가 복원됨 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
1girl, child, creature, running, dynamic pose, action, triumphant,
fantasy, surreal, prismatic, iridescent, crystal, transparent, rainbow,
inside water droplet, molecular structure, light refraction,
tiny girl and tardigrade helping water molecules strengthen bonds,
pushing water molecule characters together, determined encouraging expression,
tardigrade using 8 legs to bridge gaps in molecular chain,
water molecules personified as small round blue figures gripping each other tightly,
molecular chains tightening and multiplying on water drop surface,
hydrogen bonds, brilliant glowing blue-white energy threads strengthening,
water drop restoring to perfect stable sphere shape,
prismatic world calming, light spectrum stabilizing, harmonious rainbow,
crystalline structures reforming and healing,
warm prismatic rainbow restored, transparent blue,
warm golden light flooding back,
wide camera angle, entire water drop interior stabilizing,
triumphant teamwork, high five, hand to stubby leg,
glowing restoration effect, ripple of healing light,
scientific accuracy, surface tension restored, molecular cohesive forces, hydrogen bonds
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
still in crisis, continued danger, dark atmosphere, anxiety, fear, sad ending,
characters giving up, defeated expressions,
watercolor style, flat 2D, no depth,
monochrome, desaturated,
magic wand solution, unrealistic instant fix,
solo, explosion, destruction effect
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.5 |
| Sampler | dpmpp_2m / karras |
| Steps | 35 |
| Seed | seed: 5601 기준 |
| ControlNet | OpenPose (협력 포즈 가이드) |
| IP-Adapter | weight 0.5 |

### 생성 가이드

- 해결 과정은 점진적이어야 함 (마법처럼 한순간에 해결되지 않음):
  1. 초은이와 뭉이가 분자 체인의 끊어진 부분으로 달려감
  2. 물 분자들을 물리적으로 가까이 밀어서 결합을 돕는 모습
  3. 결합이 강화되며 물방울 표면이 서서히 안정화
  4. 최종적으로 완전한 구형 복원 + 프리즘 빛 안정
- 색감 복원: 블루-바이올렛(위기) → 따뜻한 무지개 + 투명 블루(안정) 점진 전환
- 키프레임 2장:
  - (A) 초은이와 뭉이가 분자 틈으로 달려감 (결의에 찬 표정)
  - (B) 복원 완료 — 안정된 프리즘 세계 + 하이파이브
- 교육 포인트: "물 분자들이 서로 강하게 잡아당기면(수소결합) 표면장력이 강해져서 물방울이 안정된다"
- 하이파이브 순간: 초은이 작은 손과 뭉이의 뭉툭한 앞다리가 맞닿는 귀여운 장면
