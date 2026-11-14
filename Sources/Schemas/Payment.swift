import Foundation

public struct Payment: Codable, Hashable, Sendable {
    /// The account that received the payment, prefixed `biz_`.
    public let accountId: Nullable<String>
    /// What the account keeps: the total less Whop's fees.
    public let amountAfterFees: Money
    /// When Whop will capture this authorized card payment automatically unless it is voided first, as an ISO 8601 timestamp. Null when no automatic capture was requested.
    public let autoCaptureAt: Nullable<String>
    /// True when Whop refunded the payment automatically, for example on a dispute alert.
    public let autoRefunded: Bool
    /// The billing address the buyer entered, or null.
    public let billingAddress: Nullable<PaymentAddress>
    /// Why the charge was created: a first purchase, a renewal, a one-time payment, or a manual charge.
    public let billingReason: Nullable<BillingReasons>
    /// When the hold on this authorized card payment expires if it is not captured first, as an ISO 8601 timestamp. Null when the payment was not created for later capture.
    public let captureExpiresAt: Nullable<String>
    /// The checkout configuration the buyer paid through, prefixed `ch_`, or null.
    public let checkoutConfigurationId: Nullable<String>
    /// The scheme and host of the website where the buyer opened the checkout, such as `https://store.example.com`. Use it to tell apart payments from different websites on one account. Null when the website was not recorded, including for payments made without the buyer present.
    public let checkoutOrigin: Nullable<String>
    /// The checkout experience that produced this payment, such as `embedded_checkout` for a checkout on the account's own website or `off_session` for a subscription renewal. Null when the checkout was not recorded.
    public let checkoutSurface: Nullable<PaymentCheckoutSurface>
    /// The credential a buyer's surface presents to poll this payment, set its return URL and resume it when the bank asked the customer to authenticate. Only on payments created from a confirmation token or waiting on that authentication, and always null in list responses — retrieve the payment for it.
    public let clientSecret: Nullable<String>
    /// When the payment was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The currency the payment settles in, lowercase ISO 4217. Every money field below is stated in it unless it says otherwise.
    public let currency: Currencies
    /// The buyer's email address. Null without `member:email:read` on the account or when the buyer has no assigned email.
    public let customerEmail: Nullable<String>
    /// The phone number the buyer gave at checkout, when one was collected.
    public let customerPhone: Nullable<String>
    /// The normalized decline reason of the most recent failed attempt, or null.
    public let declineCode: Nullable<PaymentDeclineCodes>
    /// When an issuer warned that this payment will be disputed, or null.
    public let disputeAlertedAt: Nullable<String>
    /// When the most recent dispute on this payment was opened, as an ISO 8601 timestamp. Null when the payment was never disputed, or without the payment:dispute:read permission.
    public let disputeCreatedAt: Nullable<String>
    /// Why the most recent attempt failed, in plain words, or null.
    public let failureMessage: Nullable<String>
    /// For installment methods, how many payments the charge splits into.
    public let financingInstallmentsCount: Nullable<Double>
    public let holds: [PaymentHold]
    /// Payment ID, prefixed `pay_`.
    public let id: String
    /// The buyer's IP address at checkout: the one Whop's fraud screening identified, otherwise the one Whop captured from the buyer's browser at checkout. Null when the buyer was not present at checkout, such as a subscription renewal or a charge made without the buyer present.
    public let ipAddress: Nullable<String>
    /// When the most recent charge attempt ran, or null.
    public let lastPaymentAttemptAt: Nullable<String>
    public let lineItems: [ReceiptLineItem]
    /// The buyer's member record on the account, prefixed `mber_`. Null without the member:basic:read permission.
    public let memberId: Nullable<String>
    /// The membership this payment is billed against, prefixed `mem_`. Null for one-off purchases or without the member:basic:read permission.
    public let membershipId: Nullable<String>
    /// Your own key-value data attached when the payment was created.
    public let metadata: Nullable<[String: JSONValue]>
    /// True for a paid payment with a shipping address, no shipment, and no full refund. Null without the shipment:basic:read permission.
    public let missingTracking: Nullable<Bool>
    /// True when funds are held until the order ships and no tracking number has been added yet. Null without the shipment:basic:read permission.
    public let needsTracking: Nullable<Bool>
    /// When the next automatic retry is scheduled, or null.
    public let nextPaymentAttemptAt: Nullable<String>
    /// When the money was collected, or null while it has not been.
    public let paidAt: Nullable<String>
    /// The instrument shaped for display: a buyer-facing name, the standard icon set, and when it was a card, the card's brand, last four, issuer identification number, and the network transaction id the account uses for the card.
    public let paymentInstrument: Nullable<PaymentInstrument>
    /// The stored payment method that was charged, prefixed `payt_`. Null when the method was not saved.
    public let paymentMethodId: Nullable<String>
    /// The kind of instrument used, for example `card`, `apple_pay`, `klarna`, or `us_bank_account`.
    public let paymentMethodType: Nullable<PaymentMethodTypes>
    public let paymentRuleMatches: [PaymentRuleMatch]
    /// How many charge attempts have failed on this payment.
    public let paymentsFailed: Double
    /// How much has been refunded so far, in the currency presented to the buyer. Zero when nothing has been refunded.
    public let presentmentRefundedAmount: Nullable<Money>
    /// The sales tax or VAT collected, in the currency presented to the buyer. Null when no tax applied.
    public let presentmentTaxAmount: Nullable<Money>
    /// The account-facing total in the currency presented to the buyer, before conversion into the settlement currency. Excludes buyer fees.
    public let presentmentTotal: Nullable<Money>
    /// The product the variant belongs to, prefixed `prod_`. Null for a variant with no product.
    public let productId: Nullable<String>
    /// The promo code applied at checkout, prefixed `promo_`, or null.
    public let promoCodeId: Nullable<String>
    /// The payment quote this payment charged, prefixed `pq_`: its purchase, promo code and `tax_amount` are the quote's. Null when the payment named no quote and tax was calculated at charge time.
    public let quoteId: Nullable<String>
    /// Whop-hosted URL where the buyer can sign in and complete 3D Secure for an off-session charge the bank challenged — a subscription renewal or a saved-card payment. Null when recovery is unavailable, you lack `member:basic:read`, or in list responses. Retrieve the payment for it.
    public let recoveryUrl: Nullable<String>
    /// True when the payment is `paid`, not yet fully refunded, and its processor supports refunds.
    public let refundable: Bool
    /// How much has been refunded so far, as it settled — refunds convert at the rate in force when each one was issued, not the payment's original rate.
    public let refundedAmount: Nullable<Money>
    /// When the payment was refunded, or null.
    public let refundedAt: Nullable<String>
    /// When the earliest response is due on a dispute or Resolution Center case awaiting the account's response, as an ISO 8601 timestamp. Null when nothing awaits a response, or without the permission to read that dispute or case.
    public let responseDueAt: Nullable<String>
    /// True when the payment is `open` and can be retried by hand with `POST /payments/{id}/retry`: its membership is `active`, `trialing`, or `past_due` (or it is a failed first payment on a `drafted` membership), it is not paid through an invoice payment link, and its one manual retry is not used up. A retry can still be refused when the company cannot currently accept payments.
    public let retryable: Bool
    /// Whop's published risk index from 0 (lowest) to 100 (highest), including enforced decision floors. This is not a fraud probability. Null when no score is available.
    public let riskScore: Nullable<Double>
    /// Deprecated. Risk score explanations are no longer provided; always null.
    /// DEPRECATED: Risk score explanations are no longer provided. Always null.
    public let riskSignals: Nullable<[String: JSONValue]>
    /// When the portion not listed in `holds` posts to the account's available balance, at midnight UTC. The `financial_activity.funds_available` webhook's `posted_at` carries the same value when the settlement that clears it posts. Null until the payment is paid, and always null in list responses — retrieve the payment for it.
    public let settlementTimeAt: Nullable<String>
    /// The shipment fulfilling this payment, prefixed `ship_`. Null when nothing ships or without the shipment:basic:read permission.
    public let shipmentId: Nullable<String>
    /// The shipping address for physical goods, or null.
    public let shippingAddress: Nullable<PaymentAddress>
    /// The lifecycle state of the charge: `open` while collection is outstanding, `paid` once the money moved, `pending` while a settlement rail clears, `void`/`uncollectible` when it ended without collecting.
    public let status: ReceiptStatus
    /// The dashboard's finer-grained reading of the payment, folding in refunds, disputes and Resolution Center cases.
    public let substatus: FriendlyReceiptStatus
    /// The price before discounts, tax and fees.
    public let subtotal: Nullable<Money>
    /// The sales tax or VAT collected. Null when no tax applied.
    public let taxAmount: Nullable<Money>
    /// Whether `tax_amount` was added on top of the price (`exclusive`) or was already inside it (`inclusive`).
    public let taxBehavior: Nullable<ReceiptTaxBehaviors>
    /// How much of the collected tax has been returned to the buyer so far. Zero when the payment carried no tax, or when nothing has been refunded.
    public let taxRefundedAmount: Money
    /// True when the buyer completed 3D Secure for this payment.
    public let threeDsVerified: Bool
    /// The account-facing total: the price after discounts, plus any tax added on top. Excludes buyer fees, which the buyer pays above this amount — so this is not necessarily what the buyer's statement shows.
    public let total: Nullable<Money>
    /// When the payment last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The total converted to USD at the time of the charge, for reporting across currencies. Excludes the adaptive pricing FX markup, which the account does not keep.
    public let usdTotal: Nullable<Money>
    /// The buyer. Null when the payment belongs to a company buyer rather than a user.
    public let user: Nullable<UserSummary>
    /// The buyer's browser user agent at checkout. Null when the buyer was not present at checkout, such as a subscription renewal, or without the member:basic:read permission.
    public let userAgent: Nullable<String>
    /// The variant that was charged, prefixed `plan_`.
    public let variantId: Nullable<String>
    /// The Address Verification Service (AVS), cardholder name, and Card Verification Value (CVV/CVC) results, or null when the processor returned none.
    public let verificationChecks: Nullable<PaymentVerificationChecks>
    /// True when the payment can be voided or canceled. The request is rejected if the payment is no longer eligible — see `POST /payments/{id}/void`.
    public let voidable: Bool
    /// The Whop pixel's visitor ID for the buyer's browser at checkout, prefixed `wuid_`. Null when the checkout page had no Whop pixel, when the buyer was not present at checkout, or without the member:basic:read permission.
    public let wuid: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        amountAfterFees: Money,
        autoCaptureAt: Nullable<String>,
        autoRefunded: Bool,
        billingAddress: Nullable<PaymentAddress>,
        billingReason: Nullable<BillingReasons>,
        captureExpiresAt: Nullable<String>,
        checkoutConfigurationId: Nullable<String>,
        checkoutOrigin: Nullable<String>,
        checkoutSurface: Nullable<PaymentCheckoutSurface>,
        clientSecret: Nullable<String>,
        createdAt: String,
        currency: Currencies,
        customerEmail: Nullable<String>,
        customerPhone: Nullable<String>,
        declineCode: Nullable<PaymentDeclineCodes>,
        disputeAlertedAt: Nullable<String>,
        disputeCreatedAt: Nullable<String>,
        failureMessage: Nullable<String>,
        financingInstallmentsCount: Nullable<Double>,
        holds: [PaymentHold],
        id: String,
        ipAddress: Nullable<String>,
        lastPaymentAttemptAt: Nullable<String>,
        lineItems: [ReceiptLineItem],
        memberId: Nullable<String>,
        membershipId: Nullable<String>,
        metadata: Nullable<[String: JSONValue]>,
        missingTracking: Nullable<Bool>,
        needsTracking: Nullable<Bool>,
        nextPaymentAttemptAt: Nullable<String>,
        paidAt: Nullable<String>,
        paymentInstrument: Nullable<PaymentInstrument>,
        paymentMethodId: Nullable<String>,
        paymentMethodType: Nullable<PaymentMethodTypes>,
        paymentRuleMatches: [PaymentRuleMatch],
        paymentsFailed: Double,
        presentmentRefundedAmount: Nullable<Money>,
        presentmentTaxAmount: Nullable<Money>,
        presentmentTotal: Nullable<Money>,
        productId: Nullable<String>,
        promoCodeId: Nullable<String>,
        quoteId: Nullable<String>,
        recoveryUrl: Nullable<String>,
        refundable: Bool,
        refundedAmount: Nullable<Money>,
        refundedAt: Nullable<String>,
        responseDueAt: Nullable<String>,
        retryable: Bool,
        riskScore: Nullable<Double>,
        riskSignals: Nullable<[String: JSONValue]>,
        settlementTimeAt: Nullable<String>,
        shipmentId: Nullable<String>,
        shippingAddress: Nullable<PaymentAddress>,
        status: ReceiptStatus,
        substatus: FriendlyReceiptStatus,
        subtotal: Nullable<Money>,
        taxAmount: Nullable<Money>,
        taxBehavior: Nullable<ReceiptTaxBehaviors>,
        taxRefundedAmount: Money,
        threeDsVerified: Bool,
        total: Nullable<Money>,
        updatedAt: String,
        usdTotal: Nullable<Money>,
        user: Nullable<UserSummary>,
        userAgent: Nullable<String>,
        variantId: Nullable<String>,
        verificationChecks: Nullable<PaymentVerificationChecks>,
        voidable: Bool,
        wuid: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.amountAfterFees = amountAfterFees
        self.autoCaptureAt = autoCaptureAt
        self.autoRefunded = autoRefunded
        self.billingAddress = billingAddress
        self.billingReason = billingReason
        self.captureExpiresAt = captureExpiresAt
        self.checkoutConfigurationId = checkoutConfigurationId
        self.checkoutOrigin = checkoutOrigin
        self.checkoutSurface = checkoutSurface
        self.clientSecret = clientSecret
        self.createdAt = createdAt
        self.currency = currency
        self.customerEmail = customerEmail
        self.customerPhone = customerPhone
        self.declineCode = declineCode
        self.disputeAlertedAt = disputeAlertedAt
        self.disputeCreatedAt = disputeCreatedAt
        self.failureMessage = failureMessage
        self.financingInstallmentsCount = financingInstallmentsCount
        self.holds = holds
        self.id = id
        self.ipAddress = ipAddress
        self.lastPaymentAttemptAt = lastPaymentAttemptAt
        self.lineItems = lineItems
        self.memberId = memberId
        self.membershipId = membershipId
        self.metadata = metadata
        self.missingTracking = missingTracking
        self.needsTracking = needsTracking
        self.nextPaymentAttemptAt = nextPaymentAttemptAt
        self.paidAt = paidAt
        self.paymentInstrument = paymentInstrument
        self.paymentMethodId = paymentMethodId
        self.paymentMethodType = paymentMethodType
        self.paymentRuleMatches = paymentRuleMatches
        self.paymentsFailed = paymentsFailed
        self.presentmentRefundedAmount = presentmentRefundedAmount
        self.presentmentTaxAmount = presentmentTaxAmount
        self.presentmentTotal = presentmentTotal
        self.productId = productId
        self.promoCodeId = promoCodeId
        self.quoteId = quoteId
        self.recoveryUrl = recoveryUrl
        self.refundable = refundable
        self.refundedAmount = refundedAmount
        self.refundedAt = refundedAt
        self.responseDueAt = responseDueAt
        self.retryable = retryable
        self.riskScore = riskScore
        self.riskSignals = riskSignals
        self.settlementTimeAt = settlementTimeAt
        self.shipmentId = shipmentId
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
        self.userAgent = userAgent
        self.variantId = variantId
        self.verificationChecks = verificationChecks
        self.voidable = voidable
        self.wuid = wuid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.amountAfterFees = try container.decode(Money.self, forKey: .amountAfterFees)
        self.autoCaptureAt = try container.decode(Nullable<String>.self, forKey: .autoCaptureAt)
        self.autoRefunded = try container.decode(Bool.self, forKey: .autoRefunded)
        self.billingAddress = try container.decode(Nullable<PaymentAddress>.self, forKey: .billingAddress)
        self.billingReason = try container.decode(Nullable<BillingReasons>.self, forKey: .billingReason)
        self.captureExpiresAt = try container.decode(Nullable<String>.self, forKey: .captureExpiresAt)
        self.checkoutConfigurationId = try container.decode(Nullable<String>.self, forKey: .checkoutConfigurationId)
        self.checkoutOrigin = try container.decode(Nullable<String>.self, forKey: .checkoutOrigin)
        self.checkoutSurface = try container.decode(Nullable<PaymentCheckoutSurface>.self, forKey: .checkoutSurface)
        self.clientSecret = try container.decode(Nullable<String>.self, forKey: .clientSecret)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.customerEmail = try container.decode(Nullable<String>.self, forKey: .customerEmail)
        self.customerPhone = try container.decode(Nullable<String>.self, forKey: .customerPhone)
        self.declineCode = try container.decode(Nullable<PaymentDeclineCodes>.self, forKey: .declineCode)
        self.disputeAlertedAt = try container.decode(Nullable<String>.self, forKey: .disputeAlertedAt)
        self.disputeCreatedAt = try container.decode(Nullable<String>.self, forKey: .disputeCreatedAt)
        self.failureMessage = try container.decode(Nullable<String>.self, forKey: .failureMessage)
        self.financingInstallmentsCount = try container.decode(Nullable<Double>.self, forKey: .financingInstallmentsCount)
        self.holds = try container.decode([PaymentHold].self, forKey: .holds)
        self.id = try container.decode(String.self, forKey: .id)
        self.ipAddress = try container.decode(Nullable<String>.self, forKey: .ipAddress)
        self.lastPaymentAttemptAt = try container.decode(Nullable<String>.self, forKey: .lastPaymentAttemptAt)
        self.lineItems = try container.decode([ReceiptLineItem].self, forKey: .lineItems)
        self.memberId = try container.decode(Nullable<String>.self, forKey: .memberId)
        self.membershipId = try container.decode(Nullable<String>.self, forKey: .membershipId)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.missingTracking = try container.decode(Nullable<Bool>.self, forKey: .missingTracking)
        self.needsTracking = try container.decode(Nullable<Bool>.self, forKey: .needsTracking)
        self.nextPaymentAttemptAt = try container.decode(Nullable<String>.self, forKey: .nextPaymentAttemptAt)
        self.paidAt = try container.decode(Nullable<String>.self, forKey: .paidAt)
        self.paymentInstrument = try container.decode(Nullable<PaymentInstrument>.self, forKey: .paymentInstrument)
        self.paymentMethodId = try container.decode(Nullable<String>.self, forKey: .paymentMethodId)
        self.paymentMethodType = try container.decode(Nullable<PaymentMethodTypes>.self, forKey: .paymentMethodType)
        self.paymentRuleMatches = try container.decode([PaymentRuleMatch].self, forKey: .paymentRuleMatches)
        self.paymentsFailed = try container.decode(Double.self, forKey: .paymentsFailed)
        self.presentmentRefundedAmount = try container.decode(Nullable<Money>.self, forKey: .presentmentRefundedAmount)
        self.presentmentTaxAmount = try container.decode(Nullable<Money>.self, forKey: .presentmentTaxAmount)
        self.presentmentTotal = try container.decode(Nullable<Money>.self, forKey: .presentmentTotal)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.promoCodeId = try container.decode(Nullable<String>.self, forKey: .promoCodeId)
        self.quoteId = try container.decode(Nullable<String>.self, forKey: .quoteId)
        self.recoveryUrl = try container.decode(Nullable<String>.self, forKey: .recoveryUrl)
        self.refundable = try container.decode(Bool.self, forKey: .refundable)
        self.refundedAmount = try container.decode(Nullable<Money>.self, forKey: .refundedAmount)
        self.refundedAt = try container.decode(Nullable<String>.self, forKey: .refundedAt)
        self.responseDueAt = try container.decode(Nullable<String>.self, forKey: .responseDueAt)
        self.retryable = try container.decode(Bool.self, forKey: .retryable)
        self.riskScore = try container.decode(Nullable<Double>.self, forKey: .riskScore)
        self.riskSignals = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .riskSignals)
        self.settlementTimeAt = try container.decode(Nullable<String>.self, forKey: .settlementTimeAt)
        self.shipmentId = try container.decode(Nullable<String>.self, forKey: .shipmentId)
        self.shippingAddress = try container.decode(Nullable<PaymentAddress>.self, forKey: .shippingAddress)
        self.status = try container.decode(ReceiptStatus.self, forKey: .status)
        self.substatus = try container.decode(FriendlyReceiptStatus.self, forKey: .substatus)
        self.subtotal = try container.decode(Nullable<Money>.self, forKey: .subtotal)
        self.taxAmount = try container.decode(Nullable<Money>.self, forKey: .taxAmount)
        self.taxBehavior = try container.decode(Nullable<ReceiptTaxBehaviors>.self, forKey: .taxBehavior)
        self.taxRefundedAmount = try container.decode(Money.self, forKey: .taxRefundedAmount)
        self.threeDsVerified = try container.decode(Bool.self, forKey: .threeDsVerified)
        self.total = try container.decode(Nullable<Money>.self, forKey: .total)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.usdTotal = try container.decode(Nullable<Money>.self, forKey: .usdTotal)
        self.user = try container.decode(Nullable<UserSummary>.self, forKey: .user)
        self.userAgent = try container.decode(Nullable<String>.self, forKey: .userAgent)
        self.variantId = try container.decode(Nullable<String>.self, forKey: .variantId)
        self.verificationChecks = try container.decode(Nullable<PaymentVerificationChecks>.self, forKey: .verificationChecks)
        self.voidable = try container.decode(Bool.self, forKey: .voidable)
        self.wuid = try container.decode(Nullable<String>.self, forKey: .wuid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.amountAfterFees, forKey: .amountAfterFees)
        try container.encode(self.autoCaptureAt, forKey: .autoCaptureAt)
        try container.encode(self.autoRefunded, forKey: .autoRefunded)
        try container.encode(self.billingAddress, forKey: .billingAddress)
        try container.encode(self.billingReason, forKey: .billingReason)
        try container.encode(self.captureExpiresAt, forKey: .captureExpiresAt)
        try container.encode(self.checkoutConfigurationId, forKey: .checkoutConfigurationId)
        try container.encode(self.checkoutOrigin, forKey: .checkoutOrigin)
        try container.encode(self.checkoutSurface, forKey: .checkoutSurface)
        try container.encode(self.clientSecret, forKey: .clientSecret)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.customerEmail, forKey: .customerEmail)
        try container.encode(self.customerPhone, forKey: .customerPhone)
        try container.encode(self.declineCode, forKey: .declineCode)
        try container.encode(self.disputeAlertedAt, forKey: .disputeAlertedAt)
        try container.encode(self.disputeCreatedAt, forKey: .disputeCreatedAt)
        try container.encode(self.failureMessage, forKey: .failureMessage)
        try container.encode(self.financingInstallmentsCount, forKey: .financingInstallmentsCount)
        try container.encode(self.holds, forKey: .holds)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.ipAddress, forKey: .ipAddress)
        try container.encode(self.lastPaymentAttemptAt, forKey: .lastPaymentAttemptAt)
        try container.encode(self.lineItems, forKey: .lineItems)
        try container.encode(self.memberId, forKey: .memberId)
        try container.encode(self.membershipId, forKey: .membershipId)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.missingTracking, forKey: .missingTracking)
        try container.encode(self.needsTracking, forKey: .needsTracking)
        try container.encode(self.nextPaymentAttemptAt, forKey: .nextPaymentAttemptAt)
        try container.encode(self.paidAt, forKey: .paidAt)
        try container.encode(self.paymentInstrument, forKey: .paymentInstrument)
        try container.encode(self.paymentMethodId, forKey: .paymentMethodId)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.paymentRuleMatches, forKey: .paymentRuleMatches)
        try container.encode(self.paymentsFailed, forKey: .paymentsFailed)
        try container.encode(self.presentmentRefundedAmount, forKey: .presentmentRefundedAmount)
        try container.encode(self.presentmentTaxAmount, forKey: .presentmentTaxAmount)
        try container.encode(self.presentmentTotal, forKey: .presentmentTotal)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.promoCodeId, forKey: .promoCodeId)
        try container.encode(self.quoteId, forKey: .quoteId)
        try container.encode(self.recoveryUrl, forKey: .recoveryUrl)
        try container.encode(self.refundable, forKey: .refundable)
        try container.encode(self.refundedAmount, forKey: .refundedAmount)
        try container.encode(self.refundedAt, forKey: .refundedAt)
        try container.encode(self.responseDueAt, forKey: .responseDueAt)
        try container.encode(self.retryable, forKey: .retryable)
        try container.encode(self.riskScore, forKey: .riskScore)
        try container.encode(self.riskSignals, forKey: .riskSignals)
        try container.encode(self.settlementTimeAt, forKey: .settlementTimeAt)
        try container.encode(self.shipmentId, forKey: .shipmentId)
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
        try container.encode(self.userAgent, forKey: .userAgent)
        try container.encode(self.variantId, forKey: .variantId)
        try container.encode(self.verificationChecks, forKey: .verificationChecks)
        try container.encode(self.voidable, forKey: .voidable)
        try container.encode(self.wuid, forKey: .wuid)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case amountAfterFees = "amount_after_fees"
        case autoCaptureAt = "auto_capture_at"
        case autoRefunded = "auto_refunded"
        case billingAddress = "billing_address"
        case billingReason = "billing_reason"
        case captureExpiresAt = "capture_expires_at"
        case checkoutConfigurationId = "checkout_configuration_id"
        case checkoutOrigin = "checkout_origin"
        case checkoutSurface = "checkout_surface"
        case clientSecret = "client_secret"
        case createdAt = "created_at"
        case currency
        case customerEmail = "customer_email"
        case customerPhone = "customer_phone"
        case declineCode = "decline_code"
        case disputeAlertedAt = "dispute_alerted_at"
        case disputeCreatedAt = "dispute_created_at"
        case failureMessage = "failure_message"
        case financingInstallmentsCount = "financing_installments_count"
        case holds
        case id
        case ipAddress = "ip_address"
        case lastPaymentAttemptAt = "last_payment_attempt_at"
        case lineItems = "line_items"
        case memberId = "member_id"
        case membershipId = "membership_id"
        case metadata
        case missingTracking = "missing_tracking"
        case needsTracking = "needs_tracking"
        case nextPaymentAttemptAt = "next_payment_attempt_at"
        case paidAt = "paid_at"
        case paymentInstrument = "payment_instrument"
        case paymentMethodId = "payment_method_id"
        case paymentMethodType = "payment_method_type"
        case paymentRuleMatches = "payment_rule_matches"
        case paymentsFailed = "payments_failed"
        case presentmentRefundedAmount = "presentment_refunded_amount"
        case presentmentTaxAmount = "presentment_tax_amount"
        case presentmentTotal = "presentment_total"
        case productId = "product_id"
        case promoCodeId = "promo_code_id"
        case quoteId = "quote_id"
        case recoveryUrl = "recovery_url"
        case refundable
        case refundedAmount = "refunded_amount"
        case refundedAt = "refunded_at"
        case responseDueAt = "response_due_at"
        case retryable
        case riskScore = "risk_score"
        case riskSignals = "risk_signals"
        case settlementTimeAt = "settlement_time_at"
        case shipmentId = "shipment_id"
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
        case userAgent = "user_agent"
        case variantId = "variant_id"
        case verificationChecks = "verification_checks"
        case voidable
        case wuid
    }
}