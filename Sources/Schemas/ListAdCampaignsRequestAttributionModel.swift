import Foundation

public enum ListAdCampaignsRequestAttributionModel: String, Codable, Hashable, CaseIterable, Sendable {
    case lastTouch = "last_touch"
    case firstTouch = "first_touch"
}