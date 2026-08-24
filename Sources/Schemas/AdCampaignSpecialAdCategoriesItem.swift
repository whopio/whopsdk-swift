import Foundation

/// Regulated categories the campaign is declared under. Ads in these categories are subject to extra targeting restrictions. Empty when none apply.
public enum AdCampaignSpecialAdCategoriesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case housing
    case employment
    case financialProducts = "financial_products"
    case politics
}