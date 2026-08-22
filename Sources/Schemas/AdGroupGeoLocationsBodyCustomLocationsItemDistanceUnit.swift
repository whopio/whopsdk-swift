import Foundation

/// Unit for `radius`. Defaults to `mile`.
public enum AdGroupGeoLocationsBodyCustomLocationsItemDistanceUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case mile
    case kilometer
}