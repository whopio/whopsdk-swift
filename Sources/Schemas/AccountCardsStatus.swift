import Foundation

/// Where the card application stands. `approved` means cards can be issued. `needs_verification` means the applicant has not completed identity verification yet; `needs_information` means they did, but the documents were rejected for a fixable reason and must be resubmitted. `pending` and `manual_review` are in flight. `denied`, `locked`, and `canceled` are terminal.
public enum AccountCardsStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case approved
    case pending
    case manualReview = "manual_review"
    case denied
    case locked
    case canceled
    case needsVerification = "needs_verification"
    case needsInformation = "needs_information"
}