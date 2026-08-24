import Foundation

/// Click-to-message welcome copy: the greeting (message) and the ice-breaker prompt (keyword).
public struct UpdateAdsRequestMessagingConfig: Codable, Hashable, Sendable {
    public let keyword: String?
    public let message: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        keyword: String? = nil,
        message: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.keyword = keyword
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.keyword = try container.decodeIfPresent(String.self, forKey: .keyword)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.keyword, forKey: .keyword)
        try container.encodeIfPresent(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case keyword
        case message
    }
}