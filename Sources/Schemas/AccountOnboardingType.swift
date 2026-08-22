import Foundation

/// Type of onboarding the account has completed.
public enum AccountOnboardingType: String, Codable, Hashable, CaseIterable, Sendable {
    case platform
    case seller
}