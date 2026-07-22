@Entry
@Component
struct Index {
  @State liked: boolean = false

  build() {
    Column({ space: 18 }) {
      Stack({ alignContent: Alignment.BottomEnd }) {
        Text('徐')
          .width(96)
          .height(96)
          .borderRadius(48)
          .fontSize(42)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .backgroundColor('#FF8C00')

        Text('ArkUI')
          .fontSize(12)
          .fontColor(Color.White)
          .backgroundColor('#16A34A')
          .padding({
            left: 8,
            right: 8,
            top: 4,
            bottom: 4
          })
          .borderRadius(10)
      }

      Text('徐翊文 | 大数据技术专业')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      Text('正在学习用声明式UI构建清晰、可复用的HarmonyOS页面')
        .fontSize(16)
        .fontColor('#667085')
        .lineHeight(24)
        .textAlign(TextAlign.Center)

      Divider()
        .color('#DCE3EE')

      Row() {
        StatItem({ value: '3', label: '项目' })
        StatItem({ value: '12', label: '练习' })
        StatItem({
          value: this.liked ? '1' : '0',
          label: '点赞'
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)

      Row({ space: 12 }) {
        SkillTag({ text: 'ArkTS' })
        SkillTag({ text: 'ArkUI' })
        SkillTag({ text: 'UI布局' })
      }

      Button(this.liked ? '已点赞' : '为名片点赞')
        .width('100%')
        .height(48)
        .borderRadius(14)
        .backgroundColor(this.liked ? '#16A34A' : '#246BFD')
        .onClick(() => {
          this.liked = !this.liked
        })
    }
    .width('100%')
    .height('100%')
    .padding(28)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F7F4ED')
  }
}

@Component
struct StatItem {
  value: string = ''
  label: string = ''

  build() {
    Column({ space: 4 }) {
      Text(this.value)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)

      Text(this.label)
        .fontSize(13)
        .fontColor('#667085')
    }
  }
}

@Component
struct SkillTag {
  text: string = ''

  build() {
    Text(this.text)
      .fontSize(13)
      .fontColor('#174EA6')
      .backgroundColor('#E8F0FF')
      .padding({
        left: 10,
        right: 10,
        top: 6,
        bottom: 6
      })
      .borderRadius(12)
  }
}