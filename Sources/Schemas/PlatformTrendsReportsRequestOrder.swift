import Foundation

public enum PlatformTrendsReportsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case grossRevenue = "gross_revenue"
    case businesses
    case products
    case payments
    case customers
    case aov
    case repeatRate = "repeat_rate"
    case medianGrossRevenue = "median_gross_revenue"
    case newBusinesses = "new_businesses"
    case newCustomers = "new_customers"
    case avgBusinessAge = "avg_business_age"
    case avgOwnerAge = "avg_owner_age"
    case avgCustomerAge = "avg_customer_age"
}