import Foundation

public struct PartnerAdvance: Codable, Hashable, Sendable {
    /// Qualifying card and BNPL payment volume in the preceding 30 days, in USD. Available on business detail responses before acceptance.
    public let activity30Day: Nullable<Money>
    /// Actual payment volume (cards and BNPL) in the preceding 60 days, in USD. Null when unavailable.
    public let activity60Day: Nullable<Money>
    /// The offered or accepted upfront CPA payment in USD.
    public let amount: Nullable<Money>
    /// Annual projected processing in USD.
    public let annualProcessing: Money
    /// When low activity triggered reversal and normal partner terms resumed. No prior commissions are paid retroactively.
    public let clawedBackAt: Nullable<String>
    /// End of the nine-month CPA term. Normal commissions resume prospectively without backfill.
    public let deadlineAt: Nullable<String>
    /// Estimated advance using the current CPA formula and observed payout rates, or current reference card pricing when qualifying payment history is unavailable. Available for unqualified projections on business detail responses; not a final offer.
    public let estimatedAmount: Nullable<Money>
    /// When the CPA payment was funded.
    public let fundedAt: Nullable<String>
    /// Signed offer valid for 15 minutes. Submit unchanged when accepting. Null unless the caller may accept this offer.
    public let offerToken: Nullable<String>
    /// Processing required in a rolling 30-day period to qualify, in USD.
    public let processingTarget: Money
    /// Projected payment volume (cards and BNPL) over 60 days, in USD.
    public let projected60DayActivity: Nullable<Money>
    /// Projected commissions over the remaining CPA term.
    public let projectedCommissions: Nullable<Money>
    /// Processing commissions projected for the remaining CPA term, in USD.
    public let projectedProcessingCommissions: Nullable<Money>
    /// First qualification timestamp.
    public let qualifiedAt: Nullable<String>
    /// 20% of projected 60-day payment volume (cards and BNPL). Performance checks begin 60 days after funding.
    public let recoveryThreshold: Nullable<Money>
    /// The CPA payment lifecycle state.
    public let status: PartnerAdvanceStatus
    /// Terms version required for acceptance.
    public let termsVersion: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        activity30Day: Nullable<Money>,
        activity60Day: Nullable<Money>,
        amount: Nullable<Money>,
        annualProcessing: Money,
        clawedBackAt: Nullable<String>,
        deadlineAt: Nullable<String>,
        estimatedAmount: Nullable<Money>,
        fundedAt: Nullable<String>,
        offerToken: Nullable<String>,
        processingTarget: Money,
        projected60DayActivity: Nullable<Money>,
        projectedCommissions: Nullable<Money>,
        projectedProcessingCommissions: Nullable<Money>,
        qualifiedAt: Nullable<String>,
        recoveryThreshold: Nullable<Money>,
        status: PartnerAdvanceStatus,
        termsVersion: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.activity30Day = activity30Day
        self.activity60Day = activity60Day
        self.amount = amount
        self.annualProcessing = annualProcessing
        self.clawedBackAt = clawedBackAt
        self.deadlineAt = deadlineAt
        self.estimatedAmount = estimatedAmount
        self.fundedAt = fundedAt
        self.offerToken = offerToken
        self.processingTarget = processingTarget
        self.projected60DayActivity = projected60DayActivity
        self.projectedCommissions = projectedCommissions
        self.projectedProcessingCommissions = projectedProcessingCommissions
        self.qualifiedAt = qualifiedAt
        self.recoveryThreshold = recoveryThreshold
        self.status = status
        self.termsVersion = termsVersion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.activity30Day = try container.decode(Nullable<Money>.self, forKey: .activity30Day)
        self.activity60Day = try container.decode(Nullable<Money>.self, forKey: .activity60Day)
        self.amount = try container.decode(Nullable<Money>.self, forKey: .amount)
        self.annualProcessing = try container.decode(Money.self, forKey: .annualProcessing)
        self.clawedBackAt = try container.decode(Nullable<String>.self, forKey: .clawedBackAt)
        self.deadlineAt = try container.decode(Nullable<String>.self, forKey: .deadlineAt)
        self.estimatedAmount = try container.decode(Nullable<Money>.self, forKey: .estimatedAmount)
        self.fundedAt = try container.decode(Nullable<String>.self, forKey: .fundedAt)
        self.offerToken = try container.decode(Nullable<String>.self, forKey: .offerToken)
        self.processingTarget = try container.decode(Money.self, forKey: .processingTarget)
        self.projected60DayActivity = try container.decode(Nullable<Money>.self, forKey: .projected60DayActivity)
        self.projectedCommissions = try container.decode(Nullable<Money>.self, forKey: .projectedCommissions)
        self.projectedProcessingCommissions = try container.decode(Nullable<Money>.self, forKey: .projectedProcessingCommissions)
        self.qualifiedAt = try container.decode(Nullable<String>.self, forKey: .qualifiedAt)
        self.recoveryThreshold = try container.decode(Nullable<Money>.self, forKey: .recoveryThreshold)
        self.status = try container.decode(PartnerAdvanceStatus.self, forKey: .status)
        self.termsVersion = try container.decode(Nullable<String>.self, forKey: .termsVersion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.activity30Day, forKey: .activity30Day)
        try container.encode(self.activity60Day, forKey: .activity60Day)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.annualProcessing, forKey: .annualProcessing)
        try container.encode(self.clawedBackAt, forKey: .clawedBackAt)
        try container.encode(self.deadlineAt, forKey: .deadlineAt)
        try container.encode(self.estimatedAmount, forKey: .estimatedAmount)
        try container.encode(self.fundedAt, forKey: .fundedAt)
        try container.encode(self.offerToken, forKey: .offerToken)
        try container.encode(self.processingTarget, forKey: .processingTarget)
        try container.encode(self.projected60DayActivity, forKey: .projected60DayActivity)
        try container.encode(self.projectedCommissions, forKey: .projectedCommissions)
        try container.encode(self.projectedProcessingCommissions, forKey: .projectedProcessingCommissions)
        try container.encode(self.qualifiedAt, forKey: .qualifiedAt)
        try container.encode(self.recoveryThreshold, forKey: .recoveryThreshold)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.termsVersion, forKey: .termsVersion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case activity30Day = "activity_30_day"
        case activity60Day = "activity_60_day"
        case amount
        case annualProcessing = "annual_processing"
        case clawedBackAt = "clawed_back_at"
        case deadlineAt = "deadline_at"
        case estimatedAmount = "estimated_amount"
        case fundedAt = "funded_at"
        case offerToken = "offer_token"
        case processingTarget = "processing_target"
        case projected60DayActivity = "projected_60_day_activity"
        case projectedCommissions = "projected_commissions"
        case projectedProcessingCommissions = "projected_processing_commissions"
        case qualifiedAt = "qualified_at"
        case recoveryThreshold = "recovery_threshold"
        case status
        case termsVersion = "terms_version"
    }
}