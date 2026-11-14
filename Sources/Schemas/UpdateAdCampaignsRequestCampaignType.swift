import Foundation

/// Accepted only when it matches the campaign's current type, so a read can be sent back unchanged. The type is fixed at creation.
public enum UpdateAdCampaignsRequestCampaignType: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case search
}