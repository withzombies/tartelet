import Foundation

public enum ApplicationUIMode: String, CaseIterable, Equatable, Identifiable {
    case dock
    case menuBar
    case dockAndMenuBar

    public var id: Self {
        self
    }

    public var showInDock: Bool {
        switch self {
        case .dock, .dockAndMenuBar:
            true
        case .menuBar:
            false
        }
    }

    public var showInMenuBar: Bool {
        switch self {
        case .menuBar, .dockAndMenuBar:
            true
        case .dock:
            false
        }
    }
}
