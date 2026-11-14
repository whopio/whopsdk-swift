import Foundation

/// Lowercase ISO currency code every new sale settles into, regardless of the plan's currency or what the buyer paid in. Sales converted this way carry an additional 0.5% FX fee. `null` when the account settles each sale in its plan's currency.
public enum UpdatePreferencesResponsePreferredSettlementCurrency: String, Codable, Hashable, CaseIterable, Sendable {
    case usd
    case eur
    case gbp
    case cad
    case aud
}