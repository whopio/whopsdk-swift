import Foundation

extension Requests {
    public struct CreatePromoCodesRequest: Codable, Hashable, Sendable {
        public let accountId: String
        public let amountOff: Double
        public let baseCurrency: CreatePromoCodesRequestBaseCurrency
        public let churnedUsersOnly: Bool?
        public let code: String
        public let existingMembershipsOnly: Bool?
        public let expiresAt: Nullable<String>?
        public let newUsersOnly: Bool
        public let onePerCustomer: Bool?
        public let planIds: [String]?
        public let productId: Nullable<String>?
        public let promoDurationMonths: Int
        public let promoType: CreatePromoCodesRequestPromoType
        public let stock: Nullable<Int>?
        public let unlimitedStock: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            amountOff: Double,
            baseCurrency: CreatePromoCodesRequestBaseCurrency,
            churnedUsersOnly: Bool? = nil,
            code: String,
            existingMembershipsOnly: Bool? = nil,
            expiresAt: Nullable<String>? = nil,
            newUsersOnly: Bool,
            onePerCustomer: Bool? = nil,
            planIds: [String]? = nil,
            productId: Nullable<String>? = nil,
            promoDurationMonths: Int,
            promoType: CreatePromoCodesRequestPromoType,
            stock: Nullable<Int>? = nil,
            unlimitedStock: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.amountOff = amountOff
            self.baseCurrency = baseCurrency
            self.churnedUsersOnly = churnedUsersOnly
            self.code = code
            self.existingMembershipsOnly = existingMembershipsOnly
            self.expiresAt = expiresAt
            self.newUsersOnly = newUsersOnly
            self.onePerCustomer = onePerCustomer
            self.planIds = planIds
            self.productId = productId
            self.promoDurationMonths = promoDurationMonths
            self.promoType = promoType
            self.stock = stock
            self.unlimitedStock = unlimitedStock
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.amountOff = try container.decode(Double.self, forKey: .amountOff)
            self.baseCurrency = try container.decode(CreatePromoCodesRequestBaseCurrency.self, forKey: .baseCurrency)
            self.churnedUsersOnly = try container.decodeIfPresent(Bool.self, forKey: .churnedUsersOnly)
            self.code = try container.decode(String.self, forKey: .code)
            self.existingMembershipsOnly = try container.decodeIfPresent(Bool.self, forKey: .existingMembershipsOnly)
            self.expiresAt = try container.decodeNullableIfPresent(String.self, forKey: .expiresAt)
            self.newUsersOnly = try container.decode(Bool.self, forKey: .newUsersOnly)
            self.onePerCustomer = try container.decodeIfPresent(Bool.self, forKey: .onePerCustomer)
            self.planIds = try container.decodeIfPresent([String].self, forKey: .planIds)
            self.productId = try container.decodeNullableIfPresent(String.self, forKey: .productId)
            self.promoDurationMonths = try container.decode(Int.self, forKey: .promoDurationMonths)
            self.promoType = try container.decode(CreatePromoCodesRequestPromoType.self, forKey: .promoType)
            self.stock = try container.decodeNullableIfPresent(Int.self, forKey: .stock)
            self.unlimitedStock = try container.decodeIfPresent(Bool.self, forKey: .unlimitedStock)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encode(self.amountOff, forKey: .amountOff)
            try container.encode(self.baseCurrency, forKey: .baseCurrency)
            try container.encodeIfPresent(self.churnedUsersOnly, forKey: .churnedUsersOnly)
            try container.encode(self.code, forKey: .code)
            try container.encodeIfPresent(self.existingMembershipsOnly, forKey: .existingMembershipsOnly)
            try container.encodeNullableIfPresent(self.expiresAt, forKey: .expiresAt)
            try container.encode(self.newUsersOnly, forKey: .newUsersOnly)
            try container.encodeIfPresent(self.onePerCustomer, forKey: .onePerCustomer)
            try container.encodeIfPresent(self.planIds, forKey: .planIds)
            try container.encodeNullableIfPresent(self.productId, forKey: .productId)
            try container.encode(self.promoDurationMonths, forKey: .promoDurationMonths)
            try container.encode(self.promoType, forKey: .promoType)
            try container.encodeNullableIfPresent(self.stock, forKey: .stock)
            try container.encodeIfPresent(self.unlimitedStock, forKey: .unlimitedStock)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case amountOff = "amount_off"
            case baseCurrency = "base_currency"
            case churnedUsersOnly = "churned_users_only"
            case code
            case existingMembershipsOnly = "existing_memberships_only"
            case expiresAt = "expires_at"
            case newUsersOnly = "new_users_only"
            case onePerCustomer = "one_per_customer"
            case planIds = "plan_ids"
            case productId = "product_id"
            case promoDurationMonths = "promo_duration_months"
            case promoType = "promo_type"
            case stock
            case unlimitedStock = "unlimited_stock"
        }
    }
}