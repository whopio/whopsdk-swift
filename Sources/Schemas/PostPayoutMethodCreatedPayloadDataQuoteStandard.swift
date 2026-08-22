import Foundation

/// Standard-delivery estimate. Null if the method does not support standard delivery, or the amount does not cover the fee.
public struct PostPayoutMethodCreatedPayloadDataQuoteStandard: Codable, Hashable, Sendable {
    /// Total fee charged, in the withdrawal currency.
    public let fee: Float
    /// Amount delivered after fees, in the withdrawal currency.
    public let totalReceived: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fee: Float,
        totalReceived: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fee = fee
        self.totalReceived = totalReceived
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fee = try container.decode(Float.self, forKey: .fee)
        self.totalReceived = try container.decode(Float.self, forKey: .totalReceived)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fee, forKey: .fee)
        try container.encode(self.totalReceived, forKey: .totalReceived)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fee
        case totalReceived = "total_received"
    }
}