import { SWIFT_UI_SPACING_SMALL, SwiftUIMetricItem, SwiftUITone } from 'theme'
import { SwiftUIMetricCell } from 'metric-cell'

@Component
export struct SwiftUIMetricRail {
  @Prop items: SwiftUIMetricItem[] = []
  @Prop usesContrastFill: boolean = false
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = '100%'
  @Prop itemHeight: Length = 34
  @Prop spacing: number = SWIFT_UI_SPACING_SMALL
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop cornerRadius: number = 8

  build() {
    Row({ space: this.spacing }) {
      ForEach(this.items, (item: SwiftUIMetricItem) => {
        SwiftUIMetricCell({
          item: item,
          usesContrastFill: this.usesContrastFill,
          tone: this.tone,
          componentHeight: this.itemHeight,
          fillColor: this.fillColor,
          tintColor: this.tintColor,
          customBorderColor: this.customBorderColor,
          cornerRadius: this.cornerRadius
        })
          .layoutWeight(1)
      }, (item: SwiftUIMetricItem) => `${item.title}_${item.value}`)
    }
    .width(this.componentWidth)
  }
}
