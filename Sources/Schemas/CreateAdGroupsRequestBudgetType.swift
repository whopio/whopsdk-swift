import Foundation

/// Whether budget_amount is spent per day (`daily`) or over the ad group's full run (`lifetime`).
public enum CreateAdGroupsRequestBudgetType: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case lifetime
}