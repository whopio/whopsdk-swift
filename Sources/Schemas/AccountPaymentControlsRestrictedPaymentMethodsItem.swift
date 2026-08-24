import Foundation

/// Card brands blocked at checkout for this account. Empty when none are blocked. The account cannot re-enable them itself.
public enum AccountPaymentControlsRestrictedPaymentMethodsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case cardVisa = "card_visa"
    case cardMastercard = "card_mastercard"
    case cardAmericanExpress = "card_american_express"
    case cardDiscoverGlobalNetwork = "card_discover_global_network"
}