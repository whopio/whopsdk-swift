import Foundation

/// A payment represents a completed or attempted charge. Payments track the amount, status, currency, and payment method used.
public struct PaymentLegacy: Codable, Hashable, Sendable {
    /// How much the payment is for after fees
    public let amountAfterFees: Double
    /// The application fee charged on this payment.
    public let applicationFee: Nullable<PaymentLegacyApplicationFee>
    /// Whether this payment was auto refunded or not
    public let autoRefunded: Bool
    /// The address of the user who made the payment.
    public let billingAddress: Nullable<PaymentLegacyBillingAddress>
    /// The machine-readable reason this charge was created, such as initial subscription purchase, renewal cycle, or one-time payment.
    public let billingReason: Nullable<BillingReasons>
    /// Card network reported by the processor (e.g., 'visa', 'mastercard', 'amex'). Present only when the payment method type is 'card'.
    public let cardBrand: Nullable<CardBrands>
    /// The expiration month (1-12) of the card used for this payment. Falls back to the declined card on failed payments with no saved card. Null when the payment was not made with a card or the expiry is unavailable.
    public let cardExpMonth: Nullable<Int>
    /// The four-digit expiration year of the card used for this payment. Falls back to the declined card on failed payments with no saved card. Null when the payment was not made with a card or the expiry is unavailable.
    public let cardExpYear: Nullable<Int>
    /// The last four digits of the card used to make this payment. Null if the payment was not made with a card.
    public let cardLast4: Nullable<String>
    /// The ID of the checkout session/configuration that produced this payment, if any. Use this to map payments back to the checkout configuration that created them.
    public let checkoutConfigurationId: Nullable<String>
    /// The company for the payment.
    public let company: Nullable<PaymentLegacyCompany>
    /// The datetime the payment was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for this payment (e.g., 'usd', 'eur').
    public let currency: Currencies
    /// Phone number the customer provided at checkout, or their verified phone number when your checkout requires phone verification. `null` when no phone number was collected.
    public let customerPhone: Nullable<String>
    /// The reason the payment was declined. Null if the payment did not fail.
    public let declineCode: Nullable<PaymentDeclineCodes>
    /// When an alert came in that this transaction will be disputed
    public let disputeAlertedAt: Nullable<Date>
    /// The disputes attached to this payment. Null if the actor in context does not have the payment:dispute:read permission.
    public let disputes: Nullable<[PaymentLegacyDisputesItem]>
    /// If the payment failed, the reason for the failure.
    public let failureMessage: Nullable<String>
    /// The fees associated with this specific payment.
    public let fees: [PaymentLegacyFeesItem]
    /// The number of financing installments for the payment. Present if the payment is a financing payment (e.g. Splitit, Klarna, etc.).
    public let financingInstallmentsCount: Nullable<Int>
    /// The financing transactions attached to this payment. Present if the payment is a financing payment (e.g. Splitit, Klarna, etc.).
    public let financingTransactions: [PaymentLegacyFinancingTransactionsItem]
    /// The unique identifier for the payment.
    public let id: String
    /// The time of the last payment attempt.
    public let lastPaymentAttempt: Nullable<Date>
    /// The member attached to this payment.
    public let member: Nullable<PaymentLegacyMember>
    /// The membership attached to this payment.
    public let membership: Nullable<PaymentLegacyMembership>
    /// The custom metadata stored on this payment. This will be copied over to the checkout configuration for which this payment was made
    public let metadata: Nullable<[String: JSONValue]>
    /// Whether this payment is holding funds until the order ships and has no tracking number yet.
    public let needsTracking: Nullable<Bool>
    /// The time of the next schedule payment retry.
    public let nextPaymentAttempt: Nullable<Date>
    /// The time at which this payment was successfully collected. Null if the payment has not yet succeeded. As a Unix timestamp.
    public let paidAt: Nullable<Date>
    /// The instrument this payment was made with, shaped for display: the method type, a buyer-facing name, the standard icon set, and the card facts when it was a card. Null when the receipt names no payment method.
    public let paymentInstrument: Nullable<PaymentLegacyPaymentInstrument>
    /// The tokenized payment method reference used for this payment. Null if no token was used.
    public let paymentMethod: Nullable<PaymentLegacyPaymentMethod>
    /// The type of payment instrument used for this payment (e.g., card, Cash App, iDEAL, Klarna, crypto). Null when the processor does not supply a type.
    public let paymentMethodType: Nullable<PaymentMethodTypes>
    /// The number of failed payment attempts for the payment.
    public let paymentsFailed: Nullable<Int>
    /// The plan attached to this payment.
    public let plan: Nullable<PaymentLegacyPlan>
    /// The product this payment was made for
    public let product: Nullable<PaymentLegacyProduct>
    /// The promo code used for this payment.
    public let promoCode: Nullable<PaymentLegacyPromoCode>
    /// Whop-hosted URL where the buyer can sign in and complete 3D Secure for an off-session charge the bank challenged — a subscription renewal or a saved-card payment. `null` when recovery is unavailable or you lack `member:basic:read`.
    public let recoveryUrl: Nullable<String>
    /// True only for payments that are `paid`, have not been fully refunded, and were processed by a payment processor that allows refunds.
    public let refundable: Bool
    /// The payment refund amount(if applicable).
    public let refundedAmount: Nullable<Double>
    /// When the payment was refunded (if applicable).
    public let refundedAt: Nullable<Date>
    /// The refunds issued against this payment, newest first, including failed and canceled refund attempts. Limited to the 100 most recent.
    public let refunds: [PaymentLegacyRefundsItem]
    /// The resolution center cases opened by the customer on this payment. Null if the actor in context does not have the payment:resolution_center_case:read permission.
    public let resolutions: Nullable<[PaymentLegacyResolutionsItem]>
    /// True when the payment is `open`, its processor can be charged again, its membership is `active`, `trialing`, or `past_due` (or it is a failed initial payment on a `drafted` membership), it is not paid through an invoice link, and its one manual retry is not used up. Used to decide if the payment can be retried by hand. A retry can still be refused when the company cannot accept payments.
    public let retryable: Bool
    /// Whop's in-house fraud risk score for this payment, from 0 (lowest risk) to 100 (highest risk). Null when the payment has not been scored or scoring has not yet completed.
    public let riskScore: Nullable<Int>
    /// Deprecated. Always null.
    public let riskSignals: Nullable<[String: JSONValue]>
    /// The total amount charged to the customer for this payment, including taxes and after any discounts. In the currency specified by the currency field.
    public let settlementAmount: Double
    /// The three-letter ISO currency code for this payment (e.g., 'usd', 'eur').
    public let settlementCurrency: Currencies
    /// Deprecated. Always returns null.
    public let settlementExchangeRate: Nullable<Double>
    /// When this payment's funds post to the company's available balance, at midnight UTC. Known at payment time and never changes. The `financial_activity.funds_available` webhook's `posted_at` carries the same value when the settlement that clears it posts — match them to know these funds are now withdrawable.
    public let settlementTimeAt: Nullable<Date>
    /// The shipment attached to this payment.
    public let shipment: Nullable<PaymentLegacyShipment>
    /// The shipping address provided by the customer for physical goods. Null if no shipping address was collected.
    public let shippingAddress: Nullable<PaymentLegacyShippingAddress>
    /// The stock keeping unit of the variant this payment charged for (the first item, on a cart), as set by the seller. Accounts with billing-reason SKU suffixes enabled receive it stamped with why the charge happened: `-S` for a first subscription charge, `-R` for a renewal, `-C` for a one-time purchase, `-U` when the payment's own metadata carries `upsell: true`, `-F` when nothing was charged. Other billing reasons carry the bare SKU. Null when the variant has no SKU.
    public let sku: Nullable<String>
    /// The current lifecycle state of this payment (e.g., 'draft', 'open', 'paid', 'void').
    public let status: Nullable<ReceiptStatus>
    /// The friendly status of the payment.
    public let substatus: FriendlyReceiptStatus
    /// The subtotal to show to the creator (excluding buyer fees).
    public let subtotal: Nullable<Double>
    /// The calculated amount of the sales/VAT tax (if applicable).
    public let taxAmount: Nullable<Double>
    /// The type of tax inclusivity applied to the payment, for determining whether the tax is included in the final price, or paid on top.
    public let taxBehavior: Nullable<ReceiptTaxBehaviors>
    /// The amount of tax that has been refunded (if applicable).
    public let taxRefundedAmount: Nullable<Double>
    /// Whether 3D Secure authentication was completed for this payment.
    public let threeDsVerified: Bool
    /// The total to show to the creator (excluding buyer fees).
    public let total: Nullable<Double>
    /// The datetime the payment was last updated.
    public let updatedAt: Date
    /// The total in USD to show to the creator (excluding buyer fees).
    public let usdTotal: Nullable<Double>
    /// The user that made this payment.
    public let user: Nullable<PaymentLegacyUser>
    /// The issuer's address and card security code check results for this payment. Null when the processor returned none.
    public let verificationChecks: Nullable<PaymentLegacyVerificationChecks>
    /// True when the payment can be voided or canceled. The request is rejected if the payment is no longer eligible.
    public let voidable: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amountAfterFees: Double,
        applicationFee: Nullable<PaymentLegacyApplicationFee>,
        autoRefunded: Bool,
        billingAddress: Nullable<PaymentLegacyBillingAddress>,
        billingReason: Nullable<BillingReasons>,
        cardBrand: Nullable<CardBrands>,
        cardExpMonth: Nullable<Int>,
        cardExpYear: Nullable<Int>,
        cardLast4: Nullable<String>,
        checkoutConfigurationId: Nullable<String>,
        company: Nullable<PaymentLegacyCompany>,
        createdAt: Date,
        currency: Currencies,
        customerPhone: Nullable<String>,
        declineCode: Nullable<PaymentDeclineCodes>,
        disputeAlertedAt: Nullable<Date>,
        disputes: Nullable<[PaymentLegacyDisputesItem]>,
        failureMessage: Nullable<String>,
        fees: [PaymentLegacyFeesItem],
        financingInstallmentsCount: Nullable<Int>,
        financingTransactions: [PaymentLegacyFinancingTransactionsItem],
        id: String,
        lastPaymentAttempt: Nullable<Date>,
        member: Nullable<PaymentLegacyMember>,
        membership: Nullable<PaymentLegacyMembership>,
        metadata: Nullable<[String: JSONValue]>,
        needsTracking: Nullable<Bool>,
        nextPaymentAttempt: Nullable<Date>,
        paidAt: Nullable<Date>,
        paymentInstrument: Nullable<PaymentLegacyPaymentInstrument>,
        paymentMethod: Nullable<PaymentLegacyPaymentMethod>,
        paymentMethodType: Nullable<PaymentMethodTypes>,
        paymentsFailed: Nullable<Int>,
        plan: Nullable<PaymentLegacyPlan>,
        product: Nullable<PaymentLegacyProduct>,
        promoCode: Nullable<PaymentLegacyPromoCode>,
        recoveryUrl: Nullable<String>,
        refundable: Bool,
        refundedAmount: Nullable<Double>,
        refundedAt: Nullable<Date>,
        refunds: [PaymentLegacyRefundsItem],
        resolutions: Nullable<[PaymentLegacyResolutionsItem]>,
        retryable: Bool,
        riskScore: Nullable<Int>,
        riskSignals: Nullable<[String: JSONValue]>,
        settlementAmount: Double,
        settlementCurrency: Currencies,
        settlementExchangeRate: Nullable<Double>,
        settlementTimeAt: Nullable<Date>,
        shipment: Nullable<PaymentLegacyShipment>,
        shippingAddress: Nullable<PaymentLegacyShippingAddress>,
        sku: Nullable<String>,
        status: Nullable<ReceiptStatus>,
        substatus: FriendlyReceiptStatus,
        subtotal: Nullable<Double>,
        taxAmount: Nullable<Double>,
        taxBehavior: Nullable<ReceiptTaxBehaviors>,
        taxRefundedAmount: Nullable<Double>,
        threeDsVerified: Bool,
        total: Nullable<Double>,
        updatedAt: Date,
        usdTotal: Nullable<Double>,
        user: Nullable<PaymentLegacyUser>,
        verificationChecks: Nullable<PaymentLegacyVerificationChecks>,
        voidable: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amountAfterFees = amountAfterFees
        self.applicationFee = applicationFee
        self.autoRefunded = autoRefunded
        self.billingAddress = billingAddress
        self.billingReason = billingReason
        self.cardBrand = cardBrand
        self.cardExpMonth = cardExpMonth
        self.cardExpYear = cardExpYear
        self.cardLast4 = cardLast4
        self.checkoutConfigurationId = checkoutConfigurationId
        self.company = company
        self.createdAt = createdAt
        self.currency = currency
        self.customerPhone = customerPhone
        self.declineCode = declineCode
        self.disputeAlertedAt = disputeAlertedAt
        self.disputes = disputes
        self.failureMessage = failureMessage
        self.fees = fees
        self.financingInstallmentsCount = financingInstallmentsCount
        self.financingTransactions = financingTransactions
        self.id = id
        self.lastPaymentAttempt = lastPaymentAttempt
        self.member = member
        self.membership = membership
        self.metadata = metadata
        self.needsTracking = needsTracking
        self.nextPaymentAttempt = nextPaymentAttempt
        self.paidAt = paidAt
        self.paymentInstrument = paymentInstrument
        self.paymentMethod = paymentMethod
        self.paymentMethodType = paymentMethodType
        self.paymentsFailed = paymentsFailed
        self.plan = plan
        self.product = product
        self.promoCode = promoCode
        self.recoveryUrl = recoveryUrl
        self.refundable = refundable
        self.refundedAmount = refundedAmount
        self.refundedAt = refundedAt
        self.refunds = refunds
        self.resolutions = resolutions
        self.retryable = retryable
        self.riskScore = riskScore
        self.riskSignals = riskSignals
        self.settlementAmount = settlementAmount
        self.settlementCurrency = settlementCurrency
        self.settlementExchangeRate = settlementExchangeRate
        self.settlementTimeAt = settlementTimeAt
        self.shipment = shipment
        self.shippingAddress = shippingAddress
        self.sku = sku
        self.status = status
        self.substatus = substatus
        self.subtotal = subtotal
        self.taxAmount = taxAmount
        self.taxBehavior = taxBehavior
        self.taxRefundedAmount = taxRefundedAmount
        self.threeDsVerified = threeDsVerified
        self.total = total
        self.updatedAt = updatedAt
        self.usdTotal = usdTotal
        self.user = user
        self.verificationChecks = verificationChecks
        self.voidable = voidable
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountAfterFees = try container.decode(Double.self, forKey: .amountAfterFees)
        self.applicationFee = try container.decode(Nullable<PaymentLegacyApplicationFee>.self, forKey: .applicationFee)
        self.autoRefunded = try container.decode(Bool.self, forKey: .autoRefunded)
        self.billingAddress = try container.decode(Nullable<PaymentLegacyBillingAddress>.self, forKey: .billingAddress)
        self.billingReason = try container.decode(Nullable<BillingReasons>.self, forKey: .billingReason)
        self.cardBrand = try container.decode(Nullable<CardBrands>.self, forKey: .cardBrand)
        self.cardExpMonth = try container.decode(Nullable<Int>.self, forKey: .cardExpMonth)
        self.cardExpYear = try container.decode(Nullable<Int>.self, forKey: .cardExpYear)
        self.cardLast4 = try container.decode(Nullable<String>.self, forKey: .cardLast4)
        self.checkoutConfigurationId = try container.decode(Nullable<String>.self, forKey: .checkoutConfigurationId)
        self.company = try container.decode(Nullable<PaymentLegacyCompany>.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.customerPhone = try container.decode(Nullable<String>.self, forKey: .customerPhone)
        self.declineCode = try container.decode(Nullable<PaymentDeclineCodes>.self, forKey: .declineCode)
        self.disputeAlertedAt = try container.decode(Nullable<Date>.self, forKey: .disputeAlertedAt)
        self.disputes = try container.decode(Nullable<[PaymentLegacyDisputesItem]>.self, forKey: .disputes)
        self.failureMessage = try container.decode(Nullable<String>.self, forKey: .failureMessage)
        self.fees = try container.decode([PaymentLegacyFeesItem].self, forKey: .fees)
        self.financingInstallmentsCount = try container.decode(Nullable<Int>.self, forKey: .financingInstallmentsCount)
        self.financingTransactions = try container.decode([PaymentLegacyFinancingTransactionsItem].self, forKey: .financingTransactions)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastPaymentAttempt = try container.decode(Nullable<Date>.self, forKey: .lastPaymentAttempt)
        self.member = try container.decode(Nullable<PaymentLegacyMember>.self, forKey: .member)
        self.membership = try container.decode(Nullable<PaymentLegacyMembership>.self, forKey: .membership)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.needsTracking = try container.decode(Nullable<Bool>.self, forKey: .needsTracking)
        self.nextPaymentAttempt = try container.decode(Nullable<Date>.self, forKey: .nextPaymentAttempt)
        self.paidAt = try container.decode(Nullable<Date>.self, forKey: .paidAt)
        self.paymentInstrument = try container.decode(Nullable<PaymentLegacyPaymentInstrument>.self, forKey: .paymentInstrument)
        self.paymentMethod = try container.decode(Nullable<PaymentLegacyPaymentMethod>.self, forKey: .paymentMethod)
        self.paymentMethodType = try container.decode(Nullable<PaymentMethodTypes>.self, forKey: .paymentMethodType)
        self.paymentsFailed = try container.decode(Nullable<Int>.self, forKey: .paymentsFailed)
        self.plan = try container.decode(Nullable<PaymentLegacyPlan>.self, forKey: .plan)
        self.product = try container.decode(Nullable<PaymentLegacyProduct>.self, forKey: .product)
        self.promoCode = try container.decode(Nullable<PaymentLegacyPromoCode>.self, forKey: .promoCode)
        self.recoveryUrl = try container.decode(Nullable<String>.self, forKey: .recoveryUrl)
        self.refundable = try container.decode(Bool.self, forKey: .refundable)
        self.refundedAmount = try container.decode(Nullable<Double>.self, forKey: .refundedAmount)
        self.refundedAt = try container.decode(Nullable<Date>.self, forKey: .refundedAt)
        self.refunds = try container.decode([PaymentLegacyRefundsItem].self, forKey: .refunds)
        self.resolutions = try container.decode(Nullable<[PaymentLegacyResolutionsItem]>.self, forKey: .resolutions)
        self.retryable = try container.decode(Bool.self, forKey: .retryable)
        self.riskScore = try container.decode(Nullable<Int>.self, forKey: .riskScore)
        self.riskSignals = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .riskSignals)
        self.settlementAmount = try container.decode(Double.self, forKey: .settlementAmount)
        self.settlementCurrency = try container.decode(Currencies.self, forKey: .settlementCurrency)
        self.settlementExchangeRate = try container.decode(Nullable<Double>.self, forKey: .settlementExchangeRate)
        self.settlementTimeAt = try container.decode(Nullable<Date>.self, forKey: .settlementTimeAt)
        self.shipment = try container.decode(Nullable<PaymentLegacyShipment>.self, forKey: .shipment)
        self.shippingAddress = try container.decode(Nullable<PaymentLegacyShippingAddress>.self, forKey: .shippingAddress)
        self.sku = try container.decode(Nullable<String>.self, forKey: .sku)
        self.status = try container.decode(Nullable<ReceiptStatus>.self, forKey: .status)
        self.substatus = try container.decode(FriendlyReceiptStatus.self, forKey: .substatus)
        self.subtotal = try container.decode(Nullable<Double>.self, forKey: .subtotal)
        self.taxAmount = try container.decode(Nullable<Double>.self, forKey: .taxAmount)
        self.taxBehavior = try container.decode(Nullable<ReceiptTaxBehaviors>.self, forKey: .taxBehavior)
        self.taxRefundedAmount = try container.decode(Nullable<Double>.self, forKey: .taxRefundedAmount)
        self.threeDsVerified = try container.decode(Bool.self, forKey: .threeDsVerified)
        self.total = try container.decode(Nullable<Double>.self, forKey: .total)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.usdTotal = try container.decode(Nullable<Double>.self, forKey: .usdTotal)
        self.user = try container.decode(Nullable<PaymentLegacyUser>.self, forKey: .user)
        self.verificationChecks = try container.decode(Nullable<PaymentLegacyVerificationChecks>.self, forKey: .verificationChecks)
        self.voidable = try container.decode(Bool.self, forKey: .voidable)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amountAfterFees, forKey: .amountAfterFees)
        try container.encode(self.applicationFee, forKey: .applicationFee)
        try container.encode(self.autoRefunded, forKey: .autoRefunded)
        try container.encode(self.billingAddress, forKey: .billingAddress)
        try container.encode(self.billingReason, forKey: .billingReason)
        try container.encode(self.cardBrand, forKey: .cardBrand)
        try container.encode(self.cardExpMonth, forKey: .cardExpMonth)
        try container.encode(self.cardExpYear, forKey: .cardExpYear)
        try container.encode(self.cardLast4, forKey: .cardLast4)
        try container.encode(self.checkoutConfigurationId, forKey: .checkoutConfigurationId)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.customerPhone, forKey: .customerPhone)
        try container.encode(self.declineCode, forKey: .declineCode)
        try container.encode(self.disputeAlertedAt, forKey: .disputeAlertedAt)
        try container.encode(self.disputes, forKey: .disputes)
        try container.encode(self.failureMessage, forKey: .failureMessage)
        try container.encode(self.fees, forKey: .fees)
        try container.encode(self.financingInstallmentsCount, forKey: .financingInstallmentsCount)
        try container.encode(self.financingTransactions, forKey: .financingTransactions)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastPaymentAttempt, forKey: .lastPaymentAttempt)
        try container.encode(self.member, forKey: .member)
        try container.encode(self.membership, forKey: .membership)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.needsTracking, forKey: .needsTracking)
        try container.encode(self.nextPaymentAttempt, forKey: .nextPaymentAttempt)
        try container.encode(self.paidAt, forKey: .paidAt)
        try container.encode(self.paymentInstrument, forKey: .paymentInstrument)
        try container.encode(self.paymentMethod, forKey: .paymentMethod)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.paymentsFailed, forKey: .paymentsFailed)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.promoCode, forKey: .promoCode)
        try container.encode(self.recoveryUrl, forKey: .recoveryUrl)
        try container.encode(self.refundable, forKey: .refundable)
        try container.encode(self.refundedAmount, forKey: .refundedAmount)
        try container.encode(self.refundedAt, forKey: .refundedAt)
        try container.encode(self.refunds, forKey: .refunds)
        try container.encode(self.resolutions, forKey: .resolutions)
        try container.encode(self.retryable, forKey: .retryable)
        try container.encode(self.riskScore, forKey: .riskScore)
        try container.encode(self.riskSignals, forKey: .riskSignals)
        try container.encode(self.settlementAmount, forKey: .settlementAmount)
        try container.encode(self.settlementCurrency, forKey: .settlementCurrency)
        try container.encode(self.settlementExchangeRate, forKey: .settlementExchangeRate)
        try container.encode(self.settlementTimeAt, forKey: .settlementTimeAt)
        try container.encode(self.shipment, forKey: .shipment)
        try container.encode(self.shippingAddress, forKey: .shippingAddress)
        try container.encode(self.sku, forKey: .sku)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.substatus, forKey: .substatus)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.taxAmount, forKey: .taxAmount)
        try container.encode(self.taxBehavior, forKey: .taxBehavior)
        try container.encode(self.taxRefundedAmount, forKey: .taxRefundedAmount)
        try container.encode(self.threeDsVerified, forKey: .threeDsVerified)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.usdTotal, forKey: .usdTotal)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.verificationChecks, forKey: .verificationChecks)
        try container.encode(self.voidable, forKey: .voidable)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amountAfterFees = "amount_after_fees"
        case applicationFee = "application_fee"
        case autoRefunded = "auto_refunded"
        case billingAddress = "billing_address"
        case billingReason = "billing_reason"
        case cardBrand = "card_brand"
        case cardExpMonth = "card_exp_month"
        case cardExpYear = "card_exp_year"
        case cardLast4 = "card_last4"
        case checkoutConfigurationId = "checkout_configuration_id"
        case company
        case createdAt = "created_at"
        case currency
        case customerPhone = "customer_phone"
        case declineCode = "decline_code"
        case disputeAlertedAt = "dispute_alerted_at"
        case disputes
        case failureMessage = "failure_message"
        case fees
        case financingInstallmentsCount = "financing_installments_count"
        case financingTransactions = "financing_transactions"
        case id
        case lastPaymentAttempt = "last_payment_attempt"
        case member
        case membership
        case metadata
        case needsTracking = "needs_tracking"
        case nextPaymentAttempt = "next_payment_attempt"
        case paidAt = "paid_at"
        case paymentInstrument = "payment_instrument"
        case paymentMethod = "payment_method"
        case paymentMethodType = "payment_method_type"
        case paymentsFailed = "payments_failed"
        case plan
        case product
        case promoCode = "promo_code"
        case recoveryUrl = "recovery_url"
        case refundable
        case refundedAmount = "refunded_amount"
        case refundedAt = "refunded_at"
        case refunds
        case resolutions
        case retryable
        case riskScore = "risk_score"
        case riskSignals = "risk_signals"
        case settlementAmount = "settlement_amount"
        case settlementCurrency = "settlement_currency"
        case settlementExchangeRate = "settlement_exchange_rate"
        case settlementTimeAt = "settlement_time_at"
        case shipment
        case shippingAddress = "shipping_address"
        case sku
        case status
        case substatus
        case subtotal
        case taxAmount = "tax_amount"
        case taxBehavior = "tax_behavior"
        case taxRefundedAmount = "tax_refunded_amount"
        case threeDsVerified = "three_ds_verified"
        case total
        case updatedAt = "updated_at"
        case usdTotal = "usd_total"
        case user
        case verificationChecks = "verification_checks"
        case voidable
    }
}