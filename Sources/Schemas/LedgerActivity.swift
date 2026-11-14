import Foundation

public struct LedgerActivity: Codable, Hashable, Sendable {
    /// The viewer account that owns this row's ledger. Present only when the response aggregates owned accounts (include_owned_accounts=true); omitted otherwise.
    public let account: LedgerActivityAccount?
    /// Signed amount in the currency's smallest precision units.
    public let amount: String
    /// ISO 8601 timestamp when this activity affects available funds: 00:00:00 UTC on the scheduled release date for credits and debits in a pending good-funds release bucket; the posted time for credits and debits to settled available funds, including refunds, disputes and payouts. Null for activity outside these paths, including on-chain rows. The available_after/before filters use its UTC date; default activity excludes some movements, including opt-in reserves.
    public let availableAt: Nullable<Date>
    /// Currency for this ledger activity.
    public let currency: LedgerActivityCurrency
    /// Ledger activity ID.
    public let id: String
    /// The ledger account (a ldgr_ identifier) this row belongs to. Present only when the response aggregates owned accounts (include_owned_accounts=true); omitted otherwise. Pair it with `account` to scope drawers and dashboard links to the owning business.
    public let ledgerAccountId: Nullable<String>?
    /// The ledger line category this activity was posted under.
    public let lineType: LedgerActivityLineType
    public let object: LedgerActivityObject
    /// Payment related to this ledger activity. Included when rich resource hydration is enabled and the movement is tied to a payment.
    public let payment: Nullable<LedgerActivityPayment>?
    /// Payment ID for any payment-related activity, including refunds and disputes.
    public let paymentId: Nullable<String>?
    /// ID of the variant associated with the payment, when applicable.
    public let planId: Nullable<String>?
    /// Name of the variant associated with the payment, when applicable.
    public let planName: Nullable<String>?
    /// When the activity posted to the ledger.
    public let postedAt: Date
    /// ID of the product associated with the payment, when applicable.
    public let productId: Nullable<String>?
    /// Name of the product associated with the payment, when applicable.
    public let productName: Nullable<String>?
    /// Resource associated with this ledger activity.
    public let resource: Nullable<LedgerActivityResource>
    /// Source of this ledger activity. Platform markup fees use object platform_fee and the ledger activity ID.
    public let source: Nullable<LedgerActivitySource>
    /// Dollar value of this movement as a decimal string, signed like `amount`. Converted from the posted amount at the rate that was live when the line posted — the same pricing the wallet balance chart and the financial reports use — so a crypto row carries its dollar value too. `null` for a currency Whop holds no exchange rate for.
    public let usdAmount: Nullable<String>
    /// Email of the customer associated with the payment. Requires member:email:read.
    public let userEmail: Nullable<String>?
    /// ID of the customer associated with the payment.
    public let userId: Nullable<String>?
    /// Display name of the customer associated with the payment.
    public let userName: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: LedgerActivityAccount? = nil,
        amount: String,
        availableAt: Nullable<Date>,
        currency: LedgerActivityCurrency,
        id: String,
        ledgerAccountId: Nullable<String>? = nil,
        lineType: LedgerActivityLineType,
        object: LedgerActivityObject,
        payment: Nullable<LedgerActivityPayment>? = nil,
        paymentId: Nullable<String>? = nil,
        planId: Nullable<String>? = nil,
        planName: Nullable<String>? = nil,
        postedAt: Date,
        productId: Nullable<String>? = nil,
        productName: Nullable<String>? = nil,
        resource: Nullable<LedgerActivityResource>,
        source: Nullable<LedgerActivitySource>,
        usdAmount: Nullable<String>,
        userEmail: Nullable<String>? = nil,
        userId: Nullable<String>? = nil,
        userName: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.amount = amount
        self.availableAt = availableAt
        self.currency = currency
        self.id = id
        self.ledgerAccountId = ledgerAccountId
        self.lineType = lineType
        self.object = object
        self.payment = payment
        self.paymentId = paymentId
        self.planId = planId
        self.planName = planName
        self.postedAt = postedAt
        self.productId = productId
        self.productName = productName
        self.resource = resource
        self.source = source
        self.usdAmount = usdAmount
        self.userEmail = userEmail
        self.userId = userId
        self.userName = userName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decodeIfPresent(LedgerActivityAccount.self, forKey: .account)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.availableAt = try container.decode(Nullable<Date>.self, forKey: .availableAt)
        self.currency = try container.decode(LedgerActivityCurrency.self, forKey: .currency)
        self.id = try container.decode(String.self, forKey: .id)
        self.ledgerAccountId = try container.decodeNullableIfPresent(String.self, forKey: .ledgerAccountId)
        self.lineType = try container.decode(LedgerActivityLineType.self, forKey: .lineType)
        self.object = try container.decode(LedgerActivityObject.self, forKey: .object)
        self.payment = try container.decodeNullableIfPresent(LedgerActivityPayment.self, forKey: .payment)
        self.paymentId = try container.decodeNullableIfPresent(String.self, forKey: .paymentId)
        self.planId = try container.decodeNullableIfPresent(String.self, forKey: .planId)
        self.planName = try container.decodeNullableIfPresent(String.self, forKey: .planName)
        self.postedAt = try container.decode(Date.self, forKey: .postedAt)
        self.productId = try container.decodeNullableIfPresent(String.self, forKey: .productId)
        self.productName = try container.decodeNullableIfPresent(String.self, forKey: .productName)
        self.resource = try container.decode(Nullable<LedgerActivityResource>.self, forKey: .resource)
        self.source = try container.decode(Nullable<LedgerActivitySource>.self, forKey: .source)
        self.usdAmount = try container.decode(Nullable<String>.self, forKey: .usdAmount)
        self.userEmail = try container.decodeNullableIfPresent(String.self, forKey: .userEmail)
        self.userId = try container.decodeNullableIfPresent(String.self, forKey: .userId)
        self.userName = try container.decodeNullableIfPresent(String.self, forKey: .userName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.account, forKey: .account)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.availableAt, forKey: .availableAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.ledgerAccountId, forKey: .ledgerAccountId)
        try container.encode(self.lineType, forKey: .lineType)
        try container.encode(self.object, forKey: .object)
        try container.encodeNullableIfPresent(self.payment, forKey: .payment)
        try container.encodeNullableIfPresent(self.paymentId, forKey: .paymentId)
        try container.encodeNullableIfPresent(self.planId, forKey: .planId)
        try container.encodeNullableIfPresent(self.planName, forKey: .planName)
        try container.encode(self.postedAt, forKey: .postedAt)
        try container.encodeNullableIfPresent(self.productId, forKey: .productId)
        try container.encodeNullableIfPresent(self.productName, forKey: .productName)
        try container.encode(self.resource, forKey: .resource)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.usdAmount, forKey: .usdAmount)
        try container.encodeNullableIfPresent(self.userEmail, forKey: .userEmail)
        try container.encodeNullableIfPresent(self.userId, forKey: .userId)
        try container.encodeNullableIfPresent(self.userName, forKey: .userName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case amount
        case availableAt = "available_at"
        case currency
        case id
        case ledgerAccountId = "ledger_account_id"
        case lineType = "line_type"
        case object
        case payment
        case paymentId = "payment_id"
        case planId = "plan_id"
        case planName = "plan_name"
        case postedAt = "posted_at"
        case productId = "product_id"
        case productName = "product_name"
        case resource
        case source
        case usdAmount = "usd_amount"
        case userEmail = "user_email"
        case userId = "user_id"
        case userName = "user_name"
    }
}