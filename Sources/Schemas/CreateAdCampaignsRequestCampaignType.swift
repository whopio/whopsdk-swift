import Foundation

/// The kind of campaign to create. `standard` runs image and video ads; `search` shows text ads on search results for the ad groups' keywords. Defaults to `standard`. Can't be changed after creation.
public enum CreateAdCampaignsRequestCampaignType: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case search
}