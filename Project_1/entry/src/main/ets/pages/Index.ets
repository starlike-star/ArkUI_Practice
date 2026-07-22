@Entry
@Component
struct Index {
  @State interactionCount:number = 0;

  private getStatusText():string{
    if(this.interactionCount === 0){
      return '开始';
    }
    if(this.interactionCount < 3){
      return '继续';
    }
    return '完成';
  }

  private  getStatusColor():string{
    if (this.interactionCount === 0) {
      return '#E9EEF5';
    }
    if (this.interactionCount < 3) {
      return 'DCE9FF';
    }
    return '#DDF7E8';
  }

  private getEncouragment():string{
    if(this.interactionCount === 0){
      return '第一次状态更新';
    }
    if(this.interactionCount < 3){
      return '多操作几次观察页面变化';
    }
    return '已经看到了同一状态如何驱动多处界面'
  }

  build() {
    Column({space:18}){
      Text('ArkUI项目化学习')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor('#172033')

      Text('从第一个页面开始')
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .fontColor('#667085')

      Column({space:10}) {
        Text(this.getStatusText())
          .fontSize(22)
          .fontWeight(FontWeight.Medium)
          .fontColor('#1D4E89')

        Text(`已完成 ${this.interactionCount} 次互动`)
          .fontSize(16)
          .fontColor('#344054')
      }
      .width('100%')
      .padding(22)
      .borderRadius(18)
      .backgroundColor(this.getStatusColor())

      Button('开始学习')
        .width('100%')
        .height(50)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .backgroundColor('#246BFD')
        .borderRadius(14)
        .onClick(() => {
          this.interactionCount += 1;
        })

      Text(this.getEncouragment())
        .fontSize(15)
        .fontColor('#475467')
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F4F7FB')
  }
}