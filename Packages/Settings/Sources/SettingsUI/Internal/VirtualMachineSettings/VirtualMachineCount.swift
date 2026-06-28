import Foundation

enum VirtualMachineCount: Int, CaseIterable, Identifiable {
    case one = 1
    case two = 2

    var id: Self {
        self
    }

    var title: String {
        switch self {
        case .one:
            L10n.Settings.VirtualMachine.Count.one
        case .two:
            L10n.Settings.VirtualMachine.Count.two
        }
    }
}
