import Foundation

/// An invoice represents an itemized bill sent by a company to a customer for a specific product and plan, tracking the amount owed, due date, and payment status.
public struct LegacyInvoice: Codable, Hashable, Sendable {
    /// The date and time when the invoice will be automatically finalized. For charge_automatically, triggers an automatic charge. For send_invoice, sends the invoice email at the specified time.
    public let automaticallyFinalizesAt: Nullable<Date>
    /// Whether the invoice includes a buyer processing fee on top of the plan price.
    public let chargeBuyerFee: Bool
    /// The method used to collect payment for this invoice, such as automatic charging or manual payment.
    public let collectionMethod: InvoiceCollectionMethods
    /// The company that issued this invoice.
    public let company: LegacyInvoiceCompany
    /// The datetime the invoice was created.
    public let createdAt: Date
    /// The plan that this invoice charges for.
    public let currentPlan: LegacyInvoiceCurrentPlan
    /// The full name of the customer this invoice is addressed to. Null if no name is on file.
    public let customerName: Nullable<String>
    /// The deadline by which payment is expected. Null if the invoice is collected automatically.
    public let dueDate: Nullable<Date>
    /// The email address of the customer this invoice is addressed to. Null if no email is on file.
    public let emailAddress: Nullable<String>
    /// A signed token that allows fetching invoice data publicly without authentication.
    public let fetchInvoiceToken: String
    /// The unique identifier for the invoice.
    public let id: String
    /// Optional line items that break down the invoice total into individual charges.
    public let lineItems: [LegacyInvoiceLineItemsItem]
    /// The billing/mailing address associated with this invoice, if one was provided at creation time.
    public let mailingAddress: Nullable<LegacyInvoiceMailingAddress>
    /// The member that the invoice was created for. Null when the invoice is addressed to an email address with no member record behind it.
    public let member: Nullable<LegacyInvoiceMember>
    /// The sequential invoice number for display purposes.
    public let number: String
    /// The checkout URL where the customer can pay this invoice online, with their email address pre-filled and locked.
    public let payOnlineUrl: Nullable<String>
    /// The payment that settled this invoice. Null while the invoice is unpaid, when the invoice was marked paid manually, and on a subscription renewal invoice, where the settling payment cannot yet be identified.
    public let payment: Nullable<LegacyInvoicePayment>
    /// Whether a payment on this invoice is still clearing. True while a delayed payment method such as ACH or SEPA settles, during which the invoice stays open and is not marked past due.
    public let paymentProcessing: Bool
    /// The product that this invoice was generated for.
    public let product: LegacyInvoiceProduct
    /// The current payment status of the invoice, such as draft, open, paid, or void.
    public let status: InvoiceStatuses
    /// The date that defines when the subscription billing cycle starts. When set on a renewal plan invoice, all future billing periods anchor to this date.
    public let subscriptionBillingAnchorAt: Nullable<Date>
    /// The datetime the invoice was last updated.
    public let updatedAt: Date
    /// The user this invoice is addressed to. Null if the user account has been removed.
    public let user: Nullable<LegacyInvoiceUser>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        automaticallyFinalizesAt: Nullable<Date>,
        chargeBuyerFee: Bool,
        collectionMethod: InvoiceCollectionMethods,
        company: LegacyInvoiceCompany,
        createdAt: Date,
        currentPlan: LegacyInvoiceCurrentPlan,
        customerName: Nullable<String>,
        dueDate: Nullable<Date>,
        emailAddress: Nullable<String>,
        fetchInvoiceToken: String,
        id: String,
        lineItems: [LegacyInvoiceLineItemsItem],
        mailingAddress: Nullable<LegacyInvoiceMailingAddress>,
        member: Nullable<LegacyInvoiceMember>,
        number: String,
        payOnlineUrl: Nullable<String>,
        payment: Nullable<LegacyInvoicePayment>,
        paymentProcessing: Bool,
        product: LegacyInvoiceProduct,
        status: InvoiceStatuses,
        subscriptionBillingAnchorAt: Nullable<Date>,
        updatedAt: Date,
        user: Nullable<LegacyInvoiceUser>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.automaticallyFinalizesAt = automaticallyFinalizesAt
        self.chargeBuyerFee = chargeBuyerFee
        self.collectionMethod = collectionMethod
        self.company = company
        self.createdAt = createdAt
        self.currentPlan = currentPlan
        self.customerName = customerName
        self.dueDate = dueDate
        self.emailAddress = emailAddress
        self.fetchInvoiceToken = fetchInvoiceToken
        self.id = id
        self.lineItems = lineItems
        self.mailingAddress = mailingAddress
        self.member = member
        self.number = number
        self.payOnlineUrl = payOnlineUrl
        self.payment = payment
        self.paymentProcessing = paymentProcessing
        self.product = product
        self.status = status
        self.subscriptionBillingAnchorAt = subscriptionBillingAnchorAt
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.automaticallyFinalizesAt = try container.decode(Nullable<Date>.self, forKey: .automaticallyFinalizesAt)
        self.chargeBuyerFee = try container.decode(Bool.self, forKey: .chargeBuyerFee)
        self.collectionMethod = try container.decode(InvoiceCollectionMethods.self, forKey: .collectionMethod)
        self.company = try container.decode(LegacyInvoiceCompany.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currentPlan = try container.decode(LegacyInvoiceCurrentPlan.self, forKey: .currentPlan)
        self.customerName = try container.decode(Nullable<String>.self, forKey: .customerName)
        self.dueDate = try container.decode(Nullable<Date>.self, forKey: .dueDate)
        self.emailAddress = try container.decode(Nullable<String>.self, forKey: .emailAddress)
        self.fetchInvoiceToken = try container.decode(String.self, forKey: .fetchInvoiceToken)
        self.id = try container.decode(String.self, forKey: .id)
        self.lineItems = try container.decode([LegacyInvoiceLineItemsItem].self, forKey: .lineItems)
        self.mailingAddress = try container.decode(Nullable<LegacyInvoiceMailingAddress>.self, forKey: .mailingAddress)
        self.member = try container.decode(Nullable<LegacyInvoiceMember>.self, forKey: .member)
        self.number = try container.decode(String.self, forKey: .number)
        self.payOnlineUrl = try container.decode(Nullable<String>.self, forKey: .payOnlineUrl)
        self.payment = try container.decode(Nullable<LegacyInvoicePayment>.self, forKey: .payment)
        self.paymentProcessing = try container.decode(Bool.self, forKey: .paymentProcessing)
        self.product = try container.decode(LegacyInvoiceProduct.self, forKey: .product)
        self.status = try container.decode(InvoiceStatuses.self, forKey: .status)
        self.subscriptionBillingAnchorAt = try container.decode(Nullable<Date>.self, forKey: .subscriptionBillingAnchorAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.user = try container.decode(Nullable<LegacyInvoiceUser>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.automaticallyFinalizesAt, forKey: .automaticallyFinalizesAt)
        try container.encode(self.chargeBuyerFee, forKey: .chargeBuyerFee)
        try container.encode(self.collectionMethod, forKey: .collectionMethod)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currentPlan, forKey: .currentPlan)
        try container.encode(self.customerName, forKey: .customerName)
        try container.encode(self.dueDate, forKey: .dueDate)
        try container.encode(self.emailAddress, forKey: .emailAddress)
        try container.encode(self.fetchInvoiceToken, forKey: .fetchInvoiceToken)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lineItems, forKey: .lineItems)
        try container.encode(self.mailingAddress, forKey: .mailingAddress)
        try container.encode(self.member, forKey: .member)
        try container.encode(self.number, forKey: .number)
        try container.encode(self.payOnlineUrl, forKey: .payOnlineUrl)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.paymentProcessing, forKey: .paymentProcessing)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.subscriptionBillingAnchorAt, forKey: .subscriptionBillingAnchorAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case automaticallyFinalizesAt = "automatically_finalizes_at"
        case chargeBuyerFee = "charge_buyer_fee"
        case collectionMethod = "collection_method"
        case company
        case createdAt = "created_at"
        case currentPlan = "current_plan"
        case customerName = "customer_name"
        case dueDate = "due_date"
        case emailAddress = "email_address"
        case fetchInvoiceToken = "fetch_invoice_token"
        case id
        case lineItems = "line_items"
        case mailingAddress = "mailing_address"
        case member
        case number
        case payOnlineUrl = "pay_online_url"
        case payment
        case paymentProcessing = "payment_processing"
        case product
        case status
        case subscriptionBillingAnchorAt = "subscription_billing_anchor_at"
        case updatedAt = "updated_at"
        case user
    }
}