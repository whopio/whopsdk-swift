import Foundation

/// Publisher platform where the ad is eligible to appear.
public enum AdGroupPlacementPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case facebook
    case instagram
    case messenger
    case audienceNetwork = "audience_network"
    case threads
    case whatsapp
}