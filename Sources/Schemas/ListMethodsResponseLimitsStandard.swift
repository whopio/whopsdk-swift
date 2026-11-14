import Foundation

/// Caps for standard-speed payouts, which draw on settled funds only.
public struct ListMethodsResponseLimitsStandard: Codable, Hashable, Sendable {
    /// Why a standard payout cannot move funds right now, or null when the cap is above 0.
    public let errorCode: Nullable<ListMethodsResponseLimitsStandardErrorCode>
    /// Human-readable form of error_code, or null when a standard payout can move funds.
    public let errorMessage: Nullable<String>
    /// The maximum amount a standard payout can move right now, in whole currency units.
    public let maxAmount: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        errorCode: Nullable<ListMethodsResponseLimitsStandardErrorCode>,
        errorMessage: Nullable<String>,
        maxAmount: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.maxAmount = maxAmount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.errorCode = try container.decode(Nullable<ListMethodsResponseLimitsStandardErrorCode>.self, forKey: .errorCode)
        self.errorMessage = try container.decode(Nullable<String>.self, forKey: .errorMessage)
        self.maxAmount = try container.decode(Float.self, forKey: .maxAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.errorCode, forKey: .errorCode)
        try container.encode(self.errorMessage, forKey: .errorMessage)
        try container.encode(self.maxAmount, forKey: .maxAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case maxAmount = "max_amount"
    }
}