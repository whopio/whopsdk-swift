import Foundation

/// The different types of issues a resolution can be
public enum ResolutionCenterCaseIssueTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case forgotToCancel = "forgot_to_cancel"
    case itemNotReceived = "item_not_received"
    case significantlyNotAsDescribed = "significantly_not_as_described"
    case unauthorizedTransaction = "unauthorized_transaction"
    case productUnacceptable = "product_unacceptable"
}