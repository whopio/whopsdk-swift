import Foundation

/// Instant-delivery estimate. Null if unsupported, unavailable for the account, or the amount does not cover the fee.
public struct ListSupportedMethodsResponseDataItemQuotesItemInstant: Codable, Hashable, Sendable {
    public let estimatedArrival: Date
    public let fee: Float
    public let totalReceived: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        estimatedArrival: Date,
        fee: Float,
        totalReceived: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.estimatedArrival = estimatedArrival
        self.fee = fee
        self.totalReceived = totalReceived
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.estimatedArrival = try container.decode(Date.self, forKey: .estimatedArrival)
        self.fee = try container.decode(Float.self, forKey: .fee)
        self.totalReceived = try container.decode(Float.self, forKey: .totalReceived)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.estimatedArrival, forKey: .estimatedArrival)
        try container.encode(self.fee, forKey: .fee)
        try container.encode(self.totalReceived, forKey: .totalReceived)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case estimatedArrival = "estimated_arrival"
        case fee
        case totalReceived = "total_received"
    }
}