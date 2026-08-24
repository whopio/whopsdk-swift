import Foundation

public struct AccountRecommendedActionOutcome: Codable, Hashable, Sendable {
    /// The business the chain ran on.
    public let account: Nullable<[String: JSONValue]>
    public let actions: [AccountRecommendedActionChainStep]
    /// What running the chain accomplishes
    public let description: String
    /// When the chain was run, as an ISO 8601 timestamp.
    public let executedAt: String
    /// The executed chain id (`rac_chain_*` or `rac_seed_*`)
    public let id: String
    /// Milliseconds from chain execution to that payment, or `null`.
    public let latencyMs: Nullable<Int>
    /// The payment amount as Money, or `null`.
    public let payment: Nullable<[String: JSONValue]>
    /// When that payment completed, ISO 8601, or `null`.
    public let paymentAt: Nullable<String>
    /// The first `payment.completed` on that business after the chain, prefixed `pay_`, or `null` if none landed within 30 days.
    public let paymentId: Nullable<String>
    /// Why the generator proposed this chain, or `null` for seeded chains
    public let reasoning: Nullable<[String: JSONValue]>
    /// Headline for the chain
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<[String: JSONValue]>,
        actions: [AccountRecommendedActionChainStep],
        description: String,
        executedAt: String,
        id: String,
        latencyMs: Nullable<Int>,
        payment: Nullable<[String: JSONValue]>,
        paymentAt: Nullable<String>,
        paymentId: Nullable<String>,
        reasoning: Nullable<[String: JSONValue]>,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.actions = actions
        self.description = description
        self.executedAt = executedAt
        self.id = id
        self.latencyMs = latencyMs
        self.payment = payment
        self.paymentAt = paymentAt
        self.paymentId = paymentId
        self.reasoning = reasoning
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .account)
        self.actions = try container.decode([AccountRecommendedActionChainStep].self, forKey: .actions)
        self.description = try container.decode(String.self, forKey: .description)
        self.executedAt = try container.decode(String.self, forKey: .executedAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.latencyMs = try container.decode(Nullable<Int>.self, forKey: .latencyMs)
        self.payment = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .payment)
        self.paymentAt = try container.decode(Nullable<String>.self, forKey: .paymentAt)
        self.paymentId = try container.decode(Nullable<String>.self, forKey: .paymentId)
        self.reasoning = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .reasoning)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.actions, forKey: .actions)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.executedAt, forKey: .executedAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.latencyMs, forKey: .latencyMs)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.paymentAt, forKey: .paymentAt)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.reasoning, forKey: .reasoning)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case actions
        case description
        case executedAt = "executed_at"
        case id
        case latencyMs = "latency_ms"
        case payment
        case paymentAt = "payment_at"
        case paymentId = "payment_id"
        case reasoning
        case title
    }
}