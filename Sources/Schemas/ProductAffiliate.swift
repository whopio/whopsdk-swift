import Foundation

public struct ProductAffiliate: Codable, Hashable, Sendable {
    /// When the affiliate enrollment was created, as an ISO 8601 timestamp. Includes automatically created enrollments.
    public let createdAt: String
    /// Product affiliate ID, prefixed `apaf_`.
    public let id: String
    /// The product the affiliate is enrolled to promote.
    public let product: PromoCodeProduct
    /// Number of distinct users referred by the affiliate to this product.
    public let referredUsersCount: Int
    /// Whether the affiliate's enrollment is active or archived.
    public let status: ProductAffiliateStatus
    /// Net rewards earned by the affiliate for this product after fees and reversals, in USD.
    public let totalRewardAmountUsd: Money
    /// The user enrolled as an affiliate.
    public let user: ProductAffiliateUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        id: String,
        product: PromoCodeProduct,
        referredUsersCount: Int,
        status: ProductAffiliateStatus,
        totalRewardAmountUsd: Money,
        user: ProductAffiliateUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.id = id
        self.product = product
        self.referredUsersCount = referredUsersCount
        self.status = status
        self.totalRewardAmountUsd = totalRewardAmountUsd
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.product = try container.decode(PromoCodeProduct.self, forKey: .product)
        self.referredUsersCount = try container.decode(Int.self, forKey: .referredUsersCount)
        self.status = try container.decode(ProductAffiliateStatus.self, forKey: .status)
        self.totalRewardAmountUsd = try container.decode(Money.self, forKey: .totalRewardAmountUsd)
        self.user = try container.decode(ProductAffiliateUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.referredUsersCount, forKey: .referredUsersCount)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.totalRewardAmountUsd, forKey: .totalRewardAmountUsd)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case product
        case referredUsersCount = "referred_users_count"
        case status
        case totalRewardAmountUsd = "total_reward_amount_usd"
        case user
    }
}