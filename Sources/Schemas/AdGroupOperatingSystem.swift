import Foundation

public struct AdGroupOperatingSystem: Codable, Hashable, Sendable {
    /// Lowest OS version targeted, such as `18.0`. Absent when any version qualifies.
    public let minimumVersion: String?
    /// Operating system targeted.
    public let os: AdGroupOperatingSystemOs
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        minimumVersion: String? = nil,
        os: AdGroupOperatingSystemOs,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.minimumVersion = minimumVersion
        self.os = os
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.minimumVersion = try container.decodeIfPresent(String.self, forKey: .minimumVersion)
        self.os = try container.decode(AdGroupOperatingSystemOs.self, forKey: .os)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.minimumVersion, forKey: .minimumVersion)
        try container.encode(self.os, forKey: .os)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case minimumVersion = "minimum_version"
        case os
    }
}