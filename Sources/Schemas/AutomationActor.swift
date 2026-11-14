import Foundation

public struct AutomationActor: Codable, Hashable, Sendable {
    /// ID of the user, account or app, prefixed `user_`, `biz_` or `app_`.
    public let id: String
    /// What acted: a `user`, an `account` through one of its API keys, or an `app`.
    public let object: AutomationActorObject
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        object: AutomationActorObject,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.object = object
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(AutomationActorObject.self, forKey: .object)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case object
    }
}