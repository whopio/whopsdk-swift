import Foundation

public struct CreateApiKeysRequestPermissionsStatementsItem: Codable, Hashable, Sendable {
    /// Permission actions covered by this statement, for example `company:basic:read`.
    public let actions: [String]
    /// Whether the actions are granted (`true`) or denied (`false`).
    public let grant: Bool
    /// Resource identifiers the statement applies to, for example `biz_xxx` or `biz_xxx|prod_*`. Defaults to the key's owning resource when omitted.
    public let resources: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        actions: [String],
        grant: Bool,
        resources: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.actions = actions
        self.grant = grant
        self.resources = resources
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actions = try container.decode([String].self, forKey: .actions)
        self.grant = try container.decode(Bool.self, forKey: .grant)
        self.resources = try container.decodeIfPresent([String].self, forKey: .resources)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.actions, forKey: .actions)
        try container.encode(self.grant, forKey: .grant)
        try container.encodeIfPresent(self.resources, forKey: .resources)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case actions
        case grant
        case resources
    }
}