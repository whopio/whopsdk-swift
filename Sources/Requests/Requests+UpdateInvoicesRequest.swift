import Foundation

extension Requests {
    public struct UpdateInvoicesRequest: Codable, Hashable, Sendable {
        /// The date and time when the invoice will be automatically finalized. For charge_automatically, triggers an automatic charge. For send_invoice, sends the invoice email at the specified time.
        public let automaticallyFinalizesAt: Nullable<Date>?
        /// Inline billing address to create or update a mailing address for this invoice.
        public let billingAddress: Nullable<UpdateInvoicesRequestBillingAddress>?
        /// Whether to charge the customer a buyer fee on this invoice.
        public let chargeBuyerFee: Nullable<Bool>?
        /// How the invoice should be collected.
        public let collectionMethod: Nullable<InvoiceCollectionMethods>?
        /// The name of the customer.
        public let customerName: Nullable<String>?
        /// The date by which the invoice must be paid.
        public let dueDate: Nullable<Date>?
        /// The email address of the customer.
        public let emailAddress: Nullable<String>?
        /// Line items that break down the invoice total.
        public let lineItems: Nullable<[UpdateInvoicesRequestLineItemsItem]>?
        /// The unique identifier of an existing mailing address to attach.
        public let mailingAddressId: Nullable<String>?
        /// The unique identifier of a member to assign as the customer.
        public let memberId: Nullable<String>?
        /// The unique identifier of the payment method to charge.
        public let paymentMethodId: Nullable<String>?
        /// Updated plan attributes.
        public let plan: Nullable<UpdateInvoicesRequestPlan>?
        /// The unique identifier of an existing product to attach to this invoice. Only allowed while the invoice is still a draft.
        public let productId: Nullable<String>?
        /// The date that defines when the subscription billing cycle should start.
        public let subscriptionBillingAnchorAt: Nullable<Date>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            automaticallyFinalizesAt: Nullable<Date>? = nil,
            billingAddress: Nullable<UpdateInvoicesRequestBillingAddress>? = nil,
            chargeBuyerFee: Nullable<Bool>? = nil,
            collectionMethod: Nullable<InvoiceCollectionMethods>? = nil,
            customerName: Nullable<String>? = nil,
            dueDate: Nullable<Date>? = nil,
            emailAddress: Nullable<String>? = nil,
            lineItems: Nullable<[UpdateInvoicesRequestLineItemsItem]>? = nil,
            mailingAddressId: Nullable<String>? = nil,
            memberId: Nullable<String>? = nil,
            paymentMethodId: Nullable<String>? = nil,
            plan: Nullable<UpdateInvoicesRequestPlan>? = nil,
            productId: Nullable<String>? = nil,
            subscriptionBillingAnchorAt: Nullable<Date>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.automaticallyFinalizesAt = automaticallyFinalizesAt
            self.billingAddress = billingAddress
            self.chargeBuyerFee = chargeBuyerFee
            self.collectionMethod = collectionMethod
            self.customerName = customerName
            self.dueDate = dueDate
            self.emailAddress = emailAddress
            self.lineItems = lineItems
            self.mailingAddressId = mailingAddressId
            self.memberId = memberId
            self.paymentMethodId = paymentMethodId
            self.plan = plan
            self.productId = productId
            self.subscriptionBillingAnchorAt = subscriptionBillingAnchorAt
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.automaticallyFinalizesAt = try container.decodeNullableIfPresent(Date.self, forKey: .automaticallyFinalizesAt)
            self.billingAddress = try container.decodeNullableIfPresent(UpdateInvoicesRequestBillingAddress.self, forKey: .billingAddress)
            self.chargeBuyerFee = try container.decodeNullableIfPresent(Bool.self, forKey: .chargeBuyerFee)
            self.collectionMethod = try container.decodeNullableIfPresent(InvoiceCollectionMethods.self, forKey: .collectionMethod)
            self.customerName = try container.decodeNullableIfPresent(String.self, forKey: .customerName)
            self.dueDate = try container.decodeNullableIfPresent(Date.self, forKey: .dueDate)
            self.emailAddress = try container.decodeNullableIfPresent(String.self, forKey: .emailAddress)
            self.lineItems = try container.decodeNullableIfPresent([UpdateInvoicesRequestLineItemsItem].self, forKey: .lineItems)
            self.mailingAddressId = try container.decodeNullableIfPresent(String.self, forKey: .mailingAddressId)
            self.memberId = try container.decodeNullableIfPresent(String.self, forKey: .memberId)
            self.paymentMethodId = try container.decodeNullableIfPresent(String.self, forKey: .paymentMethodId)
            self.plan = try container.decodeNullableIfPresent(UpdateInvoicesRequestPlan.self, forKey: .plan)
            self.productId = try container.decodeNullableIfPresent(String.self, forKey: .productId)
            self.subscriptionBillingAnchorAt = try container.decodeNullableIfPresent(Date.self, forKey: .subscriptionBillingAnchorAt)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.automaticallyFinalizesAt, forKey: .automaticallyFinalizesAt)
            try container.encodeNullableIfPresent(self.billingAddress, forKey: .billingAddress)
            try container.encodeNullableIfPresent(self.chargeBuyerFee, forKey: .chargeBuyerFee)
            try container.encodeNullableIfPresent(self.collectionMethod, forKey: .collectionMethod)
            try container.encodeNullableIfPresent(self.customerName, forKey: .customerName)
            try container.encodeNullableIfPresent(self.dueDate, forKey: .dueDate)
            try container.encodeNullableIfPresent(self.emailAddress, forKey: .emailAddress)
            try container.encodeNullableIfPresent(self.lineItems, forKey: .lineItems)
            try container.encodeNullableIfPresent(self.mailingAddressId, forKey: .mailingAddressId)
            try container.encodeNullableIfPresent(self.memberId, forKey: .memberId)
            try container.encodeNullableIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
            try container.encodeNullableIfPresent(self.plan, forKey: .plan)
            try container.encodeNullableIfPresent(self.productId, forKey: .productId)
            try container.encodeNullableIfPresent(self.subscriptionBillingAnchorAt, forKey: .subscriptionBillingAnchorAt)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case automaticallyFinalizesAt = "automatically_finalizes_at"
            case billingAddress = "billing_address"
            case chargeBuyerFee = "charge_buyer_fee"
            case collectionMethod = "collection_method"
            case customerName = "customer_name"
            case dueDate = "due_date"
            case emailAddress = "email_address"
            case lineItems = "line_items"
            case mailingAddressId = "mailing_address_id"
            case memberId = "member_id"
            case paymentMethodId = "payment_method_id"
            case plan
            case productId = "product_id"
            case subscriptionBillingAnchorAt = "subscription_billing_anchor_at"
        }
    }
}