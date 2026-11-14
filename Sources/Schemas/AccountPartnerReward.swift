import Foundation

public struct AccountPartnerReward: Codable, Hashable, Sendable {
    /// Reward definition ID, prefixed `prwd_`. Progress and status apply to the containing account.
    public let id: String
    /// Qualifying USD volume required to earn this reward.
    public let qualificationAmount: Money
    /// Qualifying USD volume for the reward’s activity accumulated by this account since attribution, calculated using the fulfillment rules.
    public let qualificationProgress: Money
    /// Activity that qualifies this account for the reward.
    public let qualificationType: AccountPartnerRewardQualificationType
    /// USD amount credited for this reward. Uses the saved grant amount once fulfillment has started.
    public let rewardAmount: Money
    /// This account's reward state. Credited requires a posted ledger entry; processing includes a met requirement awaiting fulfillment. Reversing and reversed reflect a subsequent reward reversal.
    public let status: AccountPartnerRewardStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        qualificationAmount: Money,
        qualificationProgress: Money,
        qualificationType: AccountPartnerRewardQualificationType,
        rewardAmount: Money,
        status: AccountPartnerRewardStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.qualificationAmount = qualificationAmount
        self.qualificationProgress = qualificationProgress
        self.qualificationType = qualificationType
        self.rewardAmount = rewardAmount
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.qualificationAmount = try container.decode(Money.self, forKey: .qualificationAmount)
        self.qualificationProgress = try container.decode(Money.self, forKey: .qualificationProgress)
        self.qualificationType = try container.decode(AccountPartnerRewardQualificationType.self, forKey: .qualificationType)
        self.rewardAmount = try container.decode(Money.self, forKey: .rewardAmount)
        self.status = try container.decode(AccountPartnerRewardStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.qualificationAmount, forKey: .qualificationAmount)
        try container.encode(self.qualificationProgress, forKey: .qualificationProgress)
        try container.encode(self.qualificationType, forKey: .qualificationType)
        try container.encode(self.rewardAmount, forKey: .rewardAmount)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case qualificationAmount = "qualification_amount"
        case qualificationProgress = "qualification_progress"
        case qualificationType = "qualification_type"
        case rewardAmount = "reward_amount"
        case status
    }
}