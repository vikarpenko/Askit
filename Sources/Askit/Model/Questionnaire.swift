import Foundation

public enum QuestionnaireStatus: String, Codable {
    case draft
    case active
    case retired
}

public struct Questionnaire: Codable, Equatable, Identifiable {
    public let id: String
    public let version: Int
    public let status: QuestionnaireStatus
    public let defaultLanguage: String? 
    public let title: String
    public let description: String?
    public let choiceLists: [ChoiceList]?
    public let sections: [Section]
}
