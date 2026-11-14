import Foundation

public struct ApiKeyGrant: Codable, Hashable, Sendable {
    public let actions: [ApiKeyGrantAction]
    /// ID of the resource the actions apply to.
    public let resourceId: String
    /// The type of resource the actions apply to, such as `account`, `product`, `app`, or `user`.
    public let resourceType: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        actions: [ApiKeyGrantAction],
        resourceId: String,
        resourceType: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.actions = actions
        self.resourceId = resourceId
        self.resourceType = resourceType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actions = try container.decode([ApiKeyGrantAction].self, forKey: .actions)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.resourceType = try container.decode(String.self, forKey: .resourceType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.actions, forKey: .actions)
        try container.encode(self.resourceId, forKey: .resourceId)
        try container.encode(self.resourceType, forKey: .resourceType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case actions
        case resourceId = "resource_id"
        case resourceType = "resource_type"
    }
}