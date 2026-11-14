import Foundation

/// The category saved as the membership's `cancel_option` when a member picks this option, so reports keep grouping cancellations.
public enum UpdatePreferencesRequestFeedbackOptionsItemCategory: String, Codable, Hashable, CaseIterable, Sendable {
    case tooExpensive = "too_expensive"
    case switching
    case missingFeatures = "missing_features"
    case technicalIssues = "technical_issues"
    case badExperience = "bad_experience"
    case unused
    case other
}