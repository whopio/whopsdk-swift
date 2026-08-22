import Foundation

extension Requests {
    public struct UpdateOverridesRequest: Codable, Hashable, Sendable {
        /// Whether commission applies to first payment or all payments (standard only).
        public let appliesToPayments: Nullable<AffiliateAppliesToPayments>?
        /// The commission type (percentage or flat_fee).
        public let commissionType: Nullable<AffiliatePayoutTypes>?
        /// The commission value (percentage 1-100 or flat fee in dollars).
        public let commissionValue: Nullable<Double>?
        /// The revenue calculation basis (rev-share only).
        public let revenueBasis: Nullable<AffiliateRevenueBases>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            appliesToPayments: Nullable<AffiliateAppliesToPayments>? = nil,
            commissionType: Nullable<AffiliatePayoutTypes>? = nil,
            commissionValue: Nullable<Double>? = nil,
            revenueBasis: Nullable<AffiliateRevenueBases>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.appliesToPayments = appliesToPayments
            self.commissionType = commissionType
            self.commissionValue = commissionValue
            self.revenueBasis = revenueBasis
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.appliesToPayments = try container.decodeNullableIfPresent(AffiliateAppliesToPayments.self, forKey: .appliesToPayments)
            self.commissionType = try container.decodeNullableIfPresent(AffiliatePayoutTypes.self, forKey: .commissionType)
            self.commissionValue = try container.decodeNullableIfPresent(Double.self, forKey: .commissionValue)
            self.revenueBasis = try container.decodeNullableIfPresent(AffiliateRevenueBases.self, forKey: .revenueBasis)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.appliesToPayments, forKey: .appliesToPayments)
            try container.encodeNullableIfPresent(self.commissionType, forKey: .commissionType)
            try container.encodeNullableIfPresent(self.commissionValue, forKey: .commissionValue)
            try container.encodeNullableIfPresent(self.revenueBasis, forKey: .revenueBasis)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case appliesToPayments = "applies_to_payments"
            case commissionType = "commission_type"
            case commissionValue = "commission_value"
            case revenueBasis = "revenue_basis"
        }
    }
}