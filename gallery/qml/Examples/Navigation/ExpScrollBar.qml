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
## DelScrollBar 滚动条\n
滚动条是一个交互式栏，用于滚动某个区域或视图到特定位置。\n
* **继承自 { ScrollBar }**\n
支持的代理：\n
- 无\n
支持的属性：\n
属性名 | 类型 | 描述
------ | --- | ---
animationEnabled | bool | 是否开启动画(默认true)
colorBar | color | 把手颜色
colorBg | color | 背景颜色
colorIcon | color | 图标颜色(即箭头颜色)
                       `)
        }

        Description {
            title: qsTr("何时使用")
            desc: qsTr(`
当一个项超出其容器大小时使用，提供比原生[ScrollBar]更好的外观和操作体验。
                       `)
        }

        Description {
            title: qsTr("代码演示")
        }

        CodeBox {
            width: parent.width
            desc: qsTr(`
使用方法和 \`ScrollBar\` 一致。
                       `)
            code: `
                import QtQuick
                import QtQuick.Controls.Basic
                import DelegateUI

                Item {
                    Flickable {
                        width: 200
                        height: 200
                        contentWidth: 400
                        contentHeight: 400
                        ScrollBar.vertical: DelScrollBar { }
                        ScrollBar.horizontal: DelScrollBar { }
                        clip: true

                        DelIconText {
                            iconSize: 400
                            iconSource: DelIcon.BugOutlined
                        }
                    }
                }
            `
            exampleDelegate: Item {
                height: 200

                Flickable {
                    width: 200
                    height: 200
                    contentWidth: 400
                    contentHeight: 400
                    ScrollBar.vertical: DelScrollBar { }
                    ScrollBar.horizontal: DelScrollBar { }
                    clip: true

                    DelIconText {
                        iconSize: 400
                        iconSource: DelIcon.BugOutlined
                    }
                }
            }
        }
    }
}
