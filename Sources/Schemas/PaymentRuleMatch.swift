import Foundation

public struct PaymentRuleMatch: Codable, Hashable, Sendable {
    /// What the rule asked for.
    public let action: PaymentRuleMatchAction
    /// Payment rule ID, prefixed `prule_`.
    public let id: String
    /// The rule's name when it matched. Renaming the rule afterwards does not rewrite this.
    public let name: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: PaymentRuleMatchAction,
        id: String,
        name: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.id = id
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(PaymentRuleMatchAction.self, forKey: .action)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case id
        case name
    }
}