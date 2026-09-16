import { SwiftUIMetricRail } from '@kaworunagisa_hhl/metric-rail'

@Component
export struct SwiftUIMetricRailUsage {
  build() {
    SwiftUIMetricRail({
      items: [
        { title: 'Tasks', value: '12', color: '#235595' },
        { title: 'Done', value: '9', color: '#1E7A50' },
        { title: 'Risk', value: '1', color: '#AF1E1A' }
      ]
    })
  }
}
