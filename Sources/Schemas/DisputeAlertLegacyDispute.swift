import Foundation

/// The dispute associated with the dispute alert.
public struct DisputeAlertLegacyDispute: Codable, Hashable, Sendable {
    /// The disputed amount in the specified currency, formatted as a decimal.
    public let amount: Double
    /// The datetime the dispute was created.
    public let createdAt: Nullable<Date>
    /// The three-letter ISO currency code for the disputed amount.
    public let currency: Currencies
    /// The unique identifier for the dispute.
    public let id: String
    /// A human-readable reason for the dispute.
    public let reason: Nullable<String>
    /// The current status of the dispute lifecycle, such as needs_response, under_review, won, or lost.
    public let status: DisputeStatuses
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        createdAt: Nullable<Date>,
        currency: Currencies,
        id: String,
        reason: Nullable<String>,
        status: DisputeStatuses,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.createdAt = createdAt
        self.currency = currency
        self.id = id
        self.reason = reason
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.createdAt = try container.decode(Nullable<Date>.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.reason = try container.decode(Nullable<String>.self, forKey: .reason)
        self.status = try container.decode(DisputeStatuses.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case createdAt = "created_at"
        case currency
        case id
        case reason
        case status
    }
}