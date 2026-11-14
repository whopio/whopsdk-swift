import Foundation

/// Why the object can't deliver yet. `content_rejected`, `landing_page_rejected`, and `creative_unsupported` go on ads, `targeting_rejected` on ad groups, and `in_review` on either.
public enum ReportIssuesAdsRequestIssuesItemReason: String, Codable, Hashable, CaseIterable, Sendable {
    case contentRejected = "content_rejected"
    case landingPageRejected = "landing_page_rejected"
    case creativeUnsupported = "creative_unsupported"
    case targetingRejected = "targeting_rejected"
    case inReview = "in_review"
}