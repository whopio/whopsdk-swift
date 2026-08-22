import Foundation

/// The action recorded in this event.
public enum ResolutionEventAction: String, Codable, Hashable, CaseIterable, Sendable {
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