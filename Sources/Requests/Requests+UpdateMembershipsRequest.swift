import Foundation

extension Requests {
    public struct UpdateMembershipsRequest: Codable, Hashable, Sendable {
        /// Number of days between recurring charges, applied to every recurring variant so future renewals use the same cadence. Sets the current period end to the current period start plus this value; when the value is a multiple of 30 or is 365, a membership that renews on a fixed day of the month (for example, after `current_period_end` was set) ends on that day instead. The new period end must remain in the future. Only for active, trialing, or past-due memberships billed automatically by Whop; invoice, externally billed, and canceling memberships are not supported. Existing non-daily memberships cannot be changed to daily billing. Cannot be combined with other fields.
        public let billingPeriodDays: Int?
        /// `true` cancels at the end of the current billing period (the customer keeps access until then); `false` reverses a pending cancellation.
        public let cancelAtPeriodEnd: Bool?
        /// When the next renewal charges, as an ISO 8601 timestamp; a date without a time means midnight UTC. Must fall after today in UTC. Later renewals follow on from this date, and a membership charged automatically on a variant billed every 30, 60, 90 … 360 or 365 days keeps renewing on this day of the month in UTC, or on the month's last day when a month is shorter. Only for active or trialing renewing memberships billed by Whop whose payments are not paused. Cannot be combined with other fields.
        public let currentPeriodEnd: Date?
        /// Key-value pairs to merge into the membership's metadata. Pass an empty object to clear it.
        public let metadata: [String: JSONValue]?
        /// The ID of a payment method the customer has saved with your account. Future renewals charge it, and an open past-due payment is retried on it right away. Requires the `member:payment_methods:manage` permission.
        public let paymentMethodId: String?
        /// The amount future renewals charge, in the membership's renewal currency. Can only lower the current renewal price; raising a price is not supported here. Moves only this membership to the new price and emails the customer the change. Only for active or trialing renewing memberships billed by Whop whose payments are not paused. Cannot be combined with other fields.
        public let renewalPrice: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            billingPeriodDays: Int? = nil,
            cancelAtPeriodEnd: Bool? = nil,
            currentPeriodEnd: Date? = nil,
            metadata: [String: JSONValue]? = nil,
            paymentMethodId: String? = nil,
            renewalPrice: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.billingPeriodDays = billingPeriodDays
            self.cancelAtPeriodEnd = cancelAtPeriodEnd
            self.currentPeriodEnd = currentPeriodEnd
            self.metadata = metadata
            self.paymentMethodId = paymentMethodId
            self.renewalPrice = renewalPrice
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.billingPeriodDays = try container.decodeIfPresent(Int.self, forKey: .billingPeriodDays)
            self.cancelAtPeriodEnd = try container.decodeIfPresent(Bool.self, forKey: .cancelAtPeriodEnd)
            self.currentPeriodEnd = try container.decodeIfPresent(Date.self, forKey: .currentPeriodEnd)
            self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
            self.paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId)
            self.renewalPrice = try container.decodeIfPresent(Double.self, forKey: .renewalPrice)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.billingPeriodDays, forKey: .billingPeriodDays)
            try container.encodeIfPresent(self.cancelAtPeriodEnd, forKey: .cancelAtPeriodEnd)
            try container.encodeIfPresent(self.currentPeriodEnd, forKey: .currentPeriodEnd)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
            try container.encodeIfPresent(self.renewalPrice, forKey: .renewalPrice)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case billingPeriodDays = "billing_period_days"
            case cancelAtPeriodEnd = "cancel_at_period_end"
            case currentPeriodEnd = "current_period_end"
            case metadata
            case paymentMethodId = "payment_method_id"
            case renewalPrice = "renewal_price"
        }
    }
}