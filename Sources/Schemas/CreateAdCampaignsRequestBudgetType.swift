import Foundation

/// Whether the budget is spent per day (`daily`) or over the campaign's full run (`lifetime`). Defaults to `daily`.
public enum CreateAdCampaignsRequestBudgetType: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case lifetime
}