import { SWIFT_UI_SPACING_SMALL, SwiftUIComponentConfig, SwiftUIMetricItem, SwiftUITone } from 'theme'
import { SwiftUIMetricCell } from 'metric-cell'

@Component
export struct SwiftUIMetricRail {
  @Prop items: SwiftUIMetricItem[] = []
  @Prop config: SwiftUIComponentConfig = new SwiftUIComponentConfig()
  @Prop usesContrastFill: boolean = false
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = '100%'
  @Prop itemHeight: Length = 34
  @Prop spacing: number = SWIFT_UI_SPACING_SMALL
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop cornerRadius: number = 8

  private resolvedTone(): SwiftUITone {
    return this.config.tone === undefined ? this.tone : this.config.tone
  }

  private resolvedWidth(): Length {
    return this.config.width === undefined ? this.componentWidth : this.config.width
  }

  private resolvedItemHeight(): Length {
    return this.config.height === undefined ? this.itemHeight : this.config.height
  }

  private resolvedSpacing(): number {
    return this.config.spacing === undefined ? this.spacing : this.config.spacing
  }

  private resolvedFillColor(): ResourceColor {
    return this.config.fillColor === undefined ? this.fillColor : this.config.fillColor
  }

  private resolvedTintColor(): ResourceColor {
    return this.config.tintColor === undefined ? this.tintColor : this.config.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    return this.config.borderColor === undefined ? this.customBorderColor : this.config.borderColor
  }

  private resolvedCornerRadius(): number {
    return this.config.cornerRadius === undefined ? this.cornerRadius : this.config.cornerRadius
  }

  build() {
    Row({ space: this.resolvedSpacing() }) {
      ForEach(this.items, (item: SwiftUIMetricItem) => {
        SwiftUIMetricCell({
          item: item,
          usesContrastFill: this.usesContrastFill,
          tone: this.resolvedTone(),
          componentHeight: this.resolvedItemHeight(),
          fillColor: this.resolvedFillColor(),
          tintColor: this.resolvedTintColor(),
          customBorderColor: this.resolvedBorderColor(),
          cornerRadius: this.resolvedCornerRadius()
        })
          .layoutWeight(1)
      }, (item: SwiftUIMetricItem) => `${item.title}_${item.value}`)
    }
    .width(this.resolvedWidth())
  }
}
