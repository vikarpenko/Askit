import Foundation

public struct Response: Codable, Equatable {
    public let responseId: String
    public let formId: String
    public let formVersion: Int
    public let language: String?
    public let startedAt: String
    public let submittedAt: String
    public let answers: [Answer]
}
