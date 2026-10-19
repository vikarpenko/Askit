import Foundation

public struct Choice: Codable, Equatable, Identifiable {
    public let id: String
    public let text: String
    public let isExclusive: Bool
}

public struct ChoiceList: Codable, Equatable, Identifiable {
    public let id: String
    public let choices: [Choice]
}
