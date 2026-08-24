import Foundation

/// Input for a single permissions statement
public struct CreateApiKeyCompaniesRequestPermissionsItem: Codable, Hashable, Sendable {
    /// Actions covered by this statement
    public let actions: [String]
    /// Whether the actions are granted or denied
    public let grant: Bool
    /// Resource identifiers. Can look like 'biz_xxxx' or 'biz_xxx|pass_*|exp_xxx' or 'biz_xxx|app_xxx' or 'biz_xxx|pass_xxx|exp_xxx' or 'biz_xxx|pass_xxx' or 'biz_xxx|pass_*'
    public let resources: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        actions: [String],
        grant: Bool,
        resources: [String],
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
        self.resources = try container.decode([String].self, forKey: .resources)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.actions, forKey: .actions)
        try container.encode(self.grant, forKey: .grant)
        try container.encode(self.resources, forKey: .resources)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case actions
        case grant
        case resources
    }
}