import Foundation

/// The category the member picked for why they canceled. `null` when no category was picked.
public enum MembershipCancelOption: String, Codable, Hashable, CaseIterable, Sendable {
    case tooExpensive = "too_expensive"
    case switching
    case missingFeatures = "missing_features"
    case technicalIssues = "technical_issues"
    case badExperience = "bad_experience"
    case unused
    case other
    case testing
}