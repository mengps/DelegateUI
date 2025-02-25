import QtQuick
import DelegateUI

Window {
    id: window

    property alias captionBar: __captionBar
    property alias windowAgent: __windowAgent
    property bool followThemeSwitch: true
    property bool initialized: false
    property int specialEffect: DelWindowSpecialEffect.None

    visible: true
    objectName: "__DelWindow__"
    Component.onCompleted: {
        initialized = true;
        setWindowMode(DelTheme.isDark);
        __captionBar.windowAgent = __windowAgent;
        if (followThemeSwitch)
            __connections.onIsDarkChanged();
    }

    function setWindowMode(isDark) {
        if (window.initialized)
            windowAgent.setWindowAttribute("dark-mode", isDark);
    }

    function setSpecialEffect(specialEffect) {
        /*! 仅支持Windows */
        if (Qt.platform.os !== "windows") return;

        switch (specialEffect)
        {
        case DelWindowSpecialEffect.DwmBlur:
            window.color = "transparent"
            windowAgent.setWindowAttribute("acrylic-material", false);
            windowAgent.setWindowAttribute("mica", false);
            windowAgent.setWindowAttribute("mica-alt", false);
            windowAgent.setWindowAttribute("dwm-blur", true);
            window.specialEffect = DelWindowSpecialEffect.DwmBlur;
            break;
        case DelWindowSpecialEffect.AcrylicMaterial:
            window.color = "transparent";
            windowAgent.setWindowAttribute("dwm-blur", false);
            windowAgent.setWindowAttribute("mica", false);
            windowAgent.setWindowAttribute("mica-alt", false);
            windowAgent.setWindowAttribute("acrylic-material", true);
            window.specialEffect = DelWindowSpecialEffect.AcrylicMaterial;
            break;
        case DelWindowSpecialEffect.Mica:
            window.color = "transparent";
            windowAgent.setWindowAttribute("dwm-blur", false);
            windowAgent.setWindowAttribute("acrylic-material", false);
            windowAgent.setWindowAttribute("mica-alt", false);
            windowAgent.setWindowAttribute("mica", true);
            window.specialEffect = DelWindowSpecialEffect.Mica;
            break;
        case DelWindowSpecialEffect.MicaAlt:
            window.color = "transparent";
            windowAgent.setWindowAttribute("dwm-blur", false);
            windowAgent.setWindowAttribute("acrylic-material", false);
            windowAgent.setWindowAttribute("mica", false);
            windowAgent.setWindowAttribute("mica-alt", true);
            window.specialEffect = DelWindowSpecialEffect.MicaAlt;
            break;
        case DelWindowSpecialEffect.None:
        default:
            windowAgent.setWindowAttribute("dwm-blur", false);
            windowAgent.setWindowAttribute("acrylic-material", false);
            windowAgent.setWindowAttribute("mica", false);
            windowAgent.setWindowAttribute("mica-alt", false);
            window.specialEffect = DelWindowSpecialEffect.None;
            break;
        }
    }

    Connections {
        id: __connections
        target: DelTheme
        enabled: window.followThemeSwitch
        function onIsDarkChanged() {
            if (window.specialEffect == DelWindowSpecialEffect.None)
                window.color = DelTheme.Primary.colorBgBase;
            __windowAgent.setWindowAttribute("dark-mode", DelTheme.isDark);
        }
    }

    DelWindowAgent {
        id: __windowAgent
    }

    DelCaptionBar {
        id: __captionBar
        z: 65535
        width: parent.width
        height: 30
        anchors.top: parent.top
        targetWindow: window
    }
}
