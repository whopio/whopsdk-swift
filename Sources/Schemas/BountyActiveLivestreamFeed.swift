import Foundation

public struct BountyActiveLivestreamFeed: Codable, Hashable, Sendable {
    /// User hosting the proof livestream — the worker streaming their attempt. `null` if the host account no longer exists.
    public let host: Nullable<UserSummary>
    /// Livestream feed ID.
    public let id: String
    /// Display title for the proof livestream.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        host: Nullable<UserSummary>,
        id: String,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.host = host
        self.id = id
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.host = try container.decode(Nullable<UserSummary>.self, forKey: .host)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.host, forKey: .host)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case host
        case id
        case title
    }
}