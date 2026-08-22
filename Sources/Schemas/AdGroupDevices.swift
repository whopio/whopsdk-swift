import Foundation

public struct AdGroupDevices: Codable, Hashable, Sendable {
    public let operatingSystems: [AdGroupOperatingSystem]
    public let platforms: [AdGroupDevicesPlatformsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        operatingSystems: [AdGroupOperatingSystem],
        platforms: [AdGroupDevicesPlatformsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.operatingSystems = operatingSystems
        self.platforms = platforms
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.operatingSystems = try container.decode([AdGroupOperatingSystem].self, forKey: .operatingSystems)
        self.platforms = try container.decode([AdGroupDevicesPlatformsItem].self, forKey: .platforms)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.operatingSystems, forKey: .operatingSystems)
        try container.encode(self.platforms, forKey: .platforms)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case operatingSystems = "operating_systems"
        case platforms
    }
}