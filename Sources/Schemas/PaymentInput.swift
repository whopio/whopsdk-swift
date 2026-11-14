import Foundation

/// The account, variant and promo code for a purchase.
public struct PaymentInput: Codable, Hashable, Sendable {
    /// The account the purchase belongs to, prefixed `biz_`.
    public let accountId: String
    /// The promo code as the buyer typed it, matched within the account regardless of case and surrounding spaces, as checkout matches it. It must be valid for the variant. Send it or `promo_code_id`, not both; an empty or whitespace-only string counts as not sent. A code the account does not have, or one that is no longer active, is refused before anything is written, with the error code `promo_invalid`. A code this purchase cannot use, such as one with no uses left or one restricted to other variants, products or buyers, is refused with `promo_invalid` too, and the error's message says why.
    public let promoCode: Nullable<String>?
    /// An active promo code to apply, prefixed `promo_`. It must belong to the account and be valid for the variant. Send it or `promo_code`, not both. A code this purchase cannot use is refused with the error code `promo_invalid`, and the error's message says why.
    public let promoCodeId: Nullable<String>?
    /// The variant purchased, described by its attributes instead of an id: the variant with exactly these attributes is used, and one is created when none exists. Mutually exclusive with `variant_id` and `line_items`. Creating a variant requires `plan:create`; creating or updating a product requires the corresponding product permission.
    public let variant: PaymentInputVariant?
    /// The variant purchased, prefixed `plan_`. It must belong to the account. Mutually exclusive with `variant` and `line_items`.
    public let variantId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        promoCode: Nullable<String>? = nil,
        promoCodeId: Nullable<String>? = nil,
        variant: PaymentInputVariant? = nil,
        variantId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.promoCode = promoCode
        self.promoCodeId = promoCodeId
        self.variant = variant
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.promoCode = try container.decodeNullableIfPresent(String.self, forKey: .promoCode)
        self.promoCodeId = try container.decodeNullableIfPresent(String.self, forKey: .promoCodeId)
        self.variant = try container.decodeIfPresent(PaymentInputVariant.self, forKey: .variant)
        self.variantId = try container.decodeIfPresent(String.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encodeNullableIfPresent(self.promoCode, forKey: .promoCode)
        try container.encodeNullableIfPresent(self.promoCodeId, forKey: .promoCodeId)
        try container.encodeIfPresent(self.variant, forKey: .variant)
        try container.encodeIfPresent(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case promoCode = "promo_code"
        case promoCodeId = "promo_code_id"
        case variant
        case variantId = "variant_id"
    }
}