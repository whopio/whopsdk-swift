import Foundation

/// Why the ad or ad group can't deliver yet, as reported.
public enum AdIssueReason: String, Codable, Hashable, CaseIterable, Sendable {
    case contentRejected = "content_rejected"
    case landingPageRejected = "landing_page_rejected"
    case creativeUnsupported = "creative_unsupported"
    case targetingRejected = "targeting_rejected"
    case inReview = "in_review"
}