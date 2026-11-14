import Foundation

public enum PlatformTrendsReportsRequestBreakdownBy: String, Codable, Hashable, CaseIterable, Sendable {
    case businessType = "business_type"
    case industryType = "industry_type"
    case productCategory = "product_category"
    case accountCountry = "account_country"
    case customerCountry = "customer_country"
}