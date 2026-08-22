import Foundation

/// Apps the conversation opens in when `conversion_location` is `messaging`. Empty for other conversion locations.
public enum AdGroupMessageAppsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case messenger
    case instagram
    case whatsapp
}