import Foundation

/// The funding source kind: a Whop balance or a saved card.
public enum UpdatePreferencesResponseAdsPaymentMethodsPrimaryType: String, Codable, Hashable, CaseIterable, Sendable {
    case platformBalance = "platform_balance"
    case card
}