import Foundation

/// Pass this object to create a new product for this plan. We will use the product external identifier to find or create an existing product.
public struct CreatePaymentsRequestZeroPlanProduct: Codable, Hashable, Sendable {
    /// Whether or not to collect shipping information at checkout from the customer.
    public let collectShippingAddress: Nullable<Bool>?
    /// The custom statement descriptor for the product i.e. WHOP*SPORTS, must be between 5 and 22 characters, contain at least one letter, and not contain any of the following characters: <, >, \, ', "
    public let customStatementDescriptor: Nullable<String>?
    /// A written description of the product.
    public let description: Nullable<String>?
    /// A unique ID used to find or create a product. When provided during creation, we will look for an existing product with this external identifier — if found, it will be updated; otherwise, a new product will be created.
    public let externalIdentifier: String
    /// The percentage of the revenue that goes to the global affiliate program.
    public let globalAffiliatePercentage: Nullable<Double>?
    /// The status of the global affiliate program for this product.
    public let globalAffiliateStatus: Nullable<GlobalAffiliateStatuses>?
    /// The headline of the product.
    public let headline: Nullable<String>?
    /// The ID of the product tax code to apply to this product.
    public let productTaxCodeId: Nullable<String>?
    /// The URL to redirect the customer to after a purchase.
    public let redirectPurchaseUrl: Nullable<String>?
    /// The route of the product.
    public let route: Nullable<String>?
    /// The title of the product.
    public let title: String
    /// This product will/will not be displayed publicly - default hidden.
    public let visibility: Nullable<Visibility>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        collectShippingAddress: Nullable<Bool>? = nil,
        customStatementDescriptor: Nullable<String>? = nil,
        description: Nullable<String>? = nil,
        externalIdentifier: String,
        globalAffiliatePercentage: Nullable<Double>? = nil,
        globalAffiliateStatus: Nullable<GlobalAffiliateStatuses>? = nil,
        headline: Nullable<String>? = nil,
        productTaxCodeId: Nullable<String>? = nil,
        redirectPurchaseUrl: Nullable<String>? = nil,
        route: Nullable<String>? = nil,
        title: String,
        visibility: Nullable<Visibility>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.collectShippingAddress = collectShippingAddress
        self.customStatementDescriptor = customStatementDescriptor
        self.description = description
        self.externalIdentifier = externalIdentifier
        self.globalAffiliatePercentage = globalAffiliatePercentage
        self.globalAffiliateStatus = globalAffiliateStatus
        self.headline = headline
        self.productTaxCodeId = productTaxCodeId
        self.redirectPurchaseUrl = redirectPurchaseUrl
        self.route = route
        self.title = title
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.collectShippingAddress = try container.decodeNullableIfPresent(Bool.self, forKey: .collectShippingAddress)
        self.customStatementDescriptor = try container.decodeNullableIfPresent(String.self, forKey: .customStatementDescriptor)
        self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
        self.externalIdentifier = try container.decode(String.self, forKey: .externalIdentifier)
        self.globalAffiliatePercentage = try container.decodeNullableIfPresent(Double.self, forKey: .globalAffiliatePercentage)
        self.globalAffiliateStatus = try container.decodeNullableIfPresent(GlobalAffiliateStatuses.self, forKey: .globalAffiliateStatus)
        self.headline = try container.decodeNullableIfPresent(String.self, forKey: .headline)
        self.productTaxCodeId = try container.decodeNullableIfPresent(String.self, forKey: .productTaxCodeId)
        self.redirectPurchaseUrl = try container.decodeNullableIfPresent(String.self, forKey: .redirectPurchaseUrl)
        self.route = try container.decodeNullableIfPresent(String.self, forKey: .route)
        self.title = try container.decode(String.self, forKey: .title)
        self.visibility = try container.decodeNullableIfPresent(Visibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.collectShippingAddress, forKey: .collectShippingAddress)
        try container.encodeNullableIfPresent(self.customStatementDescriptor, forKey: .customStatementDescriptor)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encode(self.externalIdentifier, forKey: .externalIdentifier)
        try container.encodeNullableIfPresent(self.globalAffiliatePercentage, forKey: .globalAffiliatePercentage)
        try container.encodeNullableIfPresent(self.globalAffiliateStatus, forKey: .globalAffiliateStatus)
        try container.encodeNullableIfPresent(self.headline, forKey: .headline)
        try container.encodeNullableIfPresent(self.productTaxCodeId, forKey: .productTaxCodeId)
        try container.encodeNullableIfPresent(self.redirectPurchaseUrl, forKey: .redirectPurchaseUrl)
        try container.encodeNullableIfPresent(self.route, forKey: .route)
        try container.encode(self.title, forKey: .title)
        try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case collectShippingAddress = "collect_shipping_address"
        case customStatementDescriptor = "custom_statement_descriptor"
        case description
        case externalIdentifier = "external_identifier"
        case globalAffiliatePercentage = "global_affiliate_percentage"
        case globalAffiliateStatus = "global_affiliate_status"
        case headline
        case productTaxCodeId = "product_tax_code_id"
        case redirectPurchaseUrl = "redirect_purchase_url"
        case route
        case title
        case visibility
    }
}