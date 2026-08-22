import Foundation

public struct RetrievePaymentsResponse: Codable, Hashable, Sendable {
    /// How much the payment is for after fees
    public let amountAfterFees: Double
    /// The application fee charged on this payment.
    public let applicationFee: Nullable<PaymentApplicationFee>
    /// Whether this payment was auto refunded or not
    public let autoRefunded: Bool
    /// The address of the user who made the payment.
    public let billingAddress: Nullable<PaymentBillingAddress>
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
    public let company: Nullable<PaymentCompany>
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
    public let disputes: Nullable<[PaymentDisputesItem]>
    /// If the payment failed, the reason for the failure.
    public let failureMessage: Nullable<String>
    /// The number of financing installments for the payment. Present if the payment is a financing payment (e.g. Splitit, Klarna, etc.).
    public let financingInstallmentsCount: Nullable<Int>
    /// The financing transactions attached to this payment. Present if the payment is a financing payment (e.g. Splitit, Klarna, etc.).
    public let financingTransactions: [PaymentFinancingTransactionsItem]
    /// The unique identifier for the payment.
    public let id: String
    /// The time of the last payment attempt.
    public let lastPaymentAttempt: Nullable<Date>
    /// The member attached to this payment.
    public let member: Nullable<PaymentMember>
    /// The membership attached to this payment.
    public let membership: Nullable<PaymentMembership>
    /// The custom metadata stored on this payment. This will be copied over to the checkout configuration for which this payment was made
    public let metadata: Nullable<[String: JSONValue]>
    /// Whether this payment is holding funds until the order ships and has no tracking number yet.
    public let needsTracking: Nullable<Bool>
    /// The time of the next schedule payment retry.
    public let nextPaymentAttempt: Nullable<Date>
    /// The time at which this payment was successfully collected. Null if the payment has not yet succeeded. As a Unix timestamp.
    public let paidAt: Nullable<Date>
    /// The instrument this payment was made with, shaped for display: the method type, a buyer-facing name, the standard icon set, and the card facts when it was a card. Null when the receipt names no payment method.
    public let paymentInstrument: Nullable<PaymentPaymentInstrument>
    /// The tokenized payment method reference used for this payment. Null if no token was used.
    public let paymentMethod: Nullable<PaymentPaymentMethod>
    /// The type of payment instrument used for this payment (e.g., card, Cash App, iDEAL, Klarna, crypto). Null when the processor does not supply a type.
    public let paymentMethodType: Nullable<PaymentMethodTypes>
    /// The number of failed payment attempts for the payment.
    public let paymentsFailed: Nullable<Int>
    /// The plan attached to this payment.
    public let plan: Nullable<PaymentPlan>
    /// The product this payment was made for
    public let product: Nullable<PaymentProduct>
    /// The promo code used for this payment.
    public let promoCode: Nullable<PaymentPromoCode>
    /// True only for payments that are `paid`, have not been fully refunded, and were processed by a payment processor that allows refunds.
    public let refundable: Bool
    /// The payment refund amount(if applicable).
    public let refundedAmount: Nullable<Double>
    /// When the payment was refunded (if applicable).
    public let refundedAt: Nullable<Date>
    /// The refunds issued against this payment, newest first, including failed and canceled refund attempts. Limited to the 100 most recent.
    public let refunds: [PaymentRefundsItem]
    /// The resolution center cases opened by the customer on this payment. Null if the actor in context does not have the payment:resolution_center_case:read permission.
    public let resolutions: Nullable<[PaymentResolutionsItem]>
    /// True when the payment status is `open` and its membership is in one of the retry-eligible states (`active`, `trialing`, `completed`, or `past_due`), or when it is a failed initial billing-engine payment on a `drafted` membership with an unlimited-stock plan; otherwise false. Used to decide if Whop can attempt the charge again.
    public let retryable: Bool
    /// Whop's in-house fraud risk score for this payment, from 0 (lowest risk) to 100 (highest risk). Null when the payment has not been scored or scoring has not yet completed.
    public let riskScore: Nullable<Int>
    /// A curated set of factors behind the risk score, grouped by category (business transaction history, buyer, device). Each entry has a key, human-readable label, category, and value. Null when there is no risk assessment for this payment.
    public let riskSignals: Nullable<[String: JSONValue]>
    /// The total amount charged to the customer for this payment, including taxes and after any discounts. In the currency specified by the currency field.
    public let settlementAmount: Double
    /// The three-letter ISO currency code for this payment (e.g., 'usd', 'eur').
    public let settlementCurrency: Currencies
    /// Deprecated. Always returns null.
    public let settlementExchangeRate: Nullable<Double>
    /// When this payment's funds post to the company's available balance, at midnight UTC. Known at payment time and never changes. The `ledger_account.funds_available` webhook carries the same `settlement_time_at` when that batch posts — match them to know these funds are now withdrawable.
    public let settlementTimeAt: Nullable<Date>
    /// The shipment attached to this payment.
    public let shipment: Nullable<PaymentShipment>
    /// The shipping address provided by the customer for physical goods. Null if no shipping address was collected.
    public let shippingAddress: Nullable<PaymentShippingAddress>
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
    public let user: Nullable<PaymentUser>
    /// The issuer's address and card security code check results for this payment. Null when the processor returned none.
    public let verificationChecks: Nullable<PaymentVerificationChecks>
    /// True when the payment is tied to a membership in `past_due`, the payment status is `open`, and the processor allows voiding payments; otherwise false.
    public let voidable: Bool
    /// The credential the buyer's surface presents to poll this payment and set its return URL. Returned when a payment created from a confirmation token is created or retrieved by a caller with the payment:charge permission. Null for payments created from a stored payment method or callers without payment:charge. It unlocks this payment and nothing else; treat it like a password for that one attempt.
    public let clientSecret: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amountAfterFees: Double,
        applicationFee: Nullable<PaymentApplicationFee>,
        autoRefunded: Bool,
        billingAddress: Nullable<PaymentBillingAddress>,
        billingReason: Nullable<BillingReasons>,
        cardBrand: Nullable<CardBrands>,
        cardExpMonth: Nullable<Int>,
        cardExpYear: Nullable<Int>,
        cardLast4: Nullable<String>,
        checkoutConfigurationId: Nullable<String>,
        company: Nullable<PaymentCompany>,
        createdAt: Date,
        currency: Currencies,
        customerPhone: Nullable<String>,
        declineCode: Nullable<PaymentDeclineCodes>,
        disputeAlertedAt: Nullable<Date>,
        disputes: Nullable<[PaymentDisputesItem]>,
        failureMessage: Nullable<String>,
        financingInstallmentsCount: Nullable<Int>,
        financingTransactions: [PaymentFinancingTransactionsItem],
        id: String,
        lastPaymentAttempt: Nullable<Date>,
        member: Nullable<PaymentMember>,
        membership: Nullable<PaymentMembership>,
        metadata: Nullable<[String: JSONValue]>,
        needsTracking: Nullable<Bool>,
        nextPaymentAttempt: Nullable<Date>,
        paidAt: Nullable<Date>,
        paymentInstrument: Nullable<PaymentPaymentInstrument>,
        paymentMethod: Nullable<PaymentPaymentMethod>,
        paymentMethodType: Nullable<PaymentMethodTypes>,
        paymentsFailed: Nullable<Int>,
        plan: Nullable<PaymentPlan>,
        product: Nullable<PaymentProduct>,
        promoCode: Nullable<PaymentPromoCode>,
        refundable: Bool,
        refundedAmount: Nullable<Double>,
        refundedAt: Nullable<Date>,
        refunds: [PaymentRefundsItem],
        resolutions: Nullable<[PaymentResolutionsItem]>,
        retryable: Bool,
        riskScore: Nullable<Int>,
        riskSignals: Nullable<[String: JSONValue]>,
        settlementAmount: Double,
        settlementCurrency: Currencies,
        settlementExchangeRate: Nullable<Double>,
        settlementTimeAt: Nullable<Date>,
        shipment: Nullable<PaymentShipment>,
        shippingAddress: Nullable<PaymentShippingAddress>,
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
        user: Nullable<PaymentUser>,
        verificationChecks: Nullable<PaymentVerificationChecks>,
        voidable: Bool,
        clientSecret: Nullable<String>,
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
        self.clientSecret = clientSecret
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountAfterFees = try container.decode(Double.self, forKey: .amountAfterFees)
        self.applicationFee = try container.decode(Nullable<PaymentApplicationFee>.self, forKey: .applicationFee)
        self.autoRefunded = try container.decode(Bool.self, forKey: .autoRefunded)
        self.billingAddress = try container.decode(Nullable<PaymentBillingAddress>.self, forKey: .billingAddress)
        self.billingReason = try container.decode(Nullable<BillingReasons>.self, forKey: .billingReason)
        self.cardBrand = try container.decode(Nullable<CardBrands>.self, forKey: .cardBrand)
        self.cardExpMonth = try container.decode(Nullable<Int>.self, forKey: .cardExpMonth)
        self.cardExpYear = try container.decode(Nullable<Int>.self, forKey: .cardExpYear)
        self.cardLast4 = try container.decode(Nullable<String>.self, forKey: .cardLast4)
        self.checkoutConfigurationId = try container.decode(Nullable<String>.self, forKey: .checkoutConfigurationId)
        self.company = try container.decode(Nullable<PaymentCompany>.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.customerPhone = try container.decode(Nullable<String>.self, forKey: .customerPhone)
        self.declineCode = try container.decode(Nullable<PaymentDeclineCodes>.self, forKey: .declineCode)
        self.disputeAlertedAt = try container.decode(Nullable<Date>.self, forKey: .disputeAlertedAt)
        self.disputes = try container.decode(Nullable<[PaymentDisputesItem]>.self, forKey: .disputes)
        self.failureMessage = try container.decode(Nullable<String>.self, forKey: .failureMessage)
        self.financingInstallmentsCount = try container.decode(Nullable<Int>.self, forKey: .financingInstallmentsCount)
        self.financingTransactions = try container.decode([PaymentFinancingTransactionsItem].self, forKey: .financingTransactions)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastPaymentAttempt = try container.decode(Nullable<Date>.self, forKey: .lastPaymentAttempt)
        self.member = try container.decode(Nullable<PaymentMember>.self, forKey: .member)
        self.membership = try container.decode(Nullable<PaymentMembership>.self, forKey: .membership)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.needsTracking = try container.decode(Nullable<Bool>.self, forKey: .needsTracking)
        self.nextPaymentAttempt = try container.decode(Nullable<Date>.self, forKey: .nextPaymentAttempt)
        self.paidAt = try container.decode(Nullable<Date>.self, forKey: .paidAt)
        self.paymentInstrument = try container.decode(Nullable<PaymentPaymentInstrument>.self, forKey: .paymentInstrument)
        self.paymentMethod = try container.decode(Nullable<PaymentPaymentMethod>.self, forKey: .paymentMethod)
        self.paymentMethodType = try container.decode(Nullable<PaymentMethodTypes>.self, forKey: .paymentMethodType)
        self.paymentsFailed = try container.decode(Nullable<Int>.self, forKey: .paymentsFailed)
        self.plan = try container.decode(Nullable<PaymentPlan>.self, forKey: .plan)
        self.product = try container.decode(Nullable<PaymentProduct>.self, forKey: .product)
        self.promoCode = try container.decode(Nullable<PaymentPromoCode>.self, forKey: .promoCode)
        self.refundable = try container.decode(Bool.self, forKey: .refundable)
        self.refundedAmount = try container.decode(Nullable<Double>.self, forKey: .refundedAmount)
        self.refundedAt = try container.decode(Nullable<Date>.self, forKey: .refundedAt)
        self.refunds = try container.decode([PaymentRefundsItem].self, forKey: .refunds)
        self.resolutions = try container.decode(Nullable<[PaymentResolutionsItem]>.self, forKey: .resolutions)
        self.retryable = try container.decode(Bool.self, forKey: .retryable)
        self.riskScore = try container.decode(Nullable<Int>.self, forKey: .riskScore)
        self.riskSignals = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .riskSignals)
        self.settlementAmount = try container.decode(Double.self, forKey: .settlementAmount)
        self.settlementCurrency = try container.decode(Currencies.self, forKey: .settlementCurrency)
        self.settlementExchangeRate = try container.decode(Nullable<Double>.self, forKey: .settlementExchangeRate)
        self.settlementTimeAt = try container.decode(Nullable<Date>.self, forKey: .settlementTimeAt)
        self.shipment = try container.decode(Nullable<PaymentShipment>.self, forKey: .shipment)
        self.shippingAddress = try container.decode(Nullable<PaymentShippingAddress>.self, forKey: .shippingAddress)
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
        self.user = try container.decode(Nullable<PaymentUser>.self, forKey: .user)
        self.verificationChecks = try container.decode(Nullable<PaymentVerificationChecks>.self, forKey: .verificationChecks)
        self.voidable = try container.decode(Bool.self, forKey: .voidable)
        self.clientSecret = try container.decode(Nullable<String>.self, forKey: .clientSecret)
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
        try container.encode(self.clientSecret, forKey: .clientSecret)
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
        case clientSecret = "client_secret"
    }
}