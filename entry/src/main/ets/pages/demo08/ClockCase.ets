import reminderAgentManager from '@ohos.reminderAgentManager'
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct ClockCase {
  reminderId = 0

  build() {
    Column({ space: 15 }) {
      Button('添加闹铃')
        .onClick(async () => {
          let targetReminderAgent: reminderAgentManager.ReminderRequestAlarm = {
            // 提醒类型为闹钟类型
            reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
            // 指明提醒的目标时刻
            hour: 4,
            // 指明提醒的目标分钟
            minute: 12,
            // 指明每周哪几天需要重复提醒
            daysOfWeek: [],
            // 响铃时长秒
            ringDuration: 60,
          }
          // 记录id 清理使用
          this.reminderId = await reminderAgentManager.publishReminder(targetReminderAgent)
          promptAction.showToast({ message: '添加闹铃成功' })
        })
      Button('取消闹铃')
        .onClick(async () => {
          // 不能退出应用，否则 this.reminderId 是 null，开发的时候可以持久化
          await reminderAgentManager.cancelReminder(this.reminderId)
          promptAction.showToast({ message: '取消闹铃成功' })
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}