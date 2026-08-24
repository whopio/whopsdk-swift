import Foundation

/// Platform the ads run on.
public enum CreateAdGroupsRequestPlacementsOneItemPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case facebook
    case instagram
    case messenger
    case audienceNetwork = "audience_network"
    case threads
    case whatsapp
}