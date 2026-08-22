import Foundation

public enum SearchTargetingOptionsAdGroupsRequestLocationTypesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case country
    case region
    case city
    case zip
    case neighborhood
    case subcity
    case mediumGeoArea = "medium_geo_area"
}