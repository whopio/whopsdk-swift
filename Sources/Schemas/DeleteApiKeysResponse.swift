import Foundation

public struct DeleteApiKeysResponse: Codable, Hashable, Sendable {
    /// Always `true`: the key was revoked.
    public let deleted: Bool
    /// The ID of the revoked key.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        deleted: Bool,
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.deleted = deleted
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.deleted = try container.decode(Bool.self, forKey: .deleted)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.deleted, forKey: .deleted)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case deleted
        case id
    }
}