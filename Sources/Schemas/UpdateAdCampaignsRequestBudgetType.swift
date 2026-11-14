import Foundation

/// Whether `budget_amount` is spent per day (`daily`) or over the campaign's full run (`lifetime`). Only changeable while the campaign is a draft; send budget_amount in the same request so the amount lands on the new type.
public enum UpdateAdCampaignsRequestBudgetType: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case lifetime
}