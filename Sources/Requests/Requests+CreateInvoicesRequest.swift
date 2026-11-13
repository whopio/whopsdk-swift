import Foundation

extension Requests {
    public struct CreateInvoicesRequest: Codable, Hashable, Sendable {
        /// The issuing account.
        public let accountId: String
        /// Create a billing address linked to this member.
        public let billingAddress: Nullable<CreateInvoicesRequestBillingAddress>?
        /// The buyer's adjustable fee in percentage points, with at most two decimal places: `0` for none, or between 5 and 100. The account keeps it, and Whop waives its take rate on the invoice.
        public let buyerFeePercentage: Double?
        /// The contact name when creating an email-only member.
        public let customerName: Nullable<String>?
        /// When payment is due, as an ISO 8601 timestamp.
        public let dueAt: Nullable<Date>?
        /// Resolve or create the member for this email, creating a Whop user when none exists. Mutually exclusive with member_id.
        public let emailAddress: Nullable<String>?
        /// The variants being invoiced, all in the same currency. Each variant may appear once. Use quantity for multiple units. A recurring variant must belong to a product. Its first invoice charges `initial_price` plus `renewal_price`. Later invoices charge only `renewal_price`. Paying the first invoice starts a paid billing period immediately, without the variant's trial. The subscription uses the `collection_method` the invoice was sent or issued with. A finite payment count includes the first paid invoice. With several items, every item that has a product must be a regular product, and all items need compatible payment, tax, and access settings.
        public let items: [CreateInvoicesRequestItemsItem]
        /// An address associated with the member. Mutually exclusive with billing_address.
        public let mailingAddressId: Nullable<String>?
        /// The billed customer, a member of the account, prefixed `mber_`. It can't change once the draft is created. Changing email recipients does not change this buyer.
        public let memberId: Nullable<String>?
        /// A note to the customer, shown on the invoice email, PDF, and checkout page with its line breaks kept. Trimmed; `null` or blank clears it. Can be updated on draft, open, or uncollectible invoices.
        public let memo: Nullable<String>?
        /// Up to 50 caller-owned string key/value pairs. The `invoice_memo` key is reserved and ignored; set `memo` instead.
        public let metadata: [String: String]?
        /// The payment methods the customer can choose from when paying through the invoice's checkout link, in the shape a variant or checkout configuration takes. It takes precedence over the invoice's variants and the account, and changes neither. Send both lists. `null` uses its variants' payment methods. Can be updated on drafts.
        public let paymentMethodConfiguration: Nullable<CreateInvoicesRequestPaymentMethodConfiguration>?
        /// A saved payment method belonging to the member, prefixed `payt_`. Sending or issuing the invoice charges this method at the `charge_at` passed to that call, otherwise on `due_at`, or right away when there is no `due_at` or it has passed. Sending also emails the invoice now when the charge is later; issuing does not. Setting it needs `payment:charge`.
        public let paymentMethodId: Nullable<String>?
        /// Email addresses saved for invoice delivery, independent of the billed customer. Saving them sends no email. Defaults to the customer email when omitted on create. Can be updated on draft, open, or uncollectible invoices.
        public let recipientEmails: [String]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            billingAddress: Nullable<CreateInvoicesRequestBillingAddress>? = nil,
            buyerFeePercentage: Double? = nil,
            customerName: Nullable<String>? = nil,
            dueAt: Nullable<Date>? = nil,
            emailAddress: Nullable<String>? = nil,
            items: [CreateInvoicesRequestItemsItem],
            mailingAddressId: Nullable<String>? = nil,
            memberId: Nullable<String>? = nil,
            memo: Nullable<String>? = nil,
            metadata: [String: String]? = nil,
            paymentMethodConfiguration: Nullable<CreateInvoicesRequestPaymentMethodConfiguration>? = nil,
            paymentMethodId: Nullable<String>? = nil,
            recipientEmails: [String]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.billingAddress = billingAddress
            self.buyerFeePercentage = buyerFeePercentage
            self.customerName = customerName
            self.dueAt = dueAt
            self.emailAddress = emailAddress
            self.items = items
            self.mailingAddressId = mailingAddressId
            self.memberId = memberId
            self.memo = memo
            self.metadata = metadata
            self.paymentMethodConfiguration = paymentMethodConfiguration
            self.paymentMethodId = paymentMethodId
            self.recipientEmails = recipientEmails
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.billingAddress = try container.decodeNullableIfPresent(CreateInvoicesRequestBillingAddress.self, forKey: .billingAddress)
            self.buyerFeePercentage = try container.decodeIfPresent(Double.self, forKey: .buyerFeePercentage)
            self.customerName = try container.decodeNullableIfPresent(String.self, forKey: .customerName)
            self.dueAt = try container.decodeNullableIfPresent(Date.self, forKey: .dueAt)
            self.emailAddress = try container.decodeNullableIfPresent(String.self, forKey: .emailAddress)
            self.items = try container.decode([CreateInvoicesRequestItemsItem].self, forKey: .items)
            self.mailingAddressId = try container.decodeNullableIfPresent(String.self, forKey: .mailingAddressId)
            self.memberId = try container.decodeNullableIfPresent(String.self, forKey: .memberId)
            self.memo = try container.decodeNullableIfPresent(String.self, forKey: .memo)
            self.metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
            self.paymentMethodConfiguration = try container.decodeNullableIfPresent(CreateInvoicesRequestPaymentMethodConfiguration.self, forKey: .paymentMethodConfiguration)
            self.paymentMethodId = try container.decodeNullableIfPresent(String.self, forKey: .paymentMethodId)
            self.recipientEmails = try container.decodeIfPresent([String].self, forKey: .recipientEmails)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.billingAddress, forKey: .billingAddress)
            try container.encodeIfPresent(self.buyerFeePercentage, forKey: .buyerFeePercentage)
            try container.encodeNullableIfPresent(self.customerName, forKey: .customerName)
            try container.encodeNullableIfPresent(self.dueAt, forKey: .dueAt)
            try container.encodeNullableIfPresent(self.emailAddress, forKey: .emailAddress)
            try container.encode(self.items, forKey: .items)
            try container.encodeNullableIfPresent(self.mailingAddressId, forKey: .mailingAddressId)
            try container.encodeNullableIfPresent(self.memberId, forKey: .memberId)
            try container.encodeNullableIfPresent(self.memo, forKey: .memo)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
            try container.encodeNullableIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
            try container.encodeIfPresent(self.recipientEmails, forKey: .recipientEmails)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case billingAddress = "billing_address"
            case buyerFeePercentage = "buyer_fee_percentage"
            case customerName = "customer_name"
            case dueAt = "due_at"
            case emailAddress = "email_address"
            case items
            case mailingAddressId = "mailing_address_id"
            case memberId = "member_id"
            case memo
            case metadata
            case paymentMethodConfiguration = "payment_method_configuration"
            case paymentMethodId = "payment_method_id"
            case recipientEmails = "recipient_emails"
        }
    }
}