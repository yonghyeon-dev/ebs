# EP01 Scene 5: 결말 (2:15~2:45)

<!-- 미시 세계 마무리 + 현실 복귀. 보석빛 물방울의 클라이맥스 비주얼과 수채화풍 현실 세계로의 귀환 -->

> **비주얼 레이어**: 미시 세계(5-1) → 현실 세계(5-2)
> **스타일 톤**: 초현실 프리즘 감동 절정(5-1) → 따뜻한 수채화 복귀(5-2)
> **1화 색감**: 무지개 + 투명 블루 → 따뜻한 골든아워
> **생성 도구**: Kling/Runway ComfyUI 노드 (cinematic lighting) + ComfyUI (animagineXL v3.1)

---

## Sub-Scene 5-1: 보석빛 물방울 (2:15~2:30)

<!-- 햇빛이 비치며 물방울 전체가 보석처럼 빛남. 뭉이에게 인사하는 이별의 순간. 미시 세계 비주얼 최고조 -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
1girl, child, creature, waving, farewell, emotional,
fantasy, surreal, prismatic, iridescent, crystal, transparent, rainbow,
inside water droplet, molecular structure, light refraction,
interior of water drop flooded with brilliant sunlight from above,
prismatic world transformed into jewel-like radiance,
water drop glowing like precious gemstone, diamond-like brilliance,
rainbow light refractions at maximum intensity, full visible spectrum,
crystalline structures blazing with captured sunlight, prismatic fire,
light caustics, intricate mandala-like patterns on water walls,
girl waving goodbye to tardigrade, bittersweet emotional moment,
warm grateful smile, hand raised in farewell wave,
tardigrade looking up with big glistening eyes, tiny prismatic tear,
slow 360-degree camera rotation, gradual zoom-out,
warm emotional golden-rainbow lighting,
water molecules gently pulsing with harmonious bioluminescent glow,
profound beauty in microscopic world, awe, gentle sadness of parting,
scientific accuracy, sunlight all visible wavelengths, full spectrum dispersion
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
dark gloomy farewell, tragic separation, crying in despair,
horror, scary, nightmarish,
dull flat lighting, no spectral brilliance,
watercolor style, flat 2D, no volumetric god rays,
monochrome, desaturated, muted colors,
characters ignoring each other,
empty minimalist space, incorrect light physics
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 7.0 |
| Sampler | dpmpp_2m / karras |
| Steps | 35 |
| Seed | seed: 5701 기준 (미시 세계 시드 계열) |
| ControlNet | Depth (공간감 극대화) |
| IP-Adapter | weight 0.6 (캐릭터 감정 표현 중요) |

### 생성 가이드

- 이 씬은 미시 세계 비주얼의 최고조 — 가장 아름다운 장면이어야 함
- 슬로우 360도 회전 → 줌아웃: 파노라마 이미지 생성 후 Kling/Runway ComfyUI 노드로 cinematic lighting 카메라 워크 구현
- 빛 연출:
  - 위에서 들어오는 햇빛이 물방울 내부에서 산란, 굴절되며 모든 방향으로 무지개빛 발산
  - 물방울이 보석(다이아몬드/오팔)처럼 내부에서 빛나는 느낌
  - 물벽 표면에 만다라 패턴의 코스틱(빛 무늬) 투영
- 이별 연출:
  - 초은이: 따뜻한 미소로 손을 흔드는 모습. 그리움과 감사가 섞인 표정
  - 뭉이: 큰 눈에 프리즘 빛깔 눈물 한 방울. 아쉬워하면서도 다정한 표정
  - 두 캐릭터 사이의 거리가 점점 벌어지는 구도 (줌아웃과 함께)
- 키프레임 2장:
  - (A) 초은이와 뭉이가 서로를 바라보며 인사 (감정 절정)
  - (B) 줌아웃 — 찬란한 물방울 전경, 초은이 실루엣이 빛 속으로 사라져감
- 과학 포인트: 햇빛(백색광)이 물방울에 들어갈 때 각 파장별 굴절률 차이로 전체 스펙트럼이 분산 — 실제 무지개의 원리와 동일

---

## Sub-Scene 5-2: 현실 복귀 (2:30~2:45)

<!-- 초은이가 미시 세계에서 빠져나와 현실 정원으로 돌아옴. 수채화풍으로 스타일 복귀. "할아버지, 물방울 속에 우주가 있었어!" -->

### Positive Prompt

```
masterpiece, best quality, absurdres, highres,
1girl, child, 7 years old, korean,
watercolor (medium), illustration, warm colors, hand-painted texture, soft brush strokes,
short bob hair, black hair, single braid, blue bead hair tie, slightly disheveled,
pastel mint vest, cream long sleeve shirt, khaki cargo shorts, oversized pockets,
mismatched socks, brown lace-up boots, brass magnifying glass, leather cord necklace,
holding magnifying glass in one hand, other hand gesturing excitedly,
excited joyful expression, eyes sparkling with wonder, mouth open mid-speech,
warm late afternoon golden sunlight, garden,
cozy garden background, trees, flowers, glistening wet leaves,
medium shot, waist up, transitioning to close-up,
rosy cheeks flushed from excitement, watercolor skin tones,
soft bokeh garden background, warm color palette,
single water drop on nearby leaf, tiny rainbow glint,
children's animation, warm atmosphere,
accomplishment, wonder, return to safety
```

### Negative Prompt

```
lowres, bad anatomy, bad hands, text, error, worst quality, low quality, normal quality,
jpeg artifacts, signature, watermark, blurry, 3d, photorealistic,
surreal prismatic style,
dark mood, sad expression, crying, traumatized,
adult proportions, mature face, makeup,
oversaturated neon colors, harsh shadows, cold lighting,
deformed face, extra fingers, mutated hands,
indoor scene, urban, night time,
calm quiet expression, microscopic world elements
```

### Parameters

| 항목 | 권장값 |
|------|--------|
| Model | animagineXL v3.1 + IP-Adapter (Choeun 얼굴 일관성) |
| Resolution | 1920 x 1080 (16:9) |
| CFG Scale | 6.5 |
| Sampler | euler / normal |
| Steps | 30 |
| Seed | seed: 2001 기준 (Scene 1 현실 세계 시드 계열로 복귀) |
| ControlNet | OpenPose (포즈 가이드) + IP-Adapter (얼굴 일관성) |
| IP-Adapter | weight 0.6, Choeun reference image |

### 생성 가이드

- 스타일 복귀: Scene 1과 동일한 수채화풍으로 완전 복귀. 미시 세계의 프리즘 스타일은 완전히 사라짐
- 시드 계열: Scene 1의 현실 세계 시드(2001 계열)로 돌아가 환경 일관성 유지
- 초은이 표정 핵심: "할아버지, 물방울 속에 우주가 있었어!" 대사에 맞는 흥분된 표정
  - 눈: 별빛 하이라이트가 평소보다 더 밝게 — 미시 세계 경험의 여운
  - 입: 활짝 열고 이야기하는 중
  - 볼: 신나서 상기된 홍조
- 물방울 힌트: 배경의 나뭇잎 위에 아직 물방울이 하나 남아있고, 햇빛에 작은 무지개가 비침 (미시 세계가 실재했음을 암시)
- 미디엄 샷 → 클로즈업 전환은 두 장의 이미지를 생성 후 Kling/Runway ComfyUI 노드로 카메라 무브먼트 연결
- 색온도: Scene 1과 동일한 따뜻한 골든아워 톤 (색 일관성)
- 할아버지는 이 씬에서 목소리만 등장 (프레임 밖). 별도 이미지 불필요
