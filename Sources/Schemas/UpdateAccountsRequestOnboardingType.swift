import Foundation

/// The type of onboarding the account has completed.
public enum UpdateAccountsRequestOnboardingType: String, Codable, Hashable, CaseIterable, Sendable {
    case platform
    case seller
}