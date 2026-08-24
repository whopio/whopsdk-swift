import Foundation

/// Saved audiences to deliver to or exclude. Can't be combined with demographics.automatic.
public struct AdGroupAudiencesBody: Codable, Hashable, Sendable {
    /// IDs of saved audiences to exclude from delivery, prefixed `adaud_`.
    public let exclude: [String]?
    /// IDs of saved audiences to deliver to, prefixed `adaud_`.
    public let include: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        exclude: [String]? = nil,
        include: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.exclude = exclude
        self.include = include
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.exclude = try container.decodeIfPresent([String].self, forKey: .exclude)
        self.include = try container.decodeIfPresent([String].self, forKey: .include)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.exclude, forKey: .exclude)
        try container.encodeIfPresent(self.include, forKey: .include)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case exclude
        case include
    }
}