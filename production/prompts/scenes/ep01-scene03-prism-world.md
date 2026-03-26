# EP01 Scene 3: 뭉이와의 만남 (0:45~1:30)

<!-- 미시 세계 본편. 물곰 뭉이 등장, 프리즘 세계 탐험, 표면장력 서핑. 초현실 비주얼 최고조 -->

> **비주얼 레이어**: 미시 세계
> **스타일 톤**: AI 초현실 프리즘, 신비로운 무지개빛 세계
> **1화 색감**: 무지개 + 투명 블루 (프리즘 굴절, 투명한 구체, 빛의 스펙트럼)
> **생성 도구**: ComfyUI (animagineXL v3.1) + Kling/Runway ComfyUI 노드 (img2video)

---

## Sub-Scene 3-1: 뭉이 등장 (0:45~1:00)

<!-- 물곰(타디그레이드) 뭉이가 8개 다리로 뒤뚱뒤뚱 다가옴. 귀엽고 둥글둥글한 체형. 로우앵글에서 정면 클로즈업으로 전환 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
no humans, creature, fantasy, surreal,
prismatic, iridescent, crystal, transparent, rainbow,
cute tardigrade character, water bear, micro-organism,
8 stubby chubby legs, translucent round plump body,
big friendly innocent eyes, bioluminescent glow, gentle sleepy smile,
soft translucent skin, internal iridescent organs visible,
prismatic rainbow light passing through translucent body,
microscopic scale, standing on water molecule surface,
rainbow prismatic background, floating light spectrum particles,
low angle, looking up, then frontal close-up,
H2O molecular structure on ground, large blue spheres oxygen, small white spheres hydrogen,
transparent blue atmosphere, rainbow caustic overlay,
bioluminescent ambient lighting, crystalline light pillars in background,
warm friendly character introduction, wonder, cuteness,
scientific accuracy, tardigrade body structure, 4 pairs of legs, round segmented body
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
realistic gross insect, scary bug, creepy crawly, horror creature,
dark atmosphere, gloomy, sharp spiky body, aggressive posture, menacing expression,
watercolor style, flat 2D, no depth,
oversized character, ocean scene, underwater reef, marine environment
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 + IP-Adapter (Moongi 캐릭터 일관성) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.5 |
| Sampler | dpmpp_2m / karras |
| Steps | 35 |
| Seed | seed: 5101 기준 (미시 세계 시드 5001 계열 유지) |
| ControlNet | OpenPose (뭉이 포즈 가이드) + IP-Adapter (캐릭터 일관성) |
| IP-Adapter | weight 0.7, Moongi reference image |

### 생성 가이드

- 로우앵글 → 정면 클로즈업 전환은 두 장의 이미지를 생성 후 Kling/Runway ComfyUI 노드로 카메라 무브먼트 연결
- 뭉이 체형: 실제 타디그레이드를 베이스로 하되, 둥글둥글하고 귀여운 캐릭터로 변환. 통통한 몸에 짧고 뭉툭한 다리 8개
- 뭉이 투명도: 몸체가 반투명해서 내부에 프리즘 빛이 통과하는 모습 (젤리 같은 느낌)
- 눈 표현: 크고 둥근 눈에 별빛 하이라이트, 졸린 듯하면서도 다정한 표정
- 배경은 Scene 2-2에서 확립된 물방울 내부 프리즘 세계를 그대로 유지 (seed 5001 계열)
- 물 분자 바닥: H2O 분자를 큰 파란 구(산소) + 작은 흰 구 2개(수소)로 표현, 뭉이가 그 위를 걸어옴
- 과학 포인트: 물곰은 실제 극한 환경에서 생존하는 미시 생물체 (0.1~1.5mm) — 물방울 내부에 존재 가능

---

## Sub-Scene 3-2: 프리즘 세계 탐험 (1:00~1:15)

<!-- 초은이와 뭉이가 함께 프리즘 세계를 걸어다님. 빛의 스펙트럼이 길처럼 펼쳐지고, 물 분자 구조가 시각화됨 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
1girl, child, creature, walking, side by side,
fantasy, surreal, prismatic, iridescent, crystal, transparent, rainbow,
inside water droplet, molecular structure, light refraction,
tiny girl and cute translucent tardigrade walking through rainbow light tunnel,
light spectrum bands forming glowing pathway,
prismatic spectrum path stretching into infinite distance,
floating light particles, photons, drifting like fireflies,
water molecules, H2O, connected translucent spheres, crystalline lattice,
hydrogen bonds, shimmering blue energy threads,
cathedral-like vast interior space,
rainbow caustic patterns on translucent water walls,
bioluminescent molecular structures, pulsing soft light,
tracking shot, camera moves parallel,
transparent blue atmosphere, full rainbow spectrum overlay,
wonder, friendship, joyful exploration,
water molecule clusters, hexagonal ice-like patterns,
light refracting through molecular structures, mini-rainbows
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
dark tunnel, cave, underground, scary passage,
solo, realistic human proportions,
watercolor style, flat 2D, no depth,
monochrome, desaturated, no rainbow spectrum,
ocean underwater scene, fish, marine life,
static posed image, empty background, incorrect molecular structure
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.5 |
| Sampler | dpmpp_2m / karras |
| Steps | 30 |
| Seed | seed: 5201 기준 |
| ControlNet | Depth (터널 원근감) |
| IP-Adapter | weight 0.5 (원거리 캐릭터이므로 낮은 가중치) |

### 생성 가이드

- 트래킹 샷: 두 캐릭터가 나란히 걷는 것을 옆에서 따라가는 카메라. Kling/Runway ComfyUI 노드로 동적 카메라 워크 구현
- 빛의 길: 바닥에 빨-주-노-초-파-남-보 스펙트럼이 순서대로 펼쳐진 길. 과학적으로 백색광이 프리즘 효과로 분산된 모습
- 물 분자 시각화: 배경 양옆에 H2O 분자 클러스터가 육각형 격자 구조로 배열 (실제 물 분자 수소결합 네트워크 반영)
- 초은이는 원거리 실루엣이므로 디테일보다 포즈와 비율이 중요 — 7세 아이 비율(머리 대비 몸 4~5등신)
- 뭉이는 초은이 무릎 높이로 옆에서 뒤뚱뒤뚱 걸어감
- 분위기: 경이로움과 우정 — 미지의 세계를 함께 탐험하는 설렘

---

## Sub-Scene 3-3: 표면장력 서핑 (1:15~1:30)

<!-- 표면장력 위에서 서핑! 물 표면이 탄력 있는 트램폴린처럼 출렁이고, 물 분자들이 손잡고 있는 모습으로 결합력 시각화 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
1girl, child, creature, dynamic pose, action,
fantasy, surreal, prismatic, iridescent, crystal, transparent, rainbow,
inside water droplet, molecular structure, light refraction,
tiny girl and cute tardigrade surfing joyfully on water surface tension,
elastic transparent water surface, bouncy trampoline membrane,
surface tension membrane, prismatic iridescent sheen,
water molecules personified as small round blue figures holding hands in chain,
molecular chain forming linked barrier at water-air interface,
girl standing with arms spread wide, surfing, hair flowing in motion,
tardigrade sliding alongside, 8 legs spread for balance, happy expression,
dynamic action, tracking shot, slight slow-motion effect,
rainbow light refracting through curved surface,
splash-like ripples of prismatic light spreading from movement,
microscopic world background, prismatic water drop interior,
transparent blue membrane, rainbow reflection highlights,
joyful exhilarating moment, freedom, adventure,
scientific accuracy, surface tension, cohesive forces, water molecules pulling inward,
flexible elastic membrane-like layer
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
ocean surfing, beach waves, realistic water sports, surfboard,
dark scary water, murky liquid, dirty surface,
watercolor style, flat 2D, no depth,
monochrome, desaturated, no rainbow effect,
broken or torn surface membrane, solo
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.0 |
| Sampler | euler / normal |
| Steps | 30 |
| Seed | seed: 5301 기준 |
| ControlNet | OpenPose (서핑 포즈 가이드) |
| IP-Adapter | weight 0.5 |

### 생성 가이드

- 액션 트래킹 + 슬로모션: 두 캐릭터가 표면장력 막 위를 미끄러지는 모습을 옆에서 추적하되 약간의 슬로모션 느낌
- 표면장력 시각화:
  - 물 분자들이 의인화되어 작은 둥근 캐릭터로 표현, 서로 손을 잡고 일렬로 늘어선 모습
  - 표면 막은 반투명 무지개빛 멤브레인으로, 위에서 누르면 탄력 있게 출렁임
  - 교육 포인트: "물 분자들이 서로 잡아당기는 힘(응집력)이 표면에서 막을 만든다"
- 키프레임 2장 생성: (A) 서핑 시작 — 표면 위에 올라서는 순간, (B) 서핑 중 — 속도감 있게 미끄러지는 모습
- Kling/Runway ComfyUI 노드로 동적 모션 구현 (카메라 패닝 + 캐릭터 이동)
- 초은이 포즈: 양팔 벌리고 바람을 맞는 자세, 머리카락이 뒤로 날림
- 뭉이 포즈: 8개 다리를 사방으로 벌리고 배로 미끄러지듯 이동, 즐거운 표정
- 물결 효과: 이동 궤적을 따라 프리즘 빛의 파문이 퍼져나감
