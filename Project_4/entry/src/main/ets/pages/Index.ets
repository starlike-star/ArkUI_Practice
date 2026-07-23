@Entry
@Component
struct Index {
  @State account: string = ''
  @State password: string = ''
  @State accepted: boolean = false
  @State role: string = '学生'
  @State message: string = '请输入账号和密码'

  private canSubmit(): boolean {
    return this.account.trim().length >= 4 &&
      this.password.length >= 6 &&
      this.accepted
  }

  private submit(): void {
    if (!this.canSubmit()) {
      this.message = '请检查账号、密码长度和用户协议'
      return
    }

    this.message = `${this.role}账号 ${this.account} 校验通过`
  }

  build() {
    Column({ space: 16 }) {
      Text('校园账号登录')
        .fontSize(28)
        .fontColor(this.canSubmit() ? '#158030' : '#667085')

      TextInput({
        text: this.account,
        placeholder: '请输入学号或者工号'
      })
        .height(48)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .onChange((value: string) => {
          this.account = value
        })

      TextInput({
        text: this.password,
        placeholder: '密码不少于6位'
      })
        .type(InputType.Password)
        .height(48)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .onChange((value: string) => {
          this.password = value
        })

      Row({ space: 12 }) {
        Text('身份')
          .fontSize(16)

        Select([
          { value: '学生' },
          { value: '教师' }
        ])
          .selected(this.role === '学生' ? 0 : 1)
          .onSelect((index: number) => {
            this.role = index === 0 ? '学生' : '教师'
          })
      }
      .width('100%')

      Row({ space: 8 }) {
        Checkbox()
          .select(this.accepted)
          .onChange((value: boolean) => {
            this.accepted = value
          })

        Text('我已阅读并同意《用户协议》和《隐私政策》')
          .fontSize(14)
          .fontColor('#475467')
      }
      .width('100%')

      Text(this.message)
        .fontSize(14)
        .fontColor(this.canSubmit() ? '#158030' : '#667085')

      Button('登录')
        .width('100%')
        .height(50)
        .borderRadius(14)
        .enabled(this.canSubmit())
        .backgroundColor(this.canSubmit() ? '#246BFD' : '#AAB4C3')
        .onClick(() => {
          this.submit()
        })
    }
    .width('100%')
    .height('100%')
    .padding(26)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F5F7FB')
  }
}