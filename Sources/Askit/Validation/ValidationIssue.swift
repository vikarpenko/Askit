import Foundation

public struct ValidationIssue: Equatable {
    public let message: String

    public init(_ message: String) {
        self.message = message
    }
}
