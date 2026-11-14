import Foundation

public struct PaymentLevelsRebate: Codable, Hashable, Sendable {
    /// Part of the account's monthly rebate this payment earned, in the currency it settled in. The rebate is paid to the account as one sum, so the payment's own amounts and fees don't change. `null` unless `status` is `rebated`.
    public let amount: Nullable<Money>
    /// How much of the payment the month's spend covered, from `0` to `1`: `1` for every rebated payment but the month's last, which can be covered in part, so its rebate is that share of the fee above the level's rate. `null` unless `status` is `rebated`.
    public let coveredShare: Nullable<Double>
    /// Processing fee as a percentage of the amount it was charged on, before the rebate, where `2.7` means 2.7%. `null` unless `status` is `rebated`.
    public let effectiveRatePercentage: Nullable<Double>
    /// Why the payment can't earn a rebate: `not_card_payment`, `before_levels` (made before Whop Levels started), `not_in_levels` (its account wasn't in Whop Levels that month), `fee_not_posted`, `fee_at_level_rate` (its fee was already at or below the level's rate) or `no_level_rate` (its fee matched no level rate). `null` unless `status` is `ineligible`.
    public let ineligibleReason: Nullable<PaymentLevelsRebateIneligibleReason>
    /// Level the account's month closed at, from `0` up to `10`. `null` until that month's close has applied to the payment, and for a payment that can't earn a rebate before then, such as a non-card payment.
    public let level: Nullable<Int>
    /// Start of the UTC month whose close covers this payment, as an ISO 8601 timestamp. `null` before the processing fee has posted, and for a payment that can't earn a rebate before then, such as a non-card payment.
    public let monthStartedAt: Nullable<String>
    /// Payment ID, prefixed `pay_`.
    public let paymentId: String
    /// Card processing percentage at `level` for cards from `region`, where `2.1` means 2.1%. The rebate is the fee above it. `null` unless `status` is `rebated`.
    public let processingRatePercentage: Nullable<Double>
    /// Card region the processing fee was charged in, which sets `processing_rate_percentage`. `null` unless `status` is `rebated`.
    public let region: Nullable<PaymentLevelsRebateRegion>
    /// `rebated` when the payment earned part of its account's monthly Whop Levels rebate. `pending` until the month its processing fee posted in has closed. `not_covered` when the account's spend that month ran out before this payment. `ineligible` when it can't earn one; `ineligible_reason` says why.
    public let status: PaymentLevelsRebateStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Nullable<Money>,
        coveredShare: Nullable<Double>,
        effectiveRatePercentage: Nullable<Double>,
        ineligibleReason: Nullable<PaymentLevelsRebateIneligibleReason>,
        level: Nullable<Int>,
        monthStartedAt: Nullable<String>,
        paymentId: String,
        processingRatePercentage: Nullable<Double>,
        region: Nullable<PaymentLevelsRebateRegion>,
        status: PaymentLevelsRebateStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.coveredShare = coveredShare
        self.effectiveRatePercentage = effectiveRatePercentage
        self.ineligibleReason = ineligibleReason
        self.level = level
        self.monthStartedAt = monthStartedAt
        self.paymentId = paymentId
        self.processingRatePercentage = processingRatePercentage
        self.region = region
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Nullable<Money>.self, forKey: .amount)
        self.coveredShare = try container.decode(Nullable<Double>.self, forKey: .coveredShare)
        self.effectiveRatePercentage = try container.decode(Nullable<Double>.self, forKey: .effectiveRatePercentage)
        self.ineligibleReason = try container.decode(Nullable<PaymentLevelsRebateIneligibleReason>.self, forKey: .ineligibleReason)
        self.level = try container.decode(Nullable<Int>.self, forKey: .level)
        self.monthStartedAt = try container.decode(Nullable<String>.self, forKey: .monthStartedAt)
        self.paymentId = try container.decode(String.self, forKey: .paymentId)
        self.processingRatePercentage = try container.decode(Nullable<Double>.self, forKey: .processingRatePercentage)
        self.region = try container.decode(Nullable<PaymentLevelsRebateRegion>.self, forKey: .region)
        self.status = try container.decode(PaymentLevelsRebateStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.coveredShare, forKey: .coveredShare)
        try container.encode(self.effectiveRatePercentage, forKey: .effectiveRatePercentage)
        try container.encode(self.ineligibleReason, forKey: .ineligibleReason)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.monthStartedAt, forKey: .monthStartedAt)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.processingRatePercentage, forKey: .processingRatePercentage)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case coveredShare = "covered_share"
        case effectiveRatePercentage = "effective_rate_percentage"
        case ineligibleReason = "ineligible_reason"
        case level
        case monthStartedAt = "month_started_at"
        case paymentId = "payment_id"
        case processingRatePercentage = "processing_rate_percentage"
        case region
        case status
    }
}