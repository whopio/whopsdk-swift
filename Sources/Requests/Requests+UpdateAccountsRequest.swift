import Foundation

extension Requests {
    public struct UpdateAccountsRequest: Codable, Hashable, Sendable {
        /// Whether prospective affiliates must submit an application before promoting this account.
        public let affiliateApplicationRequired: Bool?
        /// Guidelines shown to affiliates promoting this account.
        public let affiliateInstructions: Nullable<String>?
        /// Account banner image, used as the cover photo when creating a Whop-managed Facebook page. Image files up to 10 MB, except `image/gif`. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file).
        public let bannerImage: Nullable<UpdateAccountsRequestBannerImage>?
        /// Account business address used to calculate tax. A complete address in a supported country is required when `tax_remitted_by` is `self`.
        public let businessAddress: UpdateAccountsRequestBusinessAddress?
        /// The legal business name used with the account's tax address.
        public let businessName: Nullable<String>?
        /// High-level business category for the account. See the [business types and industries glossary](/api-reference/beta/accounts/account#business-types-and-industries-glossary) for valid values.
        public let businessType: Nullable<UpdateAccountsRequestBusinessType>?
        /// Whether checkout shows a VAT/tax ID field for buyers to optionally enter. Does not require a VAT ID to purchase.
        public let collectVatId: Bool?
        /// Country where the account is located.
        public let country: Nullable<String>?
        /// Account promotional description. When creating a Whop-managed Facebook page, it is truncated to 155 characters and used as the About text.
        public let description: Nullable<String>?
        /// The ID of the product to feature for affiliates. Pass `null` to clear.
        public let featuredAffiliateProductId: Nullable<String>?
        /// Public account home page preferences.
        public let homePreferences: [UpdateAccountsRequestHomePreferencesItem]?
        /// Account industry group. See the [business types and industries glossary](/api-reference/beta/accounts/account#business-types-and-industries-glossary) for valid values.
        public let industryGroup: Nullable<UpdateAccountsRequestIndustryGroup>?
        /// Specific industry vertical for the account. See the [business types and industries glossary](/api-reference/beta/accounts/account#business-types-and-industries-glossary) for valid values.
        public let industryType: Nullable<String>?
        /// Prefix used for account invoices.
        public let invoicePrefix: Nullable<String>?
        /// Account logo, used as the profile picture when creating a Whop-managed Facebook page. Image files up to 5 MB. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file).
        public let logo: Nullable<UpdateAccountsRequestLogo>?
        /// Arbitrary key/value metadata to store on the account.
        public let metadata: [String: JSONValue]?
        /// The type of onboarding the account has completed.
        public let onboardingType: Nullable<UpdateAccountsRequestOnboardingType>?
        /// Open Graph preview media used when the account is shared. Image and video files up to 5 MB. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file).
        public let opengraphImage: Nullable<UpdateAccountsRequestOpengraphImage>?
        /// The account Open Graph image variant.
        public let opengraphImageVariant: Nullable<UpdateAccountsRequestOpengraphImageVariant>?
        /// The description of the business type when business_type is other.
        public let otherBusinessDescription: Nullable<String>?
        /// The description of the industry type when industry_type is other.
        public let otherIndustryDescription: Nullable<String>?
        /// ID of the tax classification code applied by default to the account's products. See the available [product categories](https://docs.numeral.com/essentials/product-categories).
        public let productTaxCodeId: Nullable<String>?
        /// Whether the account requires authorized users to have two-factor authentication enabled.
        public let require2Fa: Bool?
        /// The unique URL slug for the account.
        public let route: Nullable<String>?
        /// Whether Whop sends transactional emails to customers on behalf of this account.
        public let sendCustomerEmails: Bool?
        /// Whether the account appears in joined whops on other accounts.
        public let showJoinedWhops: Bool?
        /// Whether reviews are displayed on direct-to-consumer product pages.
        public let showReviewsDtc: Bool?
        /// Whether the account shows users in the user directory.
        public let showUserDirectory: Bool?
        /// The full list of social links to display for the account.
        public let socialLinks: [[String: JSONValue]]?
        /// Account store page display configuration.
        public let storePageConfig: Nullable<UpdateAccountsRequestStorePageConfig>?
        /// The target audience for this account.
        public let targetAudience: Nullable<String>?
        /// US state codes (50 states plus `DC`) where the account collects tax. Replaces the full set on update. Only settable when `tax_remitted_by` is `self`.
        public let taxCollectionEnabledStates: [UpdateAccountsRequestTaxCollectionEnabledStatesItem]?
        /// Account tax/VAT registrations to add or update. When `tax_remitted_by` is `self`, tax is calculated and collected only in the countries where the account holds a registration.
        public let taxIdentifiers: [UpdateAccountsRequestTaxIdentifiersItem]?
        /// Determines whether Whop or the account calculates and remits tax. The account must provide a supported-country business address when it self-remits.
        public let taxRemittedBy: UpdateAccountsRequestTaxRemittedBy?
        /// Determines whether tax is included in the listed price or added at checkout.
        public let taxType: UpdateAccountsRequestTaxType?
        /// Account-level 3D Secure behavior. Set `mandate_challenge` to require cardholder verification on supported card payments, or `null` to use the standard checkout flow.
        public let threeDsLevel: Nullable<UpdateAccountsRequestThreeDsLevel>?
        /// The display name of the account.
        public let title: Nullable<String>?
        /// Whether the account uses its logo as the fallback Open Graph image.
        public let useLogoAsOpengraphImageFallback: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            affiliateApplicationRequired: Bool? = nil,
            affiliateInstructions: Nullable<String>? = nil,
            bannerImage: Nullable<UpdateAccountsRequestBannerImage>? = nil,
            businessAddress: UpdateAccountsRequestBusinessAddress? = nil,
            businessName: Nullable<String>? = nil,
            businessType: Nullable<UpdateAccountsRequestBusinessType>? = nil,
            collectVatId: Bool? = nil,
            country: Nullable<String>? = nil,
            description: Nullable<String>? = nil,
            featuredAffiliateProductId: Nullable<String>? = nil,
            homePreferences: [UpdateAccountsRequestHomePreferencesItem]? = nil,
            industryGroup: Nullable<UpdateAccountsRequestIndustryGroup>? = nil,
            industryType: Nullable<String>? = nil,
            invoicePrefix: Nullable<String>? = nil,
            logo: Nullable<UpdateAccountsRequestLogo>? = nil,
            metadata: [String: JSONValue]? = nil,
            onboardingType: Nullable<UpdateAccountsRequestOnboardingType>? = nil,
            opengraphImage: Nullable<UpdateAccountsRequestOpengraphImage>? = nil,
            opengraphImageVariant: Nullable<UpdateAccountsRequestOpengraphImageVariant>? = nil,
            otherBusinessDescription: Nullable<String>? = nil,
            otherIndustryDescription: Nullable<String>? = nil,
            productTaxCodeId: Nullable<String>? = nil,
            require2Fa: Bool? = nil,
            route: Nullable<String>? = nil,
            sendCustomerEmails: Bool? = nil,
            showJoinedWhops: Bool? = nil,
            showReviewsDtc: Bool? = nil,
            showUserDirectory: Bool? = nil,
            socialLinks: [[String: JSONValue]]? = nil,
            storePageConfig: Nullable<UpdateAccountsRequestStorePageConfig>? = nil,
            targetAudience: Nullable<String>? = nil,
            taxCollectionEnabledStates: [UpdateAccountsRequestTaxCollectionEnabledStatesItem]? = nil,
            taxIdentifiers: [UpdateAccountsRequestTaxIdentifiersItem]? = nil,
            taxRemittedBy: UpdateAccountsRequestTaxRemittedBy? = nil,
            taxType: UpdateAccountsRequestTaxType? = nil,
            threeDsLevel: Nullable<UpdateAccountsRequestThreeDsLevel>? = nil,
            title: Nullable<String>? = nil,
            useLogoAsOpengraphImageFallback: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.affiliateApplicationRequired = affiliateApplicationRequired
            self.affiliateInstructions = affiliateInstructions
            self.bannerImage = bannerImage
            self.businessAddress = businessAddress
            self.businessName = businessName
            self.businessType = businessType
            self.collectVatId = collectVatId
            self.country = country
            self.description = description
            self.featuredAffiliateProductId = featuredAffiliateProductId
            self.homePreferences = homePreferences
            self.industryGroup = industryGroup
            self.industryType = industryType
            self.invoicePrefix = invoicePrefix
            self.logo = logo
            self.metadata = metadata
            self.onboardingType = onboardingType
            self.opengraphImage = opengraphImage
            self.opengraphImageVariant = opengraphImageVariant
            self.otherBusinessDescription = otherBusinessDescription
            self.otherIndustryDescription = otherIndustryDescription
            self.productTaxCodeId = productTaxCodeId
            self.require2Fa = require2Fa
            self.route = route
            self.sendCustomerEmails = sendCustomerEmails
            self.showJoinedWhops = showJoinedWhops
            self.showReviewsDtc = showReviewsDtc
            self.showUserDirectory = showUserDirectory
            self.socialLinks = socialLinks
            self.storePageConfig = storePageConfig
            self.targetAudience = targetAudience
            self.taxCollectionEnabledStates = taxCollectionEnabledStates
            self.taxIdentifiers = taxIdentifiers
            self.taxRemittedBy = taxRemittedBy
            self.taxType = taxType
            self.threeDsLevel = threeDsLevel
            self.title = title
            self.useLogoAsOpengraphImageFallback = useLogoAsOpengraphImageFallback
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.affiliateApplicationRequired = try container.decodeIfPresent(Bool.self, forKey: .affiliateApplicationRequired)
            self.affiliateInstructions = try container.decodeNullableIfPresent(String.self, forKey: .affiliateInstructions)
            self.bannerImage = try container.decodeNullableIfPresent(UpdateAccountsRequestBannerImage.self, forKey: .bannerImage)
            self.businessAddress = try container.decodeIfPresent(UpdateAccountsRequestBusinessAddress.self, forKey: .businessAddress)
            self.businessName = try container.decodeNullableIfPresent(String.self, forKey: .businessName)
            self.businessType = try container.decodeNullableIfPresent(UpdateAccountsRequestBusinessType.self, forKey: .businessType)
            self.collectVatId = try container.decodeIfPresent(Bool.self, forKey: .collectVatId)
            self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.featuredAffiliateProductId = try container.decodeNullableIfPresent(String.self, forKey: .featuredAffiliateProductId)
            self.homePreferences = try container.decodeIfPresent([UpdateAccountsRequestHomePreferencesItem].self, forKey: .homePreferences)
            self.industryGroup = try container.decodeNullableIfPresent(UpdateAccountsRequestIndustryGroup.self, forKey: .industryGroup)
            self.industryType = try container.decodeNullableIfPresent(String.self, forKey: .industryType)
            self.invoicePrefix = try container.decodeNullableIfPresent(String.self, forKey: .invoicePrefix)
            self.logo = try container.decodeNullableIfPresent(UpdateAccountsRequestLogo.self, forKey: .logo)
            self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
            self.onboardingType = try container.decodeNullableIfPresent(UpdateAccountsRequestOnboardingType.self, forKey: .onboardingType)
            self.opengraphImage = try container.decodeNullableIfPresent(UpdateAccountsRequestOpengraphImage.self, forKey: .opengraphImage)
            self.opengraphImageVariant = try container.decodeNullableIfPresent(UpdateAccountsRequestOpengraphImageVariant.self, forKey: .opengraphImageVariant)
            self.otherBusinessDescription = try container.decodeNullableIfPresent(String.self, forKey: .otherBusinessDescription)
            self.otherIndustryDescription = try container.decodeNullableIfPresent(String.self, forKey: .otherIndustryDescription)
            self.productTaxCodeId = try container.decodeNullableIfPresent(String.self, forKey: .productTaxCodeId)
            self.require2Fa = try container.decodeIfPresent(Bool.self, forKey: .require2Fa)
            self.route = try container.decodeNullableIfPresent(String.self, forKey: .route)
            self.sendCustomerEmails = try container.decodeIfPresent(Bool.self, forKey: .sendCustomerEmails)
            self.showJoinedWhops = try container.decodeIfPresent(Bool.self, forKey: .showJoinedWhops)
            self.showReviewsDtc = try container.decodeIfPresent(Bool.self, forKey: .showReviewsDtc)
            self.showUserDirectory = try container.decodeIfPresent(Bool.self, forKey: .showUserDirectory)
            self.socialLinks = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .socialLinks)
            self.storePageConfig = try container.decodeNullableIfPresent(UpdateAccountsRequestStorePageConfig.self, forKey: .storePageConfig)
            self.targetAudience = try container.decodeNullableIfPresent(String.self, forKey: .targetAudience)
            self.taxCollectionEnabledStates = try container.decodeIfPresent([UpdateAccountsRequestTaxCollectionEnabledStatesItem].self, forKey: .taxCollectionEnabledStates)
            self.taxIdentifiers = try container.decodeIfPresent([UpdateAccountsRequestTaxIdentifiersItem].self, forKey: .taxIdentifiers)
            self.taxRemittedBy = try container.decodeIfPresent(UpdateAccountsRequestTaxRemittedBy.self, forKey: .taxRemittedBy)
            self.taxType = try container.decodeIfPresent(UpdateAccountsRequestTaxType.self, forKey: .taxType)
            self.threeDsLevel = try container.decodeNullableIfPresent(UpdateAccountsRequestThreeDsLevel.self, forKey: .threeDsLevel)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.useLogoAsOpengraphImageFallback = try container.decodeIfPresent(Bool.self, forKey: .useLogoAsOpengraphImageFallback)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.affiliateApplicationRequired, forKey: .affiliateApplicationRequired)
            try container.encodeNullableIfPresent(self.affiliateInstructions, forKey: .affiliateInstructions)
            try container.encodeNullableIfPresent(self.bannerImage, forKey: .bannerImage)
            try container.encodeIfPresent(self.businessAddress, forKey: .businessAddress)
            try container.encodeNullableIfPresent(self.businessName, forKey: .businessName)
            try container.encodeNullableIfPresent(self.businessType, forKey: .businessType)
            try container.encodeIfPresent(self.collectVatId, forKey: .collectVatId)
            try container.encodeNullableIfPresent(self.country, forKey: .country)
            try container.encodeNullableIfPresent(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.featuredAffiliateProductId, forKey: .featuredAffiliateProductId)
            try container.encodeIfPresent(self.homePreferences, forKey: .homePreferences)
            try container.encodeNullableIfPresent(self.industryGroup, forKey: .industryGroup)
            try container.encodeNullableIfPresent(self.industryType, forKey: .industryType)
            try container.encodeNullableIfPresent(self.invoicePrefix, forKey: .invoicePrefix)
            try container.encodeNullableIfPresent(self.logo, forKey: .logo)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.onboardingType, forKey: .onboardingType)
            try container.encodeNullableIfPresent(self.opengraphImage, forKey: .opengraphImage)
            try container.encodeNullableIfPresent(self.opengraphImageVariant, forKey: .opengraphImageVariant)
            try container.encodeNullableIfPresent(self.otherBusinessDescription, forKey: .otherBusinessDescription)
            try container.encodeNullableIfPresent(self.otherIndustryDescription, forKey: .otherIndustryDescription)
            try container.encodeNullableIfPresent(self.productTaxCodeId, forKey: .productTaxCodeId)
            try container.encodeIfPresent(self.require2Fa, forKey: .require2Fa)
            try container.encodeNullableIfPresent(self.route, forKey: .route)
            try container.encodeIfPresent(self.sendCustomerEmails, forKey: .sendCustomerEmails)
            try container.encodeIfPresent(self.showJoinedWhops, forKey: .showJoinedWhops)
            try container.encodeIfPresent(self.showReviewsDtc, forKey: .showReviewsDtc)
            try container.encodeIfPresent(self.showUserDirectory, forKey: .showUserDirectory)
            try container.encodeIfPresent(self.socialLinks, forKey: .socialLinks)
            try container.encodeNullableIfPresent(self.storePageConfig, forKey: .storePageConfig)
            try container.encodeNullableIfPresent(self.targetAudience, forKey: .targetAudience)
            try container.encodeIfPresent(self.taxCollectionEnabledStates, forKey: .taxCollectionEnabledStates)
            try container.encodeIfPresent(self.taxIdentifiers, forKey: .taxIdentifiers)
            try container.encodeIfPresent(self.taxRemittedBy, forKey: .taxRemittedBy)
            try container.encodeIfPresent(self.taxType, forKey: .taxType)
            try container.encodeNullableIfPresent(self.threeDsLevel, forKey: .threeDsLevel)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encodeIfPresent(self.useLogoAsOpengraphImageFallback, forKey: .useLogoAsOpengraphImageFallback)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case affiliateApplicationRequired = "affiliate_application_required"
            case affiliateInstructions = "affiliate_instructions"
            case bannerImage = "banner_image"
            case businessAddress = "business_address"
            case businessName = "business_name"
            case businessType = "business_type"
            case collectVatId = "collect_vat_id"
            case country
            case description
            case featuredAffiliateProductId = "featured_affiliate_product_id"
            case homePreferences = "home_preferences"
            case industryGroup = "industry_group"
            case industryType = "industry_type"
            case invoicePrefix = "invoice_prefix"
            case logo
            case metadata
            case onboardingType = "onboarding_type"
            case opengraphImage = "opengraph_image"
            case opengraphImageVariant = "opengraph_image_variant"
            case otherBusinessDescription = "other_business_description"
            case otherIndustryDescription = "other_industry_description"
            case productTaxCodeId = "product_tax_code_id"
            case require2Fa = "require_2fa"
            case route
            case sendCustomerEmails = "send_customer_emails"
            case showJoinedWhops = "show_joined_whops"
            case showReviewsDtc = "show_reviews_dtc"
            case showUserDirectory = "show_user_directory"
            case socialLinks = "social_links"
            case storePageConfig = "store_page_config"
            case targetAudience = "target_audience"
            case taxCollectionEnabledStates = "tax_collection_enabled_states"
            case taxIdentifiers = "tax_identifiers"
            case taxRemittedBy = "tax_remitted_by"
            case taxType = "tax_type"
            case threeDsLevel = "three_ds_level"
            case title
            case useLogoAsOpengraphImageFallback = "use_logo_as_opengraph_image_fallback"
        }
    }
}