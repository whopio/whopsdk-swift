import Foundation

public struct AccountParentFeesValue: Codable, Hashable, Sendable {
    /// Fixed markup in US dollars per transaction.
    public let fixedFeeUsd: Double
    /// Percentage of the transaction charged as markup.
    public let percentageFee: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fixedFeeUsd: Double,
        percentageFee: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fixedFeeUsd = fixedFeeUsd
        self.percentageFee = percentageFee
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fixedFeeUsd = try container.decode(Double.self, forKey: .fixedFeeUsd)
        self.percentageFee = try container.decode(Double.self, forKey: .percentageFee)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fixedFeeUsd, forKey: .fixedFeeUsd)
        try container.encode(self.percentageFee, forKey: .percentageFee)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fixedFeeUsd = "fixed_fee_usd"
        case percentageFee = "percentage_fee"
    }
}