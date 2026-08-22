import Foundation

/// The deliverable shapes this bounty accepts. Every bounty accepts any combination of `content_url` (posted links) and `media` (uploaded files), except `data_capture` bounties, whose proof is clips recorded in the Whop app that accumulate on the attempt.
public enum BountyAcceptedDeliverableTypesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case contentUrl = "content_url"
    case media
    case dataCapture = "data_capture"
}