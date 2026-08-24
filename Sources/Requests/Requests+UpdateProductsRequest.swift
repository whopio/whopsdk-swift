import Foundation

extension Requests {
    public struct UpdateProductsRequest: Codable, Hashable, Sendable {
        /// A wide image for the product, shown on the product page and on listing cards. Pass `{ id }` for an existing attachment or `{ direct_upload_id }` for a completed direct upload; `null` removes it.
        public let bannerImage: Nullable<UpdateProductsRequestBannerImage>?
        /// A written description displayed on the product page.
        public let description: Nullable<String>?
        /// A short marketing headline for the product page.
        public let headline: Nullable<String>?
        /// Labels used to group products into collections. Replaces the existing labels. Send an empty array to clear them.
        public let labels: Nullable<[String]>?
        /// Custom key-value pairs to store on the product.
        public let metadata: Nullable<[String: JSONValue]>?
        /// The unique identifier of the tax classification code. See the available [product categories](https://docs.numeral.com/essentials/product-categories).
        public let productTaxCodeId: Nullable<String>?
        /// Whether to send an automated welcome message via support chat when a user joins this product.
        public let sendWelcomeMessage: Nullable<Bool>?
        /// The display name of the product.
        public let title: String?
        /// Whether the product is visible to customers.
        public let visibility: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            bannerImage: Nullable<UpdateProductsRequestBannerImage>? = nil,
            description: Nullable<String>? = nil,
            headline: Nullable<String>? = nil,
            labels: Nullable<[String]>? = nil,
            metadata: Nullable<[String: JSONValue]>? = nil,
            productTaxCodeId: Nullable<String>? = nil,
            sendWelcomeMessage: Nullable<Bool>? = nil,
            title: String? = nil,
            visibility: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.bannerImage = bannerImage
            self.description = description
            self.headline = headline
            self.labels = labels
            self.metadata = metadata
            self.productTaxCodeId = productTaxCodeId
            self.sendWelcomeMessage = sendWelcomeMessage
            self.title = title
            self.visibility = visibility
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.bannerImage = try container.decodeNullableIfPresent(UpdateProductsRequestBannerImage.self, forKey: .bannerImage)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.headline = try container.decodeNullableIfPresent(String.self, forKey: .headline)
            self.labels = try container.decodeNullableIfPresent([String].self, forKey: .labels)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.productTaxCodeId = try container.decodeNullableIfPresent(String.self, forKey: .productTaxCodeId)
            self.sendWelcomeMessage = try container.decodeNullableIfPresent(Bool.self, forKey: .sendWelcomeMessage)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.visibility = try container.decodeIfPresent(String.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.bannerImage, forKey: .bannerImage)
            try container.encodeNullableIfPresent(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.headline, forKey: .headline)
            try container.encodeNullableIfPresent(self.labels, forKey: .labels)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.productTaxCodeId, forKey: .productTaxCodeId)
            try container.encodeNullableIfPresent(self.sendWelcomeMessage, forKey: .sendWelcomeMessage)
            try container.encodeIfPresent(self.title, forKey: .title)
            try container.encodeIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case bannerImage = "banner_image"
            case description
            case headline
            case labels
            case metadata
            case productTaxCodeId = "product_tax_code_id"
            case sendWelcomeMessage = "send_welcome_message"
            case title
            case visibility
        }
    }
}