import Foundation

extension Requests {
    public struct IssueInvoicesRequest: Codable, Hashable, Sendable {
        /// When to charge the draft's `payment_method_id`, as an ISO 8601 timestamp in the future. Only for a draft with a `payment_method_id` and a total above zero. Omit to charge on `due_at` if it is still ahead, or right away otherwise.
        public let chargeAt: Nullable<Date>?
        /// How the subscription this invoice starts collects each renewal. `charge_automatically` charges the payment method that paid the invoice each period: the draft's `payment_method_id`, or the one the customer pays the invoice link with. `send_invoice` issues a numbered invoice each period, due on the renewal date and emailed with its payment link to the latest invoice's `recipient_emails`, so it needs at least one recipient and isn't available for invoices billed to a business. Defaults to `charge_automatically`. Only for a draft with a recurring item. A scheduled send applies it when it fires (see `scheduled_collection_method`).
        public let collectionMethod: Nullable<IssueInvoicesRequestCollectionMethod>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            chargeAt: Nullable<Date>? = nil,
            collectionMethod: Nullable<IssueInvoicesRequestCollectionMethod>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.chargeAt = chargeAt
            self.collectionMethod = collectionMethod
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.chargeAt = try container.decodeNullableIfPresent(Date.self, forKey: .chargeAt)
            self.collectionMethod = try container.decodeNullableIfPresent(IssueInvoicesRequestCollectionMethod.self, forKey: .collectionMethod)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.chargeAt, forKey: .chargeAt)
            try container.encodeNullableIfPresent(self.collectionMethod, forKey: .collectionMethod)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case chargeAt = "charge_at"
            case collectionMethod = "collection_method"
        }
    }
}