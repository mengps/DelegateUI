import QtQuick
import QtQuick.Controls.Basic
import DelegateUI

import "../../Controls"

Flickable {
    contentHeight: column.height
    ScrollBar.vertical: DelScrollBar { }

    Column {
        id: column
        width: parent.width - 15
        spacing: 30

        Description {
            desc: qsTr(`
## DelWatermark 水印 \n
可给页面的任意项加上水印。\n
* **继承自 { QQuickPaintedItem }**\n
支持的代理：\n
- 无\n
支持的属性：\n
属性名 | 类型 | 描述
------ | --- | ---
text | string | 水印文本(和图片二选一)
image | url | 水印图片地址
markSize | size | 水印大小
gap | point | 水印间隔
offset | point | 水印偏移
rotate | real | 水印旋转角度(0~360)
font | font | 字体
fontColor | color | 字体颜色
                       `)
        }

        Text {
            width: parent.width - 20
            height: implicitHeight - 10
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("代码演示")
            font {
                family: DelTheme.Primary.fontPrimaryFamily
                pixelSize: DelTheme.Primary.fontPrimarySizeHeading3
            }
            color: DelTheme.Primary.colorTextBase
        }

        CodeBox {
            width: parent.width
            desc: qsTr(`
通过 \`text\` 属性设置需要水印的文本。
                       `)
            code: `
                import QtQuick
                import DelegateUI

                Column {
                    DelSlider {
                        id: slider1
                        width: 200
                        height: 30
                        min: 0
                        max: 360
                        stepSize: 1
                        value: 0

                        DelCopyableText {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.right
                            anchors.leftMargin: 10
                            text: qsTr("旋转角度: ") + parent.currentValue.toFixed(0)
                        }
                    }

                    Rectangle {
                        width: 400
                        height: 400
                        color: "transparent"
                        border.color: DelTheme.Primary.colorTextBase

                        DelWatermark {
                            anchors.fill: parent
                            anchors.margins: 1
                            offset.x: -50
                            offset.y: -50
                            text: qsTr("DelegateUI")
                            rotate: slider1.currentValue
                            font.family: DelTheme.Primary.fontPrimaryFamily
                            fontColor: "#80ff0000"
                        }

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("文字水印测试")
                            font {
                                family: DelTheme.Primary.fontPrimaryFamily
                                pixelSize: DelTheme.Primary.fontPrimarySize + 20
                            }
                            color: DelTheme.Primary.colorTextBase
                        }
                    }
                }
            `
            exampleDelegate: Column {
                DelSlider {
                    id: slider1
                    width: 200
                    height: 30
                    min: 0
                    max: 360
                    stepSize: 1
                    value: 0

                    DelCopyableText {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.right
                        anchors.leftMargin: 10
                        text: qsTr("旋转角度: ") + parent.currentValue.toFixed(0)
                    }
                }

                Rectangle {
                    width: 400
                    height: 400
                    color: "transparent"
                    border.color: DelTheme.Primary.colorTextBase

                    DelWatermark {
                        anchors.fill: parent
                        anchors.margins: 1
                        offset.x: -50
                        offset.y: -50
                        text: qsTr("DelegateUI")
                        rotate: slider1.currentValue
                        font.family: DelTheme.Primary.fontPrimaryFamily
                        fontColor: "#80ff0000"
                    }

                    Text {
                        anchors.centerIn: parent
                        text: qsTr("文字水印测试")
                        font {
                            family: DelTheme.Primary.fontPrimaryFamily
                            pixelSize: DelTheme.Primary.fontPrimarySize + 20
                        }
                        color: DelTheme.Primary.colorTextBase
                    }
                }
            }
        }

        CodeBox {
            width: parent.width
            desc: qsTr(`
通过 \`image\` 属性设置需要水印图像的链接(可以是本地)。
                       `)
            code: `
                import QtQuick
                import DelegateUI

                Column {
                    DelSlider {
                        id: slider2
                        width: 200
                        height: 30
                        min: 0
                        max: 360
                        stepSize: 1
                        value: 0

                        DelCopyableText {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.right
                            anchors.leftMargin: 10
                            text: qsTr("旋转角度: ") + parent.currentValue.toFixed(0)
                        }
                    }

                    Rectangle {
                        width: 400
                        height: 400
                        color: "transparent"
                        border.color: DelTheme.Primary.colorTextBase

                        DelWatermark {
                            anchors.fill: parent
                            anchors.margins: 1
                            offset.x: -50
                            offset.y: -50
                            image: "https://avatars.githubusercontent.com/u/33405710?v=4"
                            markSize.width: 100
                            markSize.height: 100
                            rotate: slider2.currentValue
                            fontColor: "#80ff0000"
                            font.family: DelTheme.Primary.fontPrimaryFamily
                        }

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("图片水印测试")
                            font {
                                family: DelTheme.Primary.fontPrimaryFamily
                                pixelSize: DelTheme.Primary.fontPrimarySize + 20
                            }
                            color: DelTheme.Primary.colorTextBase
                        }
                    }
                }
            `
            exampleDelegate: Column {
                DelSlider {
                    id: slider2
                    width: 200
                    height: 30
                    min: 0
                    max: 360
                    stepSize: 1
                    value: 0

                    DelCopyableText {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.right
                        anchors.leftMargin: 10
                        text: qsTr("旋转角度: ") + parent.currentValue.toFixed(0)
                    }
                }

                Rectangle {
                    width: 400
                    height: 400
                    color: "transparent"
                    border.color: DelTheme.Primary.colorTextBase

                    DelWatermark {
                        anchors.fill: parent
                        anchors.margins: 1
                        offset.x: -50
                        offset.y: -50
                        image: "https://avatars.githubusercontent.com/u/33405710?v=4"
                        markSize.width: 100
                        markSize.height: 100
                        rotate: slider2.currentValue
                        fontColor: "#80ff0000"
                        font.family: DelTheme.Primary.fontPrimaryFamily
                    }

                    Text {
                        anchors.centerIn: parent
                        text: qsTr("图片水印测试")
                        font {
                            family: DelTheme.Primary.fontPrimaryFamily
                            pixelSize: DelTheme.Primary.fontPrimarySize + 20
                        }
                        color: DelTheme.Primary.colorTextBase
                    }
                }
            }
        }
    }
}
