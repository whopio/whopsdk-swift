import Foundation

/// An invoice represents an itemized bill sent by a company to a customer for a specific product and plan, tracking the amount owed, due date, and payment status.
public struct LegacyInvoiceListItem: Codable, Hashable, Sendable {
    /// The datetime the invoice was created.
    public let createdAt: Date
    /// The plan that this invoice charges for.
    public let currentPlan: LegacyInvoiceListItemCurrentPlan
    /// The deadline by which payment is expected. Null if the invoice is collected automatically.
    public let dueDate: Nullable<Date>
    /// The email address of the customer this invoice is addressed to. Null if no email is on file.
    public let emailAddress: Nullable<String>
    /// A signed token that allows fetching invoice data publicly without authentication.
    public let fetchInvoiceToken: String
    /// The unique identifier for the invoice.
    public let id: String
    /// Optional line items that break down the invoice total into individual charges.
    public let lineItems: [LegacyInvoiceListItemLineItemsItem]
    /// The sequential invoice number for display purposes.
    public let number: String
    /// Whether a payment on this invoice is still clearing. True while a delayed payment method such as ACH or SEPA settles, during which the invoice stays open and is not marked past due.
    public let paymentProcessing: Bool
    /// The current payment status of the invoice, such as draft, open, paid, or void.
    public let status: InvoiceStatuses
    /// The user this invoice is addressed to. Null if the user account has been removed.
    public let user: Nullable<LegacyInvoiceListItemUser>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        currentPlan: LegacyInvoiceListItemCurrentPlan,
        dueDate: Nullable<Date>,
        emailAddress: Nullable<String>,
        fetchInvoiceToken: String,
        id: String,
        lineItems: [LegacyInvoiceListItemLineItemsItem],
        number: String,
        paymentProcessing: Bool,
        status: InvoiceStatuses,
        user: Nullable<LegacyInvoiceListItemUser>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.currentPlan = currentPlan
        self.dueDate = dueDate
        self.emailAddress = emailAddress
        self.fetchInvoiceToken = fetchInvoiceToken
        self.id = id
        self.lineItems = lineItems
        self.number = number
        self.paymentProcessing = paymentProcessing
        self.status = status
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currentPlan = try container.decode(LegacyInvoiceListItemCurrentPlan.self, forKey: .currentPlan)
        self.dueDate = try container.decode(Nullable<Date>.self, forKey: .dueDate)
        self.emailAddress = try container.decode(Nullable<String>.self, forKey: .emailAddress)
        self.fetchInvoiceToken = try container.decode(String.self, forKey: .fetchInvoiceToken)
        self.id = try container.decode(String.self, forKey: .id)
        self.lineItems = try container.decode([LegacyInvoiceListItemLineItemsItem].self, forKey: .lineItems)
        self.number = try container.decode(String.self, forKey: .number)
        self.paymentProcessing = try container.decode(Bool.self, forKey: .paymentProcessing)
        self.status = try container.decode(InvoiceStatuses.self, forKey: .status)
        self.user = try container.decode(Nullable<LegacyInvoiceListItemUser>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currentPlan, forKey: .currentPlan)
        try container.encode(self.dueDate, forKey: .dueDate)
        try container.encode(self.emailAddress, forKey: .emailAddress)
        try container.encode(self.fetchInvoiceToken, forKey: .fetchInvoiceToken)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lineItems, forKey: .lineItems)
        try container.encode(self.number, forKey: .number)
        try container.encode(self.paymentProcessing, forKey: .paymentProcessing)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case currentPlan = "current_plan"
        case dueDate = "due_date"
        case emailAddress = "email_address"
        case fetchInvoiceToken = "fetch_invoice_token"
        case id
        case lineItems = "line_items"
        case number
        case paymentProcessing = "payment_processing"
        case status
        case user
    }
}