import { describe, it, expect } from '@ohos/hypium'
import { SwiftUIMetricItem } from '@kaworunagisa_hhl/theme'

export default function localUnitTest() {
  describe('SwiftUIMetricRail', () => {
    it('accepts_multiple_metric_items', 0, () => {
      const items: SwiftUIMetricItem[] = [
        { title: 'A', value: '1' },
        { title: 'B', value: '2' },
        { title: 'C', value: '3' }
      ]
      expect(items.length).assertEqual(3)
      expect(items[2].value.toString()).assertEqual('3')
    })
  })
}
