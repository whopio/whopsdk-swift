import Foundation

public enum CreateAdCampaignsRequestSpecialAdCategoriesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case housing
    case employment
    case financialProducts = "financial_products"
    case politics
}