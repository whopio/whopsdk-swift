import Foundation

public struct AccountRecommendedActionChain: Codable, Hashable, Sendable {
    public let actions: [AccountRecommendedActionChainStep]
    /// What running the chain accomplishes
    public let description: String
    /// Chain ID — `rac_seed_<chain>_<nonce>` for seeded chains, `rac_chain_*` for generated ones
    public let id: String
    /// Why the generator proposed this chain, or `null` for seeded chains
    public let reasoning: Nullable<[String: JSONValue]>
    /// Headline for the chain
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        actions: [AccountRecommendedActionChainStep],
        description: String,
        id: String,
        reasoning: Nullable<[String: JSONValue]>,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.actions = actions
        self.description = description
        self.id = id
        self.reasoning = reasoning
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actions = try container.decode([AccountRecommendedActionChainStep].self, forKey: .actions)
        self.description = try container.decode(String.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.reasoning = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .reasoning)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.actions, forKey: .actions)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.reasoning, forKey: .reasoning)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case actions
        case description
        case id
        case reasoning
        case title
    }
}