# metric-rail

`metric-rail` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 指标栏组件，用于在页面头图、卡片顶部或概览区横向展示多个指标。组件内部组合独立的 `metric-cell`，默认保持黑色优先的纯色毛玻璃风格，同时开放整栏宽度、单元高度、间距、颜色和圆角。

## 实际运行效果

下面展示多个指标单元组成的横向 like-ios 指标栏：

![metric rail preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/metric-rail@main/docs/metric-rail-preview.gif)

## 安装

```bash
ohpm install metric-rail
```


## 正常使用样式

```ts
import { SwiftUIMetricRail } from 'metric-rail'
import { SwiftUITone } from 'theme'

@Component
struct CareMetricRail {
  build() {
    SwiftUIMetricRail({
      tone: SwiftUITone.GlassBlack,
      items: [
        { title: '任务', value: '8', icon: 'T', color: '#141414' },
        { title: '记录', value: '14', icon: 'R', color: '#333333' },
        { title: '提醒', value: '3', icon: 'A', color: '#5C5C5C' }
      ]
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIMetricRail({
  componentWidth: '100%',
  itemHeight: 42,
  spacing: 10,
  fillColor: '#E6111111',
  tintColor: '#1FFFFFFF',
  customBorderColor: '#33FFFFFF',
  cornerRadius: 8,
  items: [
    { title: '在线', value: '24', icon: 'O', color: '#141414' },
    { title: '异常', value: '2', icon: '!', color: '#5C5C5C' }
  ]
})
```

## SwiftUI 风格链式配置

```ts
import { swiftUIConfig, SwiftUITone } from 'theme'

const glassStyle = swiftUIConfig()
  .withTone(SwiftUITone.SystemGray)
  .withWidth('92%')
  .withHeight('auto')
  .withRadius(8)
  .withFillColor('#E6111111')
  .withTintColor('#22FFFFFF')
  .withBorder('#33FFFFFF', 1)
  .withShadow('#33000000', 16)
  .withPadding(12)

SwiftUIMetricRail({
  config: glassStyle
})
```

`config` 是可选入口，适合复用一组 SwiftUI modifier 风格的外观配置；原有直接传参方式仍然可用，且业务可以继续通过 Builder 注入自定义内容。

## 示例目录

完整最小示例见 `example/SwiftUIMetricRailUsage.ets`。该示例演示了多个指标项的横向展示，适合状态总览、统计栏和卡片顶部摘要。

## 颜色与风格预设

`SwiftUITone` 继续保持三个基础颜色枚举：`GlassBlack`、`PureWhite`、`SystemGray`。如果业务希望更快套用品牌风格，可以从 `theme` 引入 `SwiftUIBrandStyle` 与 `swiftUIConfigForStyle()`，当前提供 `Graphite`、`Mist`、`Ocean`、`Mint`、`Amber`、`Rose`、`Lavender` 七组预设。预设只是快捷入口，仍可继续叠加 `withFillColor()`、`withTintColor()`、`withColor()`、`withAccentColor()`、`withBorder()`、`withShadow()`、`withRadius()`、`withPadding()`、`withSize()`、`withTitleFontSize()`、`withSubtitleFontSize()`、`withTextFontSize()`、`withIconSize()`、`withSpacing()` 等链式方法做高度自定义。

```ts
import { SwiftUIBrandStyle, swiftUIConfigForStyle } from 'theme'

const oceanStyle = swiftUIConfigForStyle(SwiftUIBrandStyle.Ocean)
  .withRadius(8)
  .withPadding(14)
  .withBorder('#6657C7F7', 1.2)
  .withShadow('#241D4ED8', 20)
```

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `config` | `SwiftUIComponentConfig` | 空配置 | SwiftUI modifier 风格链式配置，可覆盖宽高、圆角、颜色、边框、阴影、内边距等通用外观 |
| `items` | `SwiftUIMetricItem[]` | `[]` | 指标数组 |
| `usesContrastFill` | `boolean` | `false` | 是否降低单元强调色填充强度 |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `componentWidth` | `Length` | `'100%'` | 指标栏宽度 |
| `itemHeight` | `Length` | `34` | 单个指标高度 |
| `spacing` | `number` | `8` | 指标之间的间距 |
| `fillColor` | `ResourceColor` | `'#E6111111'` | 单元黑色毛玻璃底色 |
| `tintColor` | `ResourceColor` | 自动色调 | 单元渐变叠色 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 单元边框色 |
| `cornerRadius` | `number` | `8` | 单元圆角 |
