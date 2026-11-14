import Foundation

/// Find or create a product by external identifier. Mutually exclusive with product_id.
public struct UpdateInvoicesRequestItemsItemVariantProduct: Codable, Hashable, Sendable {
    /// Whether to collect a shipping address at checkout.
    public let collectShippingAddress: Nullable<Bool>?
    /// Custom card statement descriptor for the product, starting with WHOP*.
    public let customStatementDescriptor: Nullable<String>?
    /// Product description.
    public let description: Nullable<String>?
    /// Your unique identifier for the product.
    public let externalIdentifier: String
    /// Percentage of revenue paid to global affiliates.
    public let globalAffiliatePercentage: Nullable<Double>?
    /// Global affiliate program status.
    public let globalAffiliateStatus: Nullable<UpdateInvoicesRequestItemsItemVariantProductGlobalAffiliateStatus>?
    /// Product headline.
    public let headline: Nullable<String>?
    /// Product tax code identifier.
    public let productTaxCodeId: Nullable<String>?
    /// Where to redirect the buyer after purchase.
    public let redirectPurchaseUrl: Nullable<String>?
    /// Product route.
    public let route: Nullable<String>?
    /// Product title.
    public let title: String
    /// Product visibility. Defaults to hidden.
    public let visibility: UpdateInvoicesRequestItemsItemVariantProductVisibility?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        collectShippingAddress: Nullable<Bool>? = nil,
        customStatementDescriptor: Nullable<String>? = nil,
        description: Nullable<String>? = nil,
        externalIdentifier: String,
        globalAffiliatePercentage: Nullable<Double>? = nil,
        globalAffiliateStatus: Nullable<UpdateInvoicesRequestItemsItemVariantProductGlobalAffiliateStatus>? = nil,
        headline: Nullable<String>? = nil,
        productTaxCodeId: Nullable<String>? = nil,
        redirectPurchaseUrl: Nullable<String>? = nil,
        route: Nullable<String>? = nil,
        title: String,
        visibility: UpdateInvoicesRequestItemsItemVariantProductVisibility? = nil,
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
        self.globalAffiliateStatus = try container.decodeNullableIfPresent(UpdateInvoicesRequestItemsItemVariantProductGlobalAffiliateStatus.self, forKey: .globalAffiliateStatus)
        self.headline = try container.decodeNullableIfPresent(String.self, forKey: .headline)
        self.productTaxCodeId = try container.decodeNullableIfPresent(String.self, forKey: .productTaxCodeId)
        self.redirectPurchaseUrl = try container.decodeNullableIfPresent(String.self, forKey: .redirectPurchaseUrl)
        self.route = try container.decodeNullableIfPresent(String.self, forKey: .route)
        self.title = try container.decode(String.self, forKey: .title)
        self.visibility = try container.decodeIfPresent(UpdateInvoicesRequestItemsItemVariantProductVisibility.self, forKey: .visibility)
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
        try container.encodeIfPresent(self.visibility, forKey: .visibility)
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