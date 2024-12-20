import QtQuick
import QtQuick.Layouts
import QWindowKit
import DelegateUI

Rectangle {
    id: control
    color: "transparent"

    property var targetWindow: null
    property WindowAgent windowAgent: null

    property alias layoutDirection: __row.layoutDirection

    property string winIcon: ""
    property alias winIconWidth: __winIconLoader.width
    property alias winIconHeight: __winIconLoader.height
    property alias winIconVisible: __winIconLoader.visible

    property font winTitleFont
    winTitleFont {
        family: DelTheme.Primary.fontPrimaryFamily
        pixelSize: DelTheme.Primary.fontPrimarySize
    }
    property color winTitleColor: DelTheme.Primary.colorTextBase
    property alias winTitleVisible: __winTitleLoader.visible

    property bool returnButtonVisible: false
    property bool themeButtonVisible: false
    property bool topButtonVisible: false
    property bool minimizeButtonVisible: true
    property bool maximizeButtonVisible: true
    property bool closeButtonVisible: true

    property var returnCallback: ()=>{ }
    property var themeCallback: ()=>{ DelTheme.darkMode = DelTheme.isDark ? DelTheme.Light : DelTheme.Dark; }
    property var topCallback: (checked)=>{ }
    property var minimizeCallback:
        ()=>{
            if (targetWindow) targetWindow.showMinimized();
        }
    property var maximizeCallback: ()=>{
            if (!targetWindow) return;

            if (targetWindow.visibility === Window.Maximized) targetWindow.showNormal();
            else targetWindow.showMaximized();
        }
    property var closeCallback: ()=>{ if (targetWindow) targetWindow.close(); }

    property Component winIconDelegate: Image {
        source: control.winIcon
        sourceSize.width: width
        sourceSize.height: height
        mipmap: true
    }
    property Component winTitleDelegate: Text {
        text: targetWindow ? targetWindow.title : ""
        color: winTitleColor
        font: winTitleFont
    }
    property Component winButtonsDelegate: Row {
        Connections {
            target: control
            function onWindowAgentChanged() {
                if (windowAgent) {
                    windowAgent.setSystemButton(WindowAgent.Minimize, __minimizeButton);
                    windowAgent.setSystemButton(WindowAgent.Maximize, __maximizeButton);
                    windowAgent.setSystemButton(WindowAgent.Close, __closeButton);
                }
            }
        }

        DelCaptionButton {
            id: __themeButton
            visible: control.themeButtonVisible
            iconSource: DelTheme.isDark ? DelIcon.MoonOutlined : DelIcon.SunOutlined
            iconSize: DelTheme.DelCaptionButton.fontSize + 2
            onClicked: themeCallback();
        }

        DelCaptionButton {
            id: __topButton
            visible: control.topButtonVisible
            iconSource: DelIcon.PushpinOutlined
            iconSize: DelTheme.DelCaptionButton.fontSize + 2
            checkable: true
            onClicked: topCallback(checked);
        }

        DelCaptionButton {
            id: __minimizeButton
            visible: control.minimizeButtonVisible
            iconSource: DelIcon.LineOutlined
            onClicked: minimizeCallback();
        }

        DelCaptionButton {
            id: __maximizeButton
            visible: control.maximizeButtonVisible
            iconSource: targetWindow.visibility === Window.Maximized ? DelIcon.SwitcherOutlined : DelIcon.BorderOutlined
            onClicked: maximizeCallback();
        }

        DelCaptionButton {
            id: __closeButton
            visible: control.closeButtonVisible
            iconSource: DelIcon.CloseOutlined
            isError: true
            onClicked: closeCallback();
        }
    }

    RowLayout {
        id: __row
        anchors.fill: parent
        spacing: 0

        DelCaptionButton {
            id: __returnButton
            Layout.alignment: Qt.AlignVCenter
            iconSource: DelIcon.ArrowLeftOutlined
            iconSize: DelTheme.DelCaptionButton.fontSize + 2
            visible: control.returnButtonVisible
            onClicked: returnCallback();
        }

        Item {
            id: __title
            Layout.fillWidth: true
            Layout.fillHeight: true
            Component.onCompleted: {
                if (windowAgent)
                    windowAgent.setTitleBar(__title);
            }

            Row {
                spacing: 10
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter

                Loader {
                    id: __winIconLoader
                    width: 20
                    height: 20
                    anchors.verticalCenter: parent.verticalCenter
                    sourceComponent: winIconDelegate
                }

                Loader {
                    id: __winTitleLoader
                    anchors.verticalCenter: parent.verticalCenter
                    sourceComponent: winTitleDelegate
                }
            }
        }

        Loader {
            Layout.alignment: Qt.AlignVCenter
            width: item ? item.width : 0
            height: item ? item.height : 0
            sourceComponent: winButtonsDelegate
        }
    }
}
