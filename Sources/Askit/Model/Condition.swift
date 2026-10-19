import Foundation

public enum AnswerValue: Codable, Equatable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case list([String])
}

public struct Condition: Codable, Equatable {
    public let question: String
    public let operation: Operator
    public let value: AnswerValue?

    public enum Operator: String, Codable {
        case equals
        case notEquals
        case lessThan
        case greaterThan
        case contains
        case isAnswered
    }
}
