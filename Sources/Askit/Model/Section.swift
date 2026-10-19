import Foundation

public struct Section: Codable, Equatable, Identifiable {
    public let id: String
    public let title: String
    public let description: String?
    public let questions: [Question]
}
