import Foundation

/// Device platforms and operating systems to target.
public struct AdGroupDevicesBody: Codable, Hashable, Sendable {
    /// Operating systems to target. Empty targets all operating systems.
    public let operatingSystems: [AdGroupDevicesBodyOperatingSystemsItem]?
    /// Device types to target. Empty targets all devices.
    public let platforms: [AdGroupDevicesBodyPlatformsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        operatingSystems: [AdGroupDevicesBodyOperatingSystemsItem]? = nil,
        platforms: [AdGroupDevicesBodyPlatformsItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.operatingSystems = operatingSystems
        self.platforms = platforms
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.operatingSystems = try container.decodeIfPresent([AdGroupDevicesBodyOperatingSystemsItem].self, forKey: .operatingSystems)
        self.platforms = try container.decodeIfPresent([AdGroupDevicesBodyPlatformsItem].self, forKey: .platforms)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.operatingSystems, forKey: .operatingSystems)
        try container.encodeIfPresent(self.platforms, forKey: .platforms)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case operatingSystems = "operating_systems"
        case platforms
    }
}