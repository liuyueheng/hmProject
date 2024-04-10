import common from '@ohos.app.ability.common'

@Entry
@Component
struct PayIndex {
  @StorageProp("order_id")
  orderId: number = 0

  build() {
    Column() {
      Text("订单号：" + this.orderId.toString())
      Button("支付").onClick(() => {
        const context = getContext(this) as common.UIAbilityContext
        context.terminateSelfWithResult({
          resultCode: 1,
          want: {
            abilityName: 'EntryAbility',
            bundleName: 'com.betawm.baw',
            parameters: {
              paySuccess: false,
              payOrderId: Date.now()
            }
          }
        })
      })
    }
  }
}