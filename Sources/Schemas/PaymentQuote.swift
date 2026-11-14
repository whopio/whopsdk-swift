import Foundation

public struct PaymentQuote: Codable, Hashable, Sendable {
    /// The account the purchase is priced for, prefixed `biz_`.
    public let accountId: String
    /// The billing address the purchase was priced with, or null. Where tax was calculated when no shipping address was given, and the address the registration belongs to.
    public let address: Nullable<PaymentAddress>
    /// Three-letter ISO 4217 code of the variants' own currency, lowercase. Equal to `currency` when nothing was converted.
    public let baseCurrency: String
    /// `total` in `base_currency` at `exchange_rate`: the variants' own prices after the promo code, plus `tax_amount` converted at `exchange_rate` when tax is added on top. Equal to `total` when nothing was converted. The payment charges `total`, in `currency`.
    public let baseTotal: Money
    /// When the quote was priced, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Three-letter ISO 4217 currency code the purchase is priced and charged in, lowercase: the variants' own currency, or the `presentment_currency` it was converted into.
    public let currency: String
    /// What the promo code takes off. Zero without a code.
    public let discount: Money
    /// How many units of `currency` one unit of `base_currency` buys, as a decimal string such as `"5.4321"`: the rate the variants' prices were converted at, fixed until `expires_at`, and the rate a payment consuming the quote is charged at. A string, like money amounts, so no float rounds it in transit. Null when nothing was converted.
    public let exchangeRate: Nullable<String>
    /// When the quote stops being chargeable, as an ISO 8601 timestamp. Quote again after it.
    public let expiresAt: String
    /// Payment quote ID, prefixed `pq_`.
    public let id: String
    public let lineItems: [PaymentQuoteLineItem]
    /// Which location tax was calculated for: `shipping_address` when it carries a country, else the billing `address` when it does, else the `presentment_country` sent, else the buyer's `ip_address`. A quote located by `presentment_country` or `ip_address` is a preview that estimates tax: a payment cannot use it, so quote again with the buyer's address to pay. Null when nothing in the request located the buyer, which only a seller that collects no tax on this purchase is quoted without; `tax_status` is then `not_applicable`.
    public let locatedBy: Nullable<PaymentQuoteLocatedBy>
    /// The payment holding this quote, prefixed `pay_`, or null while it is unspent. A declined payment keeps its quote and can be retried; check that payment's `status`.
    public let paymentId: Nullable<String>
    /// The promo code the quote applied, prefixed `promo_`, or null.
    public let promoCodeId: Nullable<String>
    public let recommendedCurrencies: [String]
    /// The shipping address the purchase was priced with, or null. When present it is where tax was calculated.
    public let shippingAddress: Nullable<PaymentAddress>
    /// The price of every line before the promo code, tax and fees.
    public let subtotal: Money
    /// The tax a payment consuming this quote charges. Zero unless `tax_status` is `calculated`.
    public let taxAmount: Money
    /// Whether tax is added on top of the price (`exclusive`) or already inside it (`inclusive`). Null when no tax was calculated.
    public let taxBehavior: Nullable<PaymentQuoteTaxBehavior>
    public let taxIds: [TaxId]
    /// `calculated`: every line was priced and a payment may consume the quote. `not_applicable`: this seller collects no tax on this purchase, so the quote owes none and may still be consumed. `unavailable`: tax could not be priced — the provider did not answer, or this seller's tax setup cannot price a purchase here — so a payment refuses the quote; quote again, or charge without `quote_id` to have tax calculated at charge time.
    public let taxStatus: PaymentQuoteTaxStatus
    /// What the buyer pays: the subtotal less the discount, plus `tax_amount` when tax is added on top.
    public let total: Money
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        address: Nullable<PaymentAddress>,
        baseCurrency: String,
        baseTotal: Money,
        createdAt: String,
        currency: String,
        discount: Money,
        exchangeRate: Nullable<String>,
        expiresAt: String,
        id: String,
        lineItems: [PaymentQuoteLineItem],
        locatedBy: Nullable<PaymentQuoteLocatedBy>,
        paymentId: Nullable<String>,
        promoCodeId: Nullable<String>,
        recommendedCurrencies: [String],
        shippingAddress: Nullable<PaymentAddress>,
        subtotal: Money,
        taxAmount: Money,
        taxBehavior: Nullable<PaymentQuoteTaxBehavior>,
        taxIds: [TaxId],
        taxStatus: PaymentQuoteTaxStatus,
        total: Money,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.address = address
        self.baseCurrency = baseCurrency
        self.baseTotal = baseTotal
        self.createdAt = createdAt
        self.currency = currency
        self.discount = discount
        self.exchangeRate = exchangeRate
        self.expiresAt = expiresAt
        self.id = id
        self.lineItems = lineItems
        self.locatedBy = locatedBy
        self.paymentId = paymentId
        self.promoCodeId = promoCodeId
        self.recommendedCurrencies = recommendedCurrencies
        self.shippingAddress = shippingAddress
        self.subtotal = subtotal
        self.taxAmount = taxAmount
        self.taxBehavior = taxBehavior
        self.taxIds = taxIds
        self.taxStatus = taxStatus
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.address = try container.decode(Nullable<PaymentAddress>.self, forKey: .address)
        self.baseCurrency = try container.decode(String.self, forKey: .baseCurrency)
        self.baseTotal = try container.decode(Money.self, forKey: .baseTotal)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.discount = try container.decode(Money.self, forKey: .discount)
        self.exchangeRate = try container.decode(Nullable<String>.self, forKey: .exchangeRate)
        self.expiresAt = try container.decode(String.self, forKey: .expiresAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.lineItems = try container.decode([PaymentQuoteLineItem].self, forKey: .lineItems)
        self.locatedBy = try container.decode(Nullable<PaymentQuoteLocatedBy>.self, forKey: .locatedBy)
        self.paymentId = try container.decode(Nullable<String>.self, forKey: .paymentId)
        self.promoCodeId = try container.decode(Nullable<String>.self, forKey: .promoCodeId)
        self.recommendedCurrencies = try container.decode([String].self, forKey: .recommendedCurrencies)
        self.shippingAddress = try container.decode(Nullable<PaymentAddress>.self, forKey: .shippingAddress)
        self.subtotal = try container.decode(Money.self, forKey: .subtotal)
        self.taxAmount = try container.decode(Money.self, forKey: .taxAmount)
        self.taxBehavior = try container.decode(Nullable<PaymentQuoteTaxBehavior>.self, forKey: .taxBehavior)
        self.taxIds = try container.decode([TaxId].self, forKey: .taxIds)
        self.taxStatus = try container.decode(PaymentQuoteTaxStatus.self, forKey: .taxStatus)
        self.total = try container.decode(Money.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.baseCurrency, forKey: .baseCurrency)
        try container.encode(self.baseTotal, forKey: .baseTotal)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.discount, forKey: .discount)
        try container.encode(self.exchangeRate, forKey: .exchangeRate)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lineItems, forKey: .lineItems)
        try container.encode(self.locatedBy, forKey: .locatedBy)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.promoCodeId, forKey: .promoCodeId)
        try container.encode(self.recommendedCurrencies, forKey: .recommendedCurrencies)
        try container.encode(self.shippingAddress, forKey: .shippingAddress)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.taxAmount, forKey: .taxAmount)
        try container.encode(self.taxBehavior, forKey: .taxBehavior)
        try container.encode(self.taxIds, forKey: .taxIds)
        try container.encode(self.taxStatus, forKey: .taxStatus)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case address
        case baseCurrency = "base_currency"
        case baseTotal = "base_total"
        case createdAt = "created_at"
        case currency
        case discount
        case exchangeRate = "exchange_rate"
        case expiresAt = "expires_at"
        case id
        case lineItems = "line_items"
        case locatedBy = "located_by"
        case paymentId = "payment_id"
        case promoCodeId = "promo_code_id"
        case recommendedCurrencies = "recommended_currencies"
        case shippingAddress = "shipping_address"
        case subtotal
        case taxAmount = "tax_amount"
        case taxBehavior = "tax_behavior"
        case taxIds = "tax_ids"
        case taxStatus = "tax_status"
        case total
    }
}