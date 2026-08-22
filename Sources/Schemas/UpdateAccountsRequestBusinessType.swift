import Foundation

/// High-level business category for the account. See the [business types and industries glossary](/api-reference/beta/accounts/account#business-types-and-industries-glossary) for valid values.
public enum UpdateAccountsRequestBusinessType: String, Codable, Hashable, CaseIterable, Sendable {
    case educationProgram = "education_program"
    case coaching
    case software
    case paidGroup = "paid_group"
    case newsletter
    case agency
    case physicalProducts = "physical_products"
    case brickAndMortar = "brick_and_mortar"
    case events
    case coachingAndCourses = "coaching_and_courses"
    case other
    case services
    case gigEconomy = "gig_economy"
    case marketplace
    case telehealth
    case classActionSettlement = "class_action_settlement"
    case physicalProduct = "physical_product"
    case saas
    case course
    case community
}