import Foundation

public struct PartnerReferralReward: Codable, Hashable, Sendable {
    /// Activity that qualifies for this reward, when specified.
    public let botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>
    /// Partner reward ID, prefixed `prwd_`.
    public let id: String
    /// USD amount of qualifying activity required to earn the reward.
    public let qualificationAmount: Money
    /// Reward recipient's role, or null for a fixed user who is not the requesting partner.
    public let recipient: Nullable<PartnerReferralRewardRecipient>
    /// Concrete recipient's user or business ID, or null until a business redeems the offer.
    public let recipientId: Nullable<String>
    /// USD amount granted after qualification.
    public let rewardAmount: Money
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        botQualificationType: Nullable<PartnerReferralRewardBotQualificationType>,
        id: String,
        qualificationAmount: Money,
        recipient: Nullable<PartnerReferralRewardRecipient>,
        recipientId: Nullable<String>,
        rewardAmount: Money,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.botQualificationType = botQualificationType
        self.id = id
        self.qualificationAmount = qualificationAmount
        self.recipient = recipient
        self.recipientId = recipientId
        self.rewardAmount = rewardAmount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.botQualificationType = try container.decode(Nullable<PartnerReferralRewardBotQualificationType>.self, forKey: .botQualificationType)
        self.id = try container.decode(String.self, forKey: .id)
        self.qualificationAmount = try container.decode(Money.self, forKey: .qualificationAmount)
        self.recipient = try container.decode(Nullable<PartnerReferralRewardRecipient>.self, forKey: .recipient)
        self.recipientId = try container.decode(Nullable<String>.self, forKey: .recipientId)
        self.rewardAmount = try container.decode(Money.self, forKey: .rewardAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.botQualificationType, forKey: .botQualificationType)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.qualificationAmount, forKey: .qualificationAmount)
        try container.encode(self.recipient, forKey: .recipient)
        try container.encode(self.recipientId, forKey: .recipientId)
        try container.encode(self.rewardAmount, forKey: .rewardAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case botQualificationType = "bot_qualification_type"
        case id
        case qualificationAmount = "qualification_amount"
        case recipient
        case recipientId = "recipient_id"
        case rewardAmount = "reward_amount"
    }
}