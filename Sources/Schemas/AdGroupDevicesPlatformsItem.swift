import Foundation

/// Device types targeted. Empty targets all devices.
public enum AdGroupDevicesPlatformsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case mobile
    case desktop
}