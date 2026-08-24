import Foundation

/// Granularity of the location. Which of these an ad platform reports depends on how finely it divides its location taxonomy.
public enum LocationTargetingOptionLocationType: String, Codable, Hashable, CaseIterable, Sendable {
    case country
    case region
    case city
    case zip
    case neighborhood
    case subcity
    case mediumGeoArea = "medium_geo_area"
    case district
    case dma
}