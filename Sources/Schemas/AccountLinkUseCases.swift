import Foundation

/// The different use cases for generating an account link.
public enum AccountLinkUseCases: String, Codable, Hashable, CaseIterable, Sendable {
    case accountOnboarding = "account_onboarding"
    case payoutsPortal = "payouts_portal"
}