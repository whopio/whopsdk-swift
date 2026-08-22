import Foundation

extension Requests {
    public struct CreateProductsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the account to create this product for.
        public let accountId: String?
        /// Whether to collect a shipping address at checkout.
        public let collectShippingAddress: Nullable<Bool>?
        /// The call-to-action button label.
        public let customCta: Nullable<CreateProductsRequestCustomCta>?
        /// A URL the call-to-action button links to.
        public let customCtaUrl: Nullable<String>?
        /// Custom bank statement descriptor. Must start with WHOP*.
        public let customStatementDescriptor: Nullable<String>?
        /// A written description displayed on the product page.
        public let description: Nullable<String>?
        /// The commission rate affiliates earn.
        public let globalAffiliatePercentage: Nullable<Double>?
        /// The enrollment status in the global affiliate program.
        public let globalAffiliateStatus: CreateProductsRequestGlobalAffiliateStatus?
        /// A short marketing headline for the product page.
        public let headline: Nullable<String>?
        /// Labels used to group products into collections. Stored lowercased and de-duplicated. Maximum 20 labels, 50 characters each.
        public let labels: Nullable<[String]>?
        /// The commission rate members earn.
        public let memberAffiliatePercentage: Nullable<Double>?
        /// The enrollment status in the member affiliate program.
        public let memberAffiliateStatus: CreateProductsRequestMemberAffiliateStatus?
        /// Custom key-value pairs to store on the product.
        public let metadata: Nullable<[String: JSONValue]>?
        /// The unique identifier of the tax classification code. See the available [product categories](https://docs.numeral.com/essentials/product-categories).
        public let productTaxCodeId: Nullable<String>?
        /// A URL to redirect the customer to after purchase.
        public let redirectPurchaseUrl: Nullable<String>?
        /// The URL slug for the product's public link.
        public let route: Nullable<String>?
        /// Whether to send an automated welcome message via support chat when a user joins this product. Defaults to true.
        public let sendWelcomeMessage: Nullable<Bool>?
        /// The display name of the product. Maximum 80 characters.
        public let title: String
        /// Whether the product is visible to customers.
        public let visibility: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            collectShippingAddress: Nullable<Bool>? = nil,
            customCta: Nullable<CreateProductsRequestCustomCta>? = nil,
            customCtaUrl: Nullable<String>? = nil,
            customStatementDescriptor: Nullable<String>? = nil,
            description: Nullable<String>? = nil,
            globalAffiliatePercentage: Nullable<Double>? = nil,
            globalAffiliateStatus: CreateProductsRequestGlobalAffiliateStatus? = nil,
            headline: Nullable<String>? = nil,
            labels: Nullable<[String]>? = nil,
            memberAffiliatePercentage: Nullable<Double>? = nil,
            memberAffiliateStatus: CreateProductsRequestMemberAffiliateStatus? = nil,
            metadata: Nullable<[String: JSONValue]>? = nil,
            productTaxCodeId: Nullable<String>? = nil,
            redirectPurchaseUrl: Nullable<String>? = nil,
            route: Nullable<String>? = nil,
            sendWelcomeMessage: Nullable<Bool>? = nil,
            title: String,
            visibility: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.collectShippingAddress = collectShippingAddress
            self.customCta = customCta
            self.customCtaUrl = customCtaUrl
            self.customStatementDescriptor = customStatementDescriptor
            self.description = description
            self.globalAffiliatePercentage = globalAffiliatePercentage
            self.globalAffiliateStatus = globalAffiliateStatus
            self.headline = headline
            self.labels = labels
            self.memberAffiliatePercentage = memberAffiliatePercentage
            self.memberAffiliateStatus = memberAffiliateStatus
            self.metadata = metadata
            self.productTaxCodeId = productTaxCodeId
            self.redirectPurchaseUrl = redirectPurchaseUrl
            self.route = route
            self.sendWelcomeMessage = sendWelcomeMessage
            self.title = title
            self.visibility = visibility
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.collectShippingAddress = try container.decodeNullableIfPresent(Bool.self, forKey: .collectShippingAddress)
            self.customCta = try container.decodeNullableIfPresent(CreateProductsRequestCustomCta.self, forKey: .customCta)
            self.customCtaUrl = try container.decodeNullableIfPresent(String.self, forKey: .customCtaUrl)
            self.customStatementDescriptor = try container.decodeNullableIfPresent(String.self, forKey: .customStatementDescriptor)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.globalAffiliatePercentage = try container.decodeNullableIfPresent(Double.self, forKey: .globalAffiliatePercentage)
            self.globalAffiliateStatus = try container.decodeIfPresent(CreateProductsRequestGlobalAffiliateStatus.self, forKey: .globalAffiliateStatus)
            self.headline = try container.decodeNullableIfPresent(String.self, forKey: .headline)
            self.labels = try container.decodeNullableIfPresent([String].self, forKey: .labels)
            self.memberAffiliatePercentage = try container.decodeNullableIfPresent(Double.self, forKey: .memberAffiliatePercentage)
            self.memberAffiliateStatus = try container.decodeIfPresent(CreateProductsRequestMemberAffiliateStatus.self, forKey: .memberAffiliateStatus)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.productTaxCodeId = try container.decodeNullableIfPresent(String.self, forKey: .productTaxCodeId)
            self.redirectPurchaseUrl = try container.decodeNullableIfPresent(String.self, forKey: .redirectPurchaseUrl)
            self.route = try container.decodeNullableIfPresent(String.self, forKey: .route)
            self.sendWelcomeMessage = try container.decodeNullableIfPresent(Bool.self, forKey: .sendWelcomeMessage)
            self.title = try container.decode(String.self, forKey: .title)
            self.visibility = try container.decodeIfPresent(String.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.collectShippingAddress, forKey: .collectShippingAddress)
            try container.encodeNullableIfPresent(self.customCta, forKey: .customCta)
            try container.encodeNullableIfPresent(self.customCtaUrl, forKey: .customCtaUrl)
            try container.encodeNullableIfPresent(self.customStatementDescriptor, forKey: .customStatementDescriptor)
            try container.encodeNullableIfPresent(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.globalAffiliatePercentage, forKey: .globalAffiliatePercentage)
            try container.encodeIfPresent(self.globalAffiliateStatus, forKey: .globalAffiliateStatus)
            try container.encodeNullableIfPresent(self.headline, forKey: .headline)
            try container.encodeNullableIfPresent(self.labels, forKey: .labels)
            try container.encodeNullableIfPresent(self.memberAffiliatePercentage, forKey: .memberAffiliatePercentage)
            try container.encodeIfPresent(self.memberAffiliateStatus, forKey: .memberAffiliateStatus)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.productTaxCodeId, forKey: .productTaxCodeId)
            try container.encodeNullableIfPresent(self.redirectPurchaseUrl, forKey: .redirectPurchaseUrl)
            try container.encodeNullableIfPresent(self.route, forKey: .route)
            try container.encodeNullableIfPresent(self.sendWelcomeMessage, forKey: .sendWelcomeMessage)
            try container.encode(self.title, forKey: .title)
            try container.encodeIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case collectShippingAddress = "collect_shipping_address"
            case customCta = "custom_cta"
            case customCtaUrl = "custom_cta_url"
            case customStatementDescriptor = "custom_statement_descriptor"
            case description
            case globalAffiliatePercentage = "global_affiliate_percentage"
            case globalAffiliateStatus = "global_affiliate_status"
            case headline
            case labels
            case memberAffiliatePercentage = "member_affiliate_percentage"
            case memberAffiliateStatus = "member_affiliate_status"
            case metadata
            case productTaxCodeId = "product_tax_code_id"
            case redirectPurchaseUrl = "redirect_purchase_url"
            case route
            case sendWelcomeMessage = "send_welcome_message"
            case title
            case visibility
        }
    }
}