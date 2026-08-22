import Foundation

public enum UpdateAdsRequestLeadFormQuestionsItemOptionsItemLogicAction: String, Codable, Hashable, CaseIterable, Sendable {
    case goToQuestion = "go_to_question"
    case submitForm = "submit_form"
    case closeForm = "close_form"
}