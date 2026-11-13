import Foundation

/// Settle every new sale into this currency, regardless of the plan's currency or what the buyer paid in; sales converted this way carry an additional 0.5% FX fee. Pass `null` to go back to settling each sale in its plan's currency. Changing it never converts money already in your balances, and it can change at most once a day (see `preferred_settlement_currency_changeable_at`). Requires the `payout:account:update` scope on your API key.
public enum UpdatePreferencesRequestPreferredSettlementCurrency: String, Codable, Hashable, CaseIterable, Sendable {
    case usd
    case eur
    case gbp
    case cad
    case aud
}