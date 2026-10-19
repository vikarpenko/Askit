import Foundation

public enum QuestionType: String, Codable {
    case text
    case integer
    case decimal
    case date
    case singleChoice
    case multipleChoice
    case rating
    case boolean
}

public struct Question: Codable, Equatable, Identifiable {
    public let id: String
    public let type: QuestionType
    public let text: String
    public let hint: String?
    public let required: Bool?
    
    public let choiceList: String?
    public let allowOther: Bool?
    public let multiline: Bool?
    
    public let validators: [Validator]?
    public let showIf: Condition?
}
