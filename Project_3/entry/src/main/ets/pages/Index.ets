@Entry
@Component
struct Index {
  @State isOn: boolean = false;
  @State lampBrightness:number = 60;
  build() {
    Column({space:22}) {
      Text('智能台灯控制器')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)

      Column({space:16}) {
        Text(this.isOn ? '💡' : '🌙')
          .fontSize(96)

        Text(this.isOn ? '台灯开启' : '台灯关闭')
          .fontSize(22)
          .fontWeight(FontWeight.Medium)

        Text(this.isOn ? `当前亮度 ${Math.round(this.lampBrightness)}%` : '开启后可以调节亮度')
          .fontSize(15)
          .fontColor('#667085')
      }
      .width('100%')
      .height(280)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(this.isOn ? '#FFF4BF' : '#E8EDF5')
      .opacity(this.isOn ? 0.4 + this.lampBrightness / 160 : 1)
      .borderRadius(24)

      Row() {
        Text('电源')
          .fontSize(17)
          .fontWeight(FontWeight.Medium)

        Toggle({ type: ToggleType.Switch, isOn: this.isOn })
          .onChange((value : boolean) => {
            this.isOn = value;
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      if (this.isOn){
        Column({space:8}) {
          Row() {
            Text('亮度')
              .fontSize(16)
            Blank()
            Text(`${Math.round(this.lampBrightness)}%`)
              .fontColor('#246BFD')
          }

          Slider({value:this.lampBrightness, min:1, max:100, step:1})
            .onChange((value: number) => {
              this.lampBrightness = value;
            })
        }
        .width('100%')
      }

      Button(this.isOn ? '关闭台灯' : '打开台灯')
        .width('100%')
        .height(48)
        .borderRadius(14)
        .backgroundColor(this.isOn ? '#344054' : '#246BFD')
        .onClick(() => {
          this.isOn = !this.isOn;
        })
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F8FAFC')
  }
}