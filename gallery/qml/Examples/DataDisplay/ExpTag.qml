import QtQuick
import QtQuick.Layouts
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
## DelTag 标签 \n
进行标记和分类的小标签。\n
* **继承自 { Rectangle }**\n
支持的代理：\n
- 无\n
支持的属性：\n
属性名 | 类型 | 描述
------ | --- | ---
animationEnabled | bool | 是否开启动画(默认true)
tagState | enum | 标签状态(来自 DelTag)
text | string | 标签文本
font | font | 标签字体
rotating | bool | 旋转中
iconSource | enum | 图标(来自 DelIcon)
iconSize | int | 图标大小
closeIconSource | enum | 关闭图标(来自 DelIcon)
closeIconSize | int | 关闭图标大小
spacing | int | 图标间隔
presetColor | string | 预设颜色
colorText | color |文本颜色
colorBg | color | 背景颜色
colorBorder | color | 边框颜色
colorIcon | int | 图标颜色
\n支持的信号：\n
- \`close()\` 点击关闭图标(如果有)时发出\n
                       `)
        }

        Description {
            title: qsTr("何时使用")
            desc: qsTr(`
- 用于标记事物的属性和维度。\n
- 进行分类。\n
                       `)
        }

        Description {
            title: qsTr("代码演示")
        }

        CodeBox {
            width: parent.width
            descTitle: qsTr("基本用法")
            desc: qsTr(`
基本标签的用法\n
通过 \`text\` 设置标签文本。\n
通过 \`closeIconSource\` 设置关闭图标。\n
点击关闭图标将发送 \`close\` 信号。\n
                       `)
            code: `
                import QtQuick
                import DelegateUI

                Column {
                    width: parent.width
                    spacing: 10

                    Row {
                        spacing: 10

                        DelTag {
                            text: "Tag 1"
                        }

                        DelTag {
                            text: "Link"

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    Qt.openUrlExternally("https://github.com/mengps/DelegateUI");
                                }
                            }
                        }

                        DelTag {
                            text: "Prevent Default"
                            closeIconSource: DelIcon.CloseOutlined
                        }

                        DelTag {
                            text: "Tag 2"
                            closeIconSource: DelIcon.CloseCircleOutlined
                        }
                    }
                }
            `
            exampleDelegate: Column {
                spacing: 10

                Row {
                    spacing: 10

                    DelTag {
                        text: "Tag 1"
                    }

                    DelTag {
                        text: "Link"

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                Qt.openUrlExternally("https://github.com/mengps/DelegateUI");
                            }
                        }
                    }

                    DelTag {
                        text: "Prevent Default"
                        closeIconSource: DelIcon.CloseOutlined
                    }

                    DelTag {
                        text: "Tag 2"
                        closeIconSource: DelIcon.CloseCircleOutlined
                    }
                }
            }
        }

        CodeBox {
            width: parent.width
            descTitle: qsTr("多彩标签")
            desc: qsTr(`
通过 \`presetColor\` 设置预设颜色。\n
支持的预设颜色：\n
**["red", "volcano", "orange", "gold", "yellow", "lime", "green", "cyan", "blue", "geekblue", "purple", "magenta"]** \n
如果预设颜色不在该列表中，则为自定义标签。\n
                       `)
            code: `
                import QtQuick
                import DelegateUI

                Column {
                    width: parent.width
                    spacing: 10

                    Row {
                        spacing: 10

                        Repeater {
                            model: [ "red", "volcano", "orange", "gold", "yellow", "lime", "green", "cyan", "blue", "geekblue", "purple", "magenta" ]
                            delegate: DelTag {
                                text: modelData
                                presetColor: modelData
                            }
                        }
                    }

                    Row {
                        spacing: 10

                        Repeater {
                            model: [ "#f50", "#2db7f5", "#87d068", "#108ee9" ]
                            delegate: DelTag {
                                text: modelData
                                presetColor: modelData
                            }
                        }
                    }
                }
            `
            exampleDelegate: Column {
                spacing: 10

                Row {
                    spacing: 10

                    Repeater {
                        model: [ "red", "volcano", "orange", "gold", "yellow", "lime", "green", "cyan", "blue", "geekblue", "purple", "magenta" ]
                        delegate: DelTag {
                            text: modelData
                            presetColor: modelData
                        }
                    }
                }

                Row {
                    spacing: 10

                    Repeater {
                        model: [ "#f50", "#2db7f5", "#87d068", "#108ee9" ]
                        delegate: DelTag {
                            text: modelData
                            presetColor: modelData
                        }
                    }
                }
            }
        }

        CodeBox {
            width: parent.width
            descTitle: qsTr("动态添加和删除")
            desc: qsTr(`
简单生成一组标签，利用 \`close()\` 信号可以实现动态添加和删除。\n
                       `)
            code: `
                import QtQuick
                import DelegateUI

                Column {
                    width: parent.width
                    spacing: 10

                    Flow {
                        width: parent.width
                        spacing: 10

                        Repeater {
                            id: editRepeater
                            model: ListModel {
                                id: editTagsModel
                                ListElement { tag: "Unremovable"; removable: false }
                                ListElement { tag: "Tag 1"; removable: true }
                                ListElement { tag: "Tag 2"; removable: true }
                            }
                            delegate: DelTag {
                                text: tag
                                closeIconSource: removable ? DelIcon.CloseOutlined : 0
                                onClose: {
                                    editTagsModel.remove(index, 1);
                                }
                            }
                        }

                        DelInput {
                            width: 100
                            font.pixelSize: DelTheme.Primary.fontPrimarySize - 2
                            iconSource: DelIcon.PlusOutlined
                            placeholderText: "New Tag"
                            colorBg: "transparent"
                            onAccepted: {
                                focus = false;
                                editTagsModel.append({ tag: text, removable: true })
                                clear();
                            }
                        }
                    }
                }
            `
            exampleDelegate: Column {
                spacing: 10

                Flow {
                    width: parent.width
                    spacing: 10

                    Repeater {
                        id: editRepeater
                        model: ListModel {
                            id: editTagsModel
                            ListElement { tag: "Unremovable"; removable: false }
                            ListElement { tag: "Tag 1"; removable: true }
                            ListElement { tag: "Tag 2"; removable: true }
                        }
                        delegate: DelTag {
                            text: tag
                            closeIconSource: removable ? DelIcon.CloseOutlined : 0
                            onClose: {
                                editTagsModel.remove(index, 1);
                            }
                        }
                    }

                    DelInput {
                        width: 100
                        font.pixelSize: DelTheme.Primary.fontPrimarySize - 2
                        iconSource: DelIcon.PlusOutlined
                        placeholderText: "New Tag"
                        colorBg: "transparent"
                        onAccepted: {
                            focus = false;
                            editTagsModel.append({ tag: text, removable: true })
                            clear();
                        }
                    }
                }
            }
        }

        CodeBox {
            width: parent.width
            descTitle: qsTr("带图标的标签")
            desc: qsTr(`
通过 \`iconSource\` 设置左侧图标。\n
                       `)
            code: `
                import QtQuick
                import DelegateUI

                Row {
                    width: parent.width
                    spacing: 10

                    DelTag {
                        text: "Twitter"
                        iconSource: DelIcon.TwitterOutlined
                        presetColor: "#55acee"
                    }

                    DelTag {
                        text: "Youtube"
                        iconSource: DelIcon.YoutubeOutlined
                        presetColor: "#cd201f"
                    }

                    DelTag {
                        text: "Facebook "
                        iconSource: DelIcon.FacebookOutlined
                        presetColor: "#3b5999"
                    }

                    DelTag {
                        text: "LinkedIn"
                        iconSource: DelIcon.LinkedinOutlined
                        presetColor: "#55acee"
                    }
                }
            `
            exampleDelegate: Row {
                spacing: 10

                DelTag {
                    text: "Twitter"
                    iconSource: DelIcon.TwitterOutlined
                    presetColor: "#55acee"
                }

                DelTag {
                    text: "Youtube"
                    iconSource: DelIcon.YoutubeOutlined
                    presetColor: "#cd201f"
                }

                DelTag {
                    text: "Facebook "
                    iconSource: DelIcon.FacebookOutlined
                    presetColor: "#3b5999"
                }

                DelTag {
                    text: "LinkedIn"
                    iconSource: DelIcon.LinkedinOutlined
                    presetColor: "#55acee"
                }
            }
        }

        CodeBox {
            width: parent.width
            descTitle: qsTr("预设状态的标签")
            desc: qsTr(`
通过 \`rotating\` 设置图标是否旋转中。\n
通过 \`tagState\` 来设置不同的状态，支持的状态有：\n
- 默认状态(默认){ DelTag.State_Default }\n
- 成功状态{ DelTag.State_Success }\n
- 处理中状态{ DelTag.State_Processing }\n
- 错误状态{ DelTag.State_Error }\n
- 警告状态{ DelTag.State_Warning }\n
                       `)
            code: `
                import QtQuick
                import DelegateUI

                Column {
                    width: parent.width
                    spacing: 10

                    Row {
                        spacing: 10

                        DelTag {
                            text: "success"
                            tagState: DelTag.State_Success
                        }

                        DelTag {
                            text: "processing"
                            tagState: DelTag.State_Processing
                        }

                        DelTag {
                            text: "error"
                            tagState: DelTag.State_Error
                        }

                        DelTag {
                            text: "warning"
                            tagState: DelTag.State_Warning
                        }

                        DelTag {
                            text: "default"
                            tagState: DelTag.State_Default
                        }
                    }

                    Row {
                        spacing: 10

                        DelTag {
                            text: "success"
                            tagState: DelTag.State_Success
                            iconSource: DelIcon.CheckCircleOutlined
                        }

                        DelTag {
                            text: "processing"
                            rotating: true
                            tagState: DelTag.State_Processing
                            iconSource: DelIcon.SyncOutlined
                        }

                        DelTag {
                            text: "error"
                            tagState: DelTag.State_Error
                            iconSource: DelIcon.CloseCircleOutlined
                        }

                        DelTag {
                            text: "warning"
                            tagState: DelTag.State_Warning
                            iconSource: DelIcon.ExclamationCircleOutlined
                        }

                        DelTag {
                            text: "waiting"
                            tagState: DelTag.State_Default
                            iconSource: DelIcon.ClockCircleOutlined
                        }

                        DelTag {
                            text: "stop"
                            tagState: DelTag.State_Default
                            iconSource: DelIcon.MinusCircleOutlined
                        }
                    }
                }
            `
            exampleDelegate: Column {
                spacing: 10

                Row {
                    spacing: 10

                    DelTag {
                        text: "success"
                        tagState: DelTag.State_Success
                    }

                    DelTag {
                        text: "processing"
                        tagState: DelTag.State_Processing
                    }

                    DelTag {
                        text: "error"
                        tagState: DelTag.State_Error
                    }

                    DelTag {
                        text: "warning"
                        tagState: DelTag.State_Warning
                    }

                    DelTag {
                        text: "default"
                        tagState: DelTag.State_Default
                    }
                }

                Row {
                    spacing: 10

                    DelTag {
                        text: "success"
                        tagState: DelTag.State_Success
                        iconSource: DelIcon.CheckCircleOutlined
                    }

                    DelTag {
                        text: "processing"
                        rotating: true
                        tagState: DelTag.State_Processing
                        iconSource: DelIcon.SyncOutlined
                    }

                    DelTag {
                        text: "error"
                        tagState: DelTag.State_Error
                        iconSource: DelIcon.CloseCircleOutlined
                    }

                    DelTag {
                        text: "warning"
                        tagState: DelTag.State_Warning
                        iconSource: DelIcon.ExclamationCircleOutlined
                    }

                    DelTag {
                        text: "waiting"
                        tagState: DelTag.State_Default
                        iconSource: DelIcon.ClockCircleOutlined
                    }

                    DelTag {
                        text: "stop"
                        tagState: DelTag.State_Default
                        iconSource: DelIcon.MinusCircleOutlined
                    }
                }
            }
        }
    }
}
