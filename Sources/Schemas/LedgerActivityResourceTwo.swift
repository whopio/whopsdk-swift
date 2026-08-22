import Foundation

public struct LedgerActivityResourceTwo: Codable, Hashable, Sendable {
    /// Bounty ID.
    public let id: String
    public let object: LedgerActivityResourceTwoObject
    /// Bounty lifecycle status.
    public let status: String
    /// Bounty title.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        object: LedgerActivityResourceTwoObject,
        status: String,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.object = object
        self.status = status
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(LedgerActivityResourceTwoObject.self, forKey: .object)
        self.status = try container.decode(String.self, forKey: .status)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case object
        case status
        case title
    }
}