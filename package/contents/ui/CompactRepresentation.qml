import QtQuick
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import "components" as Components

MouseArea {
    id: compact
    anchors.fill: parent
    property bool isPanelVertical: plasmoid.formFactor === PlasmaCore.Types.Vertical
    property real itemSize: Math.min(compact.height, compact.width)

    property string icon
    property bool onDesktop

    Item {
        id: container
        height: compact.itemSize
        width: compact.width
        anchors.centerIn: parent

        Components.PlasmoidIcon {
            id: plasmoidIcon
            height: Kirigami.Units.iconSizes.roundedIconSize(Math.min(parent.width, parent.height))
            width: height
            source: icon
            visible: !onDesktop || main.inEditMode || !main.hideWidget
            opacity: plasmoid.configuration.isEnabled ? 1 : 0.5
        }
    }
}
