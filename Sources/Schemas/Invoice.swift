import Foundation

public struct Invoice: Codable, Hashable, Sendable {
    public let accountId: String
    public let amountDue: Money
    public let billingAddress: Nullable<PaymentAddress>
    public let buyerFeeAmount: Money
    public let buyerFeePercentage: Double
    /// A signed link that opens this invoice in a checkout session so the buyer can pay it. Pass it as `link` to `POST /checkout_sessions`. Present while the invoice is open. `null` in any other status, for an invoice billed to a business buyer, and for an invoice whose membership was canceled. Also `null` unless you have `payment:charge`, or `invoice:create` or `invoice:update` on an invoice with no `payment_method_id`.
    public let checkoutLink: Nullable<String>
    public let createdAt: String
    public let customerName: Nullable<String>
    /// True when `DELETE /invoices/{id}` can delete this invoice. A draft qualifies unless it is scheduled or bills a subscription. A void invoice qualifies unless it collected money or still awaits a bank wire.
    public let deletable: Bool
    public let dueAt: Nullable<String>
    public let emailAddress: Nullable<String>
    public let id: String
    public let invoicePrefix: Nullable<String>
    public let lineItems: [InvoiceLineItem]
    public let mailingAddressId: Nullable<String>
    public let memberId: Nullable<String>
    /// The membership this invoice bills, prefixed `mem_`. For a renewal invoice, it is the subscription that renews. For an invoice with a recurring item, it is the membership created when the invoice is issued. Null for one-off invoices, for a draft not yet issued, and without the member:basic:read permission.
    public let membershipId: Nullable<String>
    /// A note to the customer, shown on the invoice email, PDF, and checkout page with its line breaks kept. `null` when none is set.
    public let memo: Nullable<String>
    public let metadata: [String: String]
    public let number: String
    public let object: InvoiceObject
    public let overdue: Bool
    public let paidAt: Nullable<String>
    /// The payment methods the customer can choose from when paying through the invoice's checkout link. It takes precedence over the invoice's variants and the account. `null` when the invoice uses its variants' payment methods.
    public let paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>
    public let paymentMethodId: Nullable<String>
    public let recipientEmails: [String]
    /// When the invoice's saved payment method will be charged, as an ISO 8601 timestamp. It is the `charge_at` the invoice was sent or issued with. Without one, it is `due_at` when an invoice with a `payment_method_id` is sent or issued before it is due. On a draft, it is the `charge_at` of its scheduled send. `null` otherwise, once the charge starts, and once the invoice is paid, void, or uncollectible.
    public let scheduledChargeAt: Nullable<String>
    /// The `collection_method` a draft's scheduled send applies when it fires. `null` when the draft has no scheduled send or it was scheduled without one, and once the invoice is issued.
    public let scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>
    public let scheduledSendAt: Nullable<String>
    /// Whether this draft is issued automatically when its `due_at` arrives. Issuing it charges its `payment_method_id`, or emails its payment link to its `recipient_emails`. `false` for an invoice that is not a draft and for a draft with a scheduled send. `false` while sending the draft would fail for missing recipients or an unavailable payment link. `false` for a draft that had no future `due_at` when it was last saved. `false` for a draft created before 2026-11-12T22:00:00Z.
    public let sendsOnDueDate: Bool
    public let status: InvoiceStatus
    public let subtotal: Money
    public let taxAmount: Nullable<Money>
    public let total: Money
    public let totalsStatus: InvoiceTotalsStatus
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        amountDue: Money,
        billingAddress: Nullable<PaymentAddress>,
        buyerFeeAmount: Money,
        buyerFeePercentage: Double,
        checkoutLink: Nullable<String>,
        createdAt: String,
        customerName: Nullable<String>,
        deletable: Bool,
        dueAt: Nullable<String>,
        emailAddress: Nullable<String>,
        id: String,
        invoicePrefix: Nullable<String>,
        lineItems: [InvoiceLineItem],
        mailingAddressId: Nullable<String>,
        memberId: Nullable<String>,
        membershipId: Nullable<String>,
        memo: Nullable<String>,
        metadata: [String: String],
        number: String,
        object: InvoiceObject,
        overdue: Bool,
        paidAt: Nullable<String>,
        paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>,
        paymentMethodId: Nullable<String>,
        recipientEmails: [String],
        scheduledChargeAt: Nullable<String>,
        scheduledCollectionMethod: Nullable<InvoiceScheduledCollectionMethod>,
        scheduledSendAt: Nullable<String>,
        sendsOnDueDate: Bool,
        status: InvoiceStatus,
        subtotal: Money,
        taxAmount: Nullable<Money>,
        total: Money,
        totalsStatus: InvoiceTotalsStatus,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.amountDue = amountDue
        self.billingAddress = billingAddress
        self.buyerFeeAmount = buyerFeeAmount
        self.buyerFeePercentage = buyerFeePercentage
        self.checkoutLink = checkoutLink
        self.createdAt = createdAt
        self.customerName = customerName
        self.deletable = deletable
        self.dueAt = dueAt
        self.emailAddress = emailAddress
        self.id = id
        self.invoicePrefix = invoicePrefix
        self.lineItems = lineItems
        self.mailingAddressId = mailingAddressId
        self.memberId = memberId
        self.membershipId = membershipId
        self.memo = memo
        self.metadata = metadata
        self.number = number
        self.object = object
        self.overdue = overdue
        self.paidAt = paidAt
        self.paymentMethodConfiguration = paymentMethodConfiguration
        self.paymentMethodId = paymentMethodId
        self.recipientEmails = recipientEmails
        self.scheduledChargeAt = scheduledChargeAt
        self.scheduledCollectionMethod = scheduledCollectionMethod
        self.scheduledSendAt = scheduledSendAt
        self.sendsOnDueDate = sendsOnDueDate
        self.status = status
        self.subtotal = subtotal
        self.taxAmount = taxAmount
        self.total = total
        self.totalsStatus = totalsStatus
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.amountDue = try container.decode(Money.self, forKey: .amountDue)
        self.billingAddress = try container.decode(Nullable<PaymentAddress>.self, forKey: .billingAddress)
        self.buyerFeeAmount = try container.decode(Money.self, forKey: .buyerFeeAmount)
        self.buyerFeePercentage = try container.decode(Double.self, forKey: .buyerFeePercentage)
        self.checkoutLink = try container.decode(Nullable<String>.self, forKey: .checkoutLink)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.customerName = try container.decode(Nullable<String>.self, forKey: .customerName)
        self.deletable = try container.decode(Bool.self, forKey: .deletable)
        self.dueAt = try container.decode(Nullable<String>.self, forKey: .dueAt)
        self.emailAddress = try container.decode(Nullable<String>.self, forKey: .emailAddress)
        self.id = try container.decode(String.self, forKey: .id)
        self.invoicePrefix = try container.decode(Nullable<String>.self, forKey: .invoicePrefix)
        self.lineItems = try container.decode([InvoiceLineItem].self, forKey: .lineItems)
        self.mailingAddressId = try container.decode(Nullable<String>.self, forKey: .mailingAddressId)
        self.memberId = try container.decode(Nullable<String>.self, forKey: .memberId)
        self.membershipId = try container.decode(Nullable<String>.self, forKey: .membershipId)
        self.memo = try container.decode(Nullable<String>.self, forKey: .memo)
        self.metadata = try container.decode([String: String].self, forKey: .metadata)
        self.number = try container.decode(String.self, forKey: .number)
        self.object = try container.decode(InvoiceObject.self, forKey: .object)
        self.overdue = try container.decode(Bool.self, forKey: .overdue)
        self.paidAt = try container.decode(Nullable<String>.self, forKey: .paidAt)
        self.paymentMethodConfiguration = try container.decode(Nullable<CheckoutSessionPaymentMethodConfiguration>.self, forKey: .paymentMethodConfiguration)
        self.paymentMethodId = try container.decode(Nullable<String>.self, forKey: .paymentMethodId)
        self.recipientEmails = try container.decode([String].self, forKey: .recipientEmails)
        self.scheduledChargeAt = try container.decode(Nullable<String>.self, forKey: .scheduledChargeAt)
        self.scheduledCollectionMethod = try container.decode(Nullable<InvoiceScheduledCollectionMethod>.self, forKey: .scheduledCollectionMethod)
        self.scheduledSendAt = try container.decode(Nullable<String>.self, forKey: .scheduledSendAt)
        self.sendsOnDueDate = try container.decode(Bool.self, forKey: .sendsOnDueDate)
        self.status = try container.decode(InvoiceStatus.self, forKey: .status)
        self.subtotal = try container.decode(Money.self, forKey: .subtotal)
        self.taxAmount = try container.decode(Nullable<Money>.self, forKey: .taxAmount)
        self.total = try container.decode(Money.self, forKey: .total)
        self.totalsStatus = try container.decode(InvoiceTotalsStatus.self, forKey: .totalsStatus)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.amountDue, forKey: .amountDue)
        try container.encode(self.billingAddress, forKey: .billingAddress)
        try container.encode(self.buyerFeeAmount, forKey: .buyerFeeAmount)
        try container.encode(self.buyerFeePercentage, forKey: .buyerFeePercentage)
        try container.encode(self.checkoutLink, forKey: .checkoutLink)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customerName, forKey: .customerName)
        try container.encode(self.deletable, forKey: .deletable)
        try container.encode(self.dueAt, forKey: .dueAt)
        try container.encode(self.emailAddress, forKey: .emailAddress)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.invoicePrefix, forKey: .invoicePrefix)
        try container.encode(self.lineItems, forKey: .lineItems)
        try container.encode(self.mailingAddressId, forKey: .mailingAddressId)
        try container.encode(self.memberId, forKey: .memberId)
        try container.encode(self.membershipId, forKey: .membershipId)
        try container.encode(self.memo, forKey: .memo)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.number, forKey: .number)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.overdue, forKey: .overdue)
        try container.encode(self.paidAt, forKey: .paidAt)
        try container.encode(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
        try container.encode(self.paymentMethodId, forKey: .paymentMethodId)
        try container.encode(self.recipientEmails, forKey: .recipientEmails)
        try container.encode(self.scheduledChargeAt, forKey: .scheduledChargeAt)
        try container.encode(self.scheduledCollectionMethod, forKey: .scheduledCollectionMethod)
        try container.encode(self.scheduledSendAt, forKey: .scheduledSendAt)
        try container.encode(self.sendsOnDueDate, forKey: .sendsOnDueDate)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.subtotal, forKey: .subtotal)
        try container.encode(self.taxAmount, forKey: .taxAmount)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.totalsStatus, forKey: .totalsStatus)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case amountDue = "amount_due"
        case billingAddress = "billing_address"
        case buyerFeeAmount = "buyer_fee_amount"
        case buyerFeePercentage = "buyer_fee_percentage"
        case checkoutLink = "checkout_link"
        case createdAt = "created_at"
        case customerName = "customer_name"
        case deletable
        case dueAt = "due_at"
        case emailAddress = "email_address"
        case id
        case invoicePrefix = "invoice_prefix"
        case lineItems = "line_items"
        case mailingAddressId = "mailing_address_id"
        case memberId = "member_id"
        case membershipId = "membership_id"
        case memo
        case metadata
        case number
        case object
        case overdue
        case paidAt = "paid_at"
        case paymentMethodConfiguration = "payment_method_configuration"
        case paymentMethodId = "payment_method_id"
        case recipientEmails = "recipient_emails"
        case scheduledChargeAt = "scheduled_charge_at"
        case scheduledCollectionMethod = "scheduled_collection_method"
        case scheduledSendAt = "scheduled_send_at"
        case sendsOnDueDate = "sends_on_due_date"
        case status
        case subtotal
        case taxAmount = "tax_amount"
        case total
        case totalsStatus = "totals_status"
        case updatedAt = "updated_at"
    }
}