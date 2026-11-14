import Foundation

extension Requests {
    public struct CreatePaymentQuotesRequest: Codable, Hashable, Sendable {
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
        /// The buyer's billing address. Where tax is calculated when no shipping address is given, and the address a tax registration belongs to. A seller that collects tax on this purchase needs the buyer located by a `country` here, on `shipping_address`, a `presentment_country`, or an `ip_address`; without one the quote is refused with `quote_location_required`. Only the keys you supply are kept. The payment that consumes the quote must put the buyer in the same place, by country, state and postal code, through its own `shipping_address` or its confirmation token's billing address, or it is refused with `quote_mismatch`.
        public let address: Nullable<CreatePaymentQuotesRequestAddress>?
        /// The buyer's IP address, when your server makes the call on their behalf. Locates the buyer when neither address carries a country and no `presentment_country` is sent. A quote located this way (`located_by` is `ip_address`) is a preview: a payment refuses it with `quote_preview_only`, so quote again with the buyer's address before paying. Also where `presentment_currency` `auto` and `recommended_currencies` find the buyer's local currency, and where a payment method must be able to collect it.
        public let ipAddress: Nullable<String>?
        /// What the buyer is purchasing. Each entry names an existing variant by `variant_id`. Several entries form a cart, which requires every variant to be compatible, belong to this account, and use the same currency.
        public let lineItems: [CreatePaymentQuotesRequestLineItemsItem]?
        /// The country to price the purchase for, as an ISO 3166-1 alpha-2 code such as `JP`, when the buyer chose one: a store's country picker. Prices in the currency `auto` would pick for a buyer in that country, so send it instead of `presentment_currency`, never with it. Whether a payment method can collect that currency is still judged where the buyer is: by `ip_address`, and by this country only without one. With no address that carries a country, tax is estimated for this country (`located_by` is `presentment_country`) at the country level, and a quote located this way is a preview a payment refuses with `quote_preview_only`. Send it only once the buyer has chosen a country: without it, an `ip_address` estimates more precisely, such as for a US state. For a country Whop has no currency for, the quote is priced as `auto` for the buyer's `ip_address`, and tax is still estimated for the country.
        public let presentmentCountry: Nullable<String>?
        /// The currency to price and charge the purchase in. Omit it, or send null, to price in the variants' own currency. `auto` prices in the currency of the country Whop places the buyer's `ip_address` in when the purchase can be converted into it and a payment method can collect it, and in the variants' own currency otherwise, including when no `ip_address` is sent or Whop cannot place it in a country. To choose that country instead, send `presentment_country` in place of this. A three-letter ISO 4217 code, such as `eur`, prices in that currency or is refused: with `presentment_currency_unsupported` when the purchase cannot be converted into it (adaptive pricing is off for the variant, the variant is not a one-time purchase, or `plan` describes a variant that does not exist yet), and with `presentment_currency_not_payable` when no payment method can collect it. A converted quote states every amount in this currency at an `exchange_rate` fixed until `expires_at`, and the payment that consumes it is charged in this currency at that rate.
        public let presentmentCurrency: Nullable<String>?
        /// Where physical goods ship. When present it is where tax is calculated; omit it for digital goods. Only the keys you supply are kept. The payment that consumes the quote must ship to the same place, by country, state and postal code, or it is refused with `quote_mismatch`.
        public let shippingAddress: Nullable<CreatePaymentQuotesRequestShippingAddress>?
        /// The buyer's tax registration, for a business purchase. One entry. Prices the purchase as business-to-business where that applies (EU reverse charge, for one) and requires an `address` to belong to.
        public let taxIds: Nullable<[CreatePaymentQuotesRequestTaxIdsItem]>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            promoCode: Nullable<String>? = nil,
            promoCodeId: Nullable<String>? = nil,
            variant: PaymentInputVariant? = nil,
            variantId: String? = nil,
            address: Nullable<CreatePaymentQuotesRequestAddress>? = nil,
            ipAddress: Nullable<String>? = nil,
            lineItems: [CreatePaymentQuotesRequestLineItemsItem]? = nil,
            presentmentCountry: Nullable<String>? = nil,
            presentmentCurrency: Nullable<String>? = nil,
            shippingAddress: Nullable<CreatePaymentQuotesRequestShippingAddress>? = nil,
            taxIds: Nullable<[CreatePaymentQuotesRequestTaxIdsItem]>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.promoCode = promoCode
            self.promoCodeId = promoCodeId
            self.variant = variant
            self.variantId = variantId
            self.address = address
            self.ipAddress = ipAddress
            self.lineItems = lineItems
            self.presentmentCountry = presentmentCountry
            self.presentmentCurrency = presentmentCurrency
            self.shippingAddress = shippingAddress
            self.taxIds = taxIds
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.promoCode = try container.decodeNullableIfPresent(String.self, forKey: .promoCode)
            self.promoCodeId = try container.decodeNullableIfPresent(String.self, forKey: .promoCodeId)
            self.variant = try container.decodeIfPresent(PaymentInputVariant.self, forKey: .variant)
            self.variantId = try container.decodeIfPresent(String.self, forKey: .variantId)
            self.address = try container.decodeNullableIfPresent(CreatePaymentQuotesRequestAddress.self, forKey: .address)
            self.ipAddress = try container.decodeNullableIfPresent(String.self, forKey: .ipAddress)
            self.lineItems = try container.decodeIfPresent([CreatePaymentQuotesRequestLineItemsItem].self, forKey: .lineItems)
            self.presentmentCountry = try container.decodeNullableIfPresent(String.self, forKey: .presentmentCountry)
            self.presentmentCurrency = try container.decodeNullableIfPresent(String.self, forKey: .presentmentCurrency)
            self.shippingAddress = try container.decodeNullableIfPresent(CreatePaymentQuotesRequestShippingAddress.self, forKey: .shippingAddress)
            self.taxIds = try container.decodeNullableIfPresent([CreatePaymentQuotesRequestTaxIdsItem].self, forKey: .taxIds)
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
            try container.encodeNullableIfPresent(self.address, forKey: .address)
            try container.encodeNullableIfPresent(self.ipAddress, forKey: .ipAddress)
            try container.encodeIfPresent(self.lineItems, forKey: .lineItems)
            try container.encodeNullableIfPresent(self.presentmentCountry, forKey: .presentmentCountry)
            try container.encodeNullableIfPresent(self.presentmentCurrency, forKey: .presentmentCurrency)
            try container.encodeNullableIfPresent(self.shippingAddress, forKey: .shippingAddress)
            try container.encodeNullableIfPresent(self.taxIds, forKey: .taxIds)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case promoCode = "promo_code"
            case promoCodeId = "promo_code_id"
            case variant
            case variantId = "variant_id"
            case address
            case ipAddress = "ip_address"
            case lineItems = "line_items"
            case presentmentCountry = "presentment_country"
            case presentmentCurrency = "presentment_currency"
            case shippingAddress = "shipping_address"
            case taxIds = "tax_ids"
        }
    }
}