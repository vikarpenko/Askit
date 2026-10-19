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

        for id in duplicates(in: questionnaire.sections.map(\.id)) {
            issues.append(ValidationIssue("Duplicate section id '\(id)'."))
        }

        let questionIds = questionnaire.sections.flatMap { $0.questions }.map(\.id)
        for id in duplicates(in: questionIds) {
            issues.append(ValidationIssue("Duplicate question id '\(id)'."))
        }

        let lists = questionnaire.choiceLists ?? []

        for list in lists {
            for id in duplicates(in: list.choices.map(\.id)) {
                issues.append(ValidationIssue("Duplicate choice id '\(id)' in list '\(list.id)'."))
            }
            for choice in list.choices where choice.id == "other" {
                issues.append(ValidationIssue("Choice id 'other' is reserved (list '\(list.id)')."))
            }
        }

        return issues
    }

    private static func duplicates(in ids: [String]) -> [String] {
        var seen = Set<String>()
        var duplicated = Set<String>()

        for id in ids where !seen.insert(id).inserted {
            duplicated.insert(id)
        }

        return duplicated.sorted()
    }

}
