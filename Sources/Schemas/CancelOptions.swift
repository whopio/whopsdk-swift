import Foundation

/// The different reasons a user can choose for why they are canceling their membership.
public enum CancelOptions: String, Codable, Hashable, CaseIterable, Sendable {
    case tooExpensive = "too_expensive"
    case switching
    case missingFeatures = "missing_features"
    case technicalIssues = "technical_issues"
    case badExperience = "bad_experience"
    case other
    case testing
}