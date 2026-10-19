import Foundation

public struct Answer: Codable, Equatable {
    public let questionId: String
    public let value: AnswerValue
    public let otherText: String?
}
