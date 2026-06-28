import Foundation

public enum ProcessShellError: LocalizedError {
    case unexpectedTerminationStatus(Int32)

    public var errorDescription: String? {
        switch self {
        case let .unexpectedTerminationStatus(terminationStatus):
            "Unexpected termination status: \(terminationStatus)"
        }
    }
}
