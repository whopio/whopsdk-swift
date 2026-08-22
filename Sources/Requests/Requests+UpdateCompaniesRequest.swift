import Foundation

extension Requests {
    public struct UpdateCompaniesRequest: Codable, Hashable, Sendable {
        /// Whether prospective affiliates must submit an application before they can promote this company.
        public let affiliateApplicationRequired: Nullable<Bool>?
        /// Guidelines and instructions shown to affiliates explaining how to promote this company's products.
        public let affiliateInstructions: Nullable<String>?
        /// The company's banner image. Accepts PNG or JPEG format.
        public let bannerImage: Nullable<UpdateCompaniesRequestBannerImage>?
        /// A promotional pitch displayed to potential customers on the company's store page.
        public let description: Nullable<String>?
        /// The ID of the product to feature on this company's affiliate page. Pass null to clear.
        public let featuredAffiliateProductId: Nullable<String>?
        /// The company's logo image. Accepts PNG, JPEG, or GIF format.
        public let logo: Nullable<UpdateCompaniesRequestLogo>?
        /// The unique URL slug for the company's store page. Must be lowercase and can include hyphens (e.g., 'my-company'). If not provided, the route will remain unchanged.
        public let route: Nullable<String>?
        /// Whether Whop sends transactional emails (receipts, renewals, cancelations) to customers on behalf of this company.
        public let sendCustomerEmails: Nullable<Bool>?
        /// The social media links to display on the company's store page. Pass the full list of desired social links — any existing links not included will be removed.
        public let socialLinks: Nullable<[UpdateCompaniesRequestSocialLinksItem]>?
        /// The target audience for this company (e.g., 'beginner day traders aged 18-25 looking to learn options').
        public let targetAudience: Nullable<String>?
        /// The display name of the company shown to customers.
        public let title: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            affiliateApplicationRequired: Nullable<Bool>? = nil,
            affiliateInstructions: Nullable<String>? = nil,
            bannerImage: Nullable<UpdateCompaniesRequestBannerImage>? = nil,
            description: Nullable<String>? = nil,
            featuredAffiliateProductId: Nullable<String>? = nil,
            logo: Nullable<UpdateCompaniesRequestLogo>? = nil,
            route: Nullable<String>? = nil,
            sendCustomerEmails: Nullable<Bool>? = nil,
            socialLinks: Nullable<[UpdateCompaniesRequestSocialLinksItem]>? = nil,
            targetAudience: Nullable<String>? = nil,
            title: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.affiliateApplicationRequired = affiliateApplicationRequired
            self.affiliateInstructions = affiliateInstructions
            self.bannerImage = bannerImage
            self.description = description
            self.featuredAffiliateProductId = featuredAffiliateProductId
            self.logo = logo
            self.route = route
            self.sendCustomerEmails = sendCustomerEmails
            self.socialLinks = socialLinks
            self.targetAudience = targetAudience
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.affiliateApplicationRequired = try container.decodeNullableIfPresent(Bool.self, forKey: .affiliateApplicationRequired)
            self.affiliateInstructions = try container.decodeNullableIfPresent(String.self, forKey: .affiliateInstructions)
            self.bannerImage = try container.decodeNullableIfPresent(UpdateCompaniesRequestBannerImage.self, forKey: .bannerImage)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.featuredAffiliateProductId = try container.decodeNullableIfPresent(String.self, forKey: .featuredAffiliateProductId)
            self.logo = try container.decodeNullableIfPresent(UpdateCompaniesRequestLogo.self, forKey: .logo)
            self.route = try container.decodeNullableIfPresent(String.self, forKey: .route)
            self.sendCustomerEmails = try container.decodeNullableIfPresent(Bool.self, forKey: .sendCustomerEmails)
            self.socialLinks = try container.decodeNullableIfPresent([UpdateCompaniesRequestSocialLinksItem].self, forKey: .socialLinks)
            self.targetAudience = try container.decodeNullableIfPresent(String.self, forKey: .targetAudience)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.affiliateApplicationRequired, forKey: .affiliateApplicationRequired)
            try container.encodeNullableIfPresent(self.affiliateInstructions, forKey: .affiliateInstructions)
            try container.encodeNullableIfPresent(self.bannerImage, forKey: .bannerImage)
            try container.encodeNullableIfPresent(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.featuredAffiliateProductId, forKey: .featuredAffiliateProductId)
            try container.encodeNullableIfPresent(self.logo, forKey: .logo)
            try container.encodeNullableIfPresent(self.route, forKey: .route)
            try container.encodeNullableIfPresent(self.sendCustomerEmails, forKey: .sendCustomerEmails)
            try container.encodeNullableIfPresent(self.socialLinks, forKey: .socialLinks)
            try container.encodeNullableIfPresent(self.targetAudience, forKey: .targetAudience)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case affiliateApplicationRequired = "affiliate_application_required"
            case affiliateInstructions = "affiliate_instructions"
            case bannerImage = "banner_image"
            case description
            case featuredAffiliateProductId = "featured_affiliate_product_id"
            case logo
            case route
            case sendCustomerEmails = "send_customer_emails"
            case socialLinks = "social_links"
            case targetAudience = "target_audience"
            case title
        }
    }
}