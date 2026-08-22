import Foundation

/// Whether `budget_amount` is spent per day (`daily`) or over the campaign's full run (`lifetime`).
public enum AdCampaignBudgetType: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case lifetime
}