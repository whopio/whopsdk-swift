import Foundation

/// The different types of actions for a resolution event
public enum ResolutionCenterCaseActions: String, Codable, Hashable, CaseIterable, Sendable {
    case created
    case responded
    case accepted
    case denied
    case appealed
    case withdrew
    case requestedMoreInfo = "requested_more_info"
    case escalated
    case disputeOpened = "dispute_opened"
    case disputeCustomerWon = "dispute_customer_won"
    case disputeMerchantWon = "dispute_merchant_won"
}