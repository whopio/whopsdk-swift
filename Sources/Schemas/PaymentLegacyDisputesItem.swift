import Foundation

/// A dispute is a chargeback or payment challenge filed against a company, including evidence and response status.
public struct PaymentLegacyDisputesItem: Codable, Hashable, Sendable {
    /// The disputed amount in the specified currency, formatted as a decimal.
    public let amount: Double
    /// The three-letter ISO currency code for the disputed amount.
    public let currency: Currencies
    /// Whether the dispute evidence can still be edited and submitted.
    public let editable: Nullable<Bool>
    /// The unique identifier for the dispute.
    public let id: String
    /// The deadline by which dispute evidence must be submitted. Null if no response deadline is set.
    public let needsResponseBy: Nullable<Date>
    /// Additional freeform notes submitted by the company as part of the dispute evidence.
    public let notes: Nullable<String>
    /// A human-readable reason for the dispute.
    public let reason: Nullable<String>
    /// The current status of the dispute lifecycle, such as needs_response, under_review, won, or lost.
    public let status: DisputeStatuses
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        currency: Currencies,
        editable: Nullable<Bool>,
        id: String,
        needsResponseBy: Nullable<Date>,
        notes: Nullable<String>,
        reason: Nullable<String>,
        status: DisputeStatuses,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.currency = currency
        self.editable = editable
        self.id = id
        self.needsResponseBy = needsResponseBy
        self.notes = notes
        self.reason = reason
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.editable = try container.decode(Nullable<Bool>.self, forKey: .editable)
        self.id = try container.decode(String.self, forKey: .id)
        self.needsResponseBy = try container.decode(Nullable<Date>.self, forKey: .needsResponseBy)
        self.notes = try container.decode(Nullable<String>.self, forKey: .notes)
        self.reason = try container.decode(Nullable<String>.self, forKey: .reason)
        self.status = try container.decode(DisputeStatuses.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.editable, forKey: .editable)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.needsResponseBy, forKey: .needsResponseBy)
        try container.encode(self.notes, forKey: .notes)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case currency
        case editable
        case id
        case needsResponseBy = "needs_response_by"
        case notes
        case reason
        case status
    }
}