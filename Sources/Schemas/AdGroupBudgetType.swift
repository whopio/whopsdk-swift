import Foundation

/// Whether `budget_amount` is spent per day (`daily`) or over the ad group's full run (`lifetime`). A `lifetime` ad group also needs `ends_at`, at least 24 hours after it starts.
public enum AdGroupBudgetType: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case lifetime
}