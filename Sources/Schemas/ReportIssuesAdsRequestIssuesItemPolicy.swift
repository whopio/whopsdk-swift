import Foundation

/// The policy a `content_rejected` ad broke, which the account reads in its message. Send it only with `content_rejected`.
public enum ReportIssuesAdsRequestIssuesItemPolicy: String, Codable, Hashable, CaseIterable, Sendable {
    case misleading
    case financial
    case health
    case adult
    case gambling
    case spam
    case copyright
    case politics
    case other
}