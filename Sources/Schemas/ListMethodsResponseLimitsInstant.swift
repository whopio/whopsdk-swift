import Foundation

/// Caps for instant-speed payouts, which additionally draw on pending funds.
public struct ListMethodsResponseLimitsInstant: Codable, Hashable, Sendable {
    /// How much of the account's daily instant allowance is left, in the requested currency. Null when the account is exempt from the daily cap, which is not the same as 0.
    public let dailyAmountRemaining: Nullable<Float>
    /// Why instant payouts are unavailable for this account, or null when they are available.
    public let errorCode: Nullable<ListMethodsResponseLimitsInstantErrorCode>
    /// Human-readable form of error_code, or null when instant payouts are available.
    public let errorMessage: Nullable<String>
    /// The maximum amount an instant payout can move right now, in whole currency units. Already bounded by the remaining daily instant allowance; 0 while an eligibility error blocks instant payouts.
    public let maxAmount: Float
    /// When the daily instant allowance resets, or null when the account is exempt from the daily cap.
    public let resetsAt: Nullable<Date>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        dailyAmountRemaining: Nullable<Float>,
        errorCode: Nullable<ListMethodsResponseLimitsInstantErrorCode>,
        errorMessage: Nullable<String>,
        maxAmount: Float,
        resetsAt: Nullable<Date>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.dailyAmountRemaining = dailyAmountRemaining
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.maxAmount = maxAmount
        self.resetsAt = resetsAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dailyAmountRemaining = try container.decode(Nullable<Float>.self, forKey: .dailyAmountRemaining)
        self.errorCode = try container.decode(Nullable<ListMethodsResponseLimitsInstantErrorCode>.self, forKey: .errorCode)
        self.errorMessage = try container.decode(Nullable<String>.self, forKey: .errorMessage)
        self.maxAmount = try container.decode(Float.self, forKey: .maxAmount)
        self.resetsAt = try container.decode(Nullable<Date>.self, forKey: .resetsAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.dailyAmountRemaining, forKey: .dailyAmountRemaining)
        try container.encode(self.errorCode, forKey: .errorCode)
        try container.encode(self.errorMessage, forKey: .errorMessage)
        try container.encode(self.maxAmount, forKey: .maxAmount)
        try container.encode(self.resetsAt, forKey: .resetsAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case dailyAmountRemaining = "daily_amount_remaining"
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case maxAmount = "max_amount"
        case resetsAt = "resets_at"
    }
}