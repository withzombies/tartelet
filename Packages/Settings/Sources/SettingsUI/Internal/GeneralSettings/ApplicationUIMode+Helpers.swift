import SettingsDomain

public extension ApplicationUIMode {
    var title: String {
        switch self {
        case .dock:
            L10n.Settings.General.ApplicationUiMode.dock
        case .menuBar:
            L10n.Settings.General.ApplicationUiMode.menuBar
        case .dockAndMenuBar:
            L10n.Settings.General.ApplicationUiMode.dockAndMenuBar
        }
    }
}
