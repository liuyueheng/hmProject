import http from '@ohos.net.http'

/**
 * async和await需要搭配使用
 * Http(1. await会强制等待后面的promise进行resolve 2. await和await必须配套使用)
 ● 嵌套更新数据的方式 (1. ...延展运算发 2. 通过new的方式)
 */
@Entry
@Component
struct HttpCase {
  @State
  str: string = ""

  aboutToAppear() {
    this.getData()
  }

  async getData() {
    try {
      const req = http.createHttp()
      const res = await req.request("https://zhoushugang.gitee.io/fe2022/takeaway.json")
      this.str = res.result as string
    } catch (e) {
      AlertDialog.show({ message: "请求失败" })
    }
  }

  build() {
    Column() {
      Text(this.str)
    }
  }
}