import Foundation

/// A fee markup configuration that defines additional charges applied to transactions for a platform's connected accounts.
public struct FeeMarkupListItem: Codable, Hashable, Sendable {
    /// The datetime the fee markup was created.
    public let createdAt: Date
    /// The category of fee this markup applies to.
    public let feeType: FeeMarkupTypes
    /// A flat fee charged per transaction, in USD. Ranges from 0 to 50. Null if no fixed fee is configured.
    public let fixedFeeUsd: Nullable<Double>
    /// The unique identifier for the fee markup.
    public let id: String
    /// Internal notes about this fee markup, visible only to administrators. Null if no notes have been added.
    public let notes: Nullable<String>
    /// A percentage-based fee charged per transaction. Ranges from 0 to 25. Null if no percentage fee is configured.
    public let percentageFee: Nullable<Double>
    /// The datetime the fee markup was last updated.
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        feeType: FeeMarkupTypes,
        fixedFeeUsd: Nullable<Double>,
        id: String,
        notes: Nullable<String>,
        percentageFee: Nullable<Double>,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.feeType = feeType
        self.fixedFeeUsd = fixedFeeUsd
        self.id = id
        self.notes = notes
        self.percentageFee = percentageFee
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.feeType = try container.decode(FeeMarkupTypes.self, forKey: .feeType)
        self.fixedFeeUsd = try container.decode(Nullable<Double>.self, forKey: .fixedFeeUsd)
        self.id = try container.decode(String.self, forKey: .id)
        self.notes = try container.decode(Nullable<String>.self, forKey: .notes)
        self.percentageFee = try container.decode(Nullable<Double>.self, forKey: .percentageFee)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.feeType, forKey: .feeType)
        try container.encode(self.fixedFeeUsd, forKey: .fixedFeeUsd)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.notes, forKey: .notes)
        try container.encode(self.percentageFee, forKey: .percentageFee)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case feeType = "fee_type"
        case fixedFeeUsd = "fixed_fee_usd"
        case id
        case notes
        case percentageFee = "percentage_fee"
        case updatedAt = "updated_at"
    }
}