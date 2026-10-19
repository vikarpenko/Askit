import Foundation

// TODO: still to add
public enum QuestionnaireValidator {
    public static func validate(_ questionnaire: Questionnaire) -> [ValidationIssue] {
        var issues: [ValidationIssue] = []
        
        if questionnaire.version <= 0 {
            issues.append(ValidationIssue("Version must be greater than 0, got \(questionnaire.version)."))
        }
        
        if questionnaire.sections.isEmpty {
            issues.append(ValidationIssue("Questionnaire must have at least one section."))
        }
        
        for section in questionnaire.sections where section.questions.isEmpty {
            issues.append(ValidationIssue("Section '\(section.id)' must have at least one question."))
        }
        
        for list in questionnaire.choiceLists ?? [] where list.choices.isEmpty {
            issues.append(ValidationIssue("Choice list '\(list.id)' must have at least one choice."))
        }
        
        return issues
    }
}
