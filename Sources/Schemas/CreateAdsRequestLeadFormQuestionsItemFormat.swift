import Foundation

public enum CreateAdsRequestLeadFormQuestionsItemFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case shortAnswer = "short_answer"
    case multipleChoice = "multiple_choice"
    case appointment
}