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
## DelIconButton 图标按钮\n
带图标的按钮。\n
* **继承自 { DelButton }**\n
支持的代理：\n
- 无\n
支持的属性：\n
属性名 | 类型 | 描述
------ | --- | ---
iconSource | bool | 图标源(来自 DelIcon)
iconSize | bool | 图标大小
iconSpacing | int | 图标间隔
iconPosition | int | 图标位置(来自 DelButtonType)
colorIcon | color | 图标颜色
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
通过 \`iconSource\` 属性设置图标源{ DelIcon中定义 }\n
通过 \`iconSize\` 属性设置图标大小\n
通过 \`iconPosition\` 属性设置图标位置，支持的位置有：\n
- 图标处于开始位置(默认){ DelButtonType.Position_Start }\n
- 图标处于结束位置{ DelButtonType.Position_End }
                       `)
            code: `
                import QtQuick
                import DelegateUI

                Row {
                    spacing: 15

                    DelIconButton {
                        text: qsTr("搜索")
                        iconSource: DelIcon.SearchOutlined
                    }

                    DelIconButton {
                        text: qsTr("搜索")
                        type: DelButtonType.Type_Outlined
                        iconSource: DelIcon.SearchOutlined
                    }

                    DelIconButton {
                        type: DelButtonType.Type_Primary
                        iconSource: DelIcon.SearchOutlined
                    }

                    DelIconButton {
                        text: qsTr("搜索")
                        type: DelButtonType.Type_Primary
                        iconSource: DelIcon.SearchOutlined
                    }

                    DelIconButton {
                        text: qsTr("搜索")
                        type: DelButtonType.Type_Primary
                        iconSource: DelIcon.SearchOutlined
                        iconPosition: DelButtonType.Position_End
                    }

                    DelIconButton {
                        text: qsTr("搜索")
                        type: DelButtonType.Type_Filled
                        iconSource: DelIcon.SearchOutlined
                    }

                    DelIconButton {
                        text: qsTr("搜索")
                        type: DelButtonType.Type_Text
                        iconSource: DelIcon.SearchOutlined
                    }
                }
            `
            exampleDelegate: Row {
                spacing: 15

                DelIconButton {
                    text: qsTr("搜索")
                    iconSource: DelIcon.SearchOutlined
                }

                DelIconButton {
                    text: qsTr("搜索")
                    type: DelButtonType.Type_Outlined
                    iconSource: DelIcon.SearchOutlined
                }

                DelIconButton {
                    type: DelButtonType.Type_Primary
                    iconSource: DelIcon.SearchOutlined
                }

                DelIconButton {
                    text: qsTr("搜索")
                    type: DelButtonType.Type_Primary
                    iconSource: DelIcon.SearchOutlined
                }

                DelIconButton {
                    text: qsTr("搜索")
                    type: DelButtonType.Type_Primary
                    iconSource: DelIcon.SearchOutlined
                    iconPosition: DelButtonType.Position_End
                }

                DelIconButton {
                    text: qsTr("搜索")
                    type: DelButtonType.Type_Filled
                    iconSource: DelIcon.SearchOutlined
                }

                DelIconButton {
                    text: qsTr("搜索")
                    type: DelButtonType.Type_Text
                    iconSource: DelIcon.SearchOutlined
                }

            }
        }
    }
}
