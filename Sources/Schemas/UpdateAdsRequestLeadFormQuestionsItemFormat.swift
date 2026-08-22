import Foundation

public enum UpdateAdsRequestLeadFormQuestionsItemFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case shortAnswer = "short_answer"
    case multipleChoice = "multiple_choice"
    case appointment
}