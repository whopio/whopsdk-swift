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
        /// The account's cancellation policy document. Attached to new disputes as the cancellation policy evidence, with the terms of service as the fallback. PDF only. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file), or `null` to remove it.
        public let cancellationPolicy: Nullable<UpdateAccountsRequestCancellationPolicy>?
        /// Whether checkout shows a VAT/tax ID field for buyers to optionally enter. Does not require a VAT ID to purchase.
        public let collectVatId: Bool?
        /// Country where the account is located.
        public let country: Nullable<String>?
        /// Account promotional description. When creating a Whop-managed Facebook page, it is truncated to 155 characters and used as the About text.
        public let description: Nullable<String>?
        /// Whether Whop assembles and files dispute evidence for this account. Enabling it opts into the success fee charged on disputes it wins. Requires payment:dispute. Omit to preserve the existing setting or creation default.
        public let disputeFighterEnabled: Bool?
        /// The account's end-user license agreement document. PDF only. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file), or `null` to remove it.
        public let eula: Nullable<UpdateAccountsRequestEula>?
        /// Your platform's own identifier for this subaccount. It must be unique among your subaccounts, and a duplicate returns a 409. Only the parent account can set it. Pass `null` to clear.
        public let externalId: Nullable<String>?
        /// The ID of the product to feature for affiliates. Pass `null` to clear.
        public let featuredAffiliateProductId: Nullable<String>?
        /// Public account home page preferences.
        public let homePreferences: [UpdateAccountsRequestHomePreferencesItem]?
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
        /// Whether payment orchestration is enabled for this account. Requires payout:account:update. Omit to preserve the existing setting or creation default.
        public let orchestrationEnabled: Bool?
        /// The description of the business type when business_type is other.
        public let otherBusinessDescription: Nullable<String>?
        /// The description of the industry type when industry_type is other.
        public let otherIndustryDescription: Nullable<String>?
        /// The account's privacy policy document. PDF only. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file), or `null` to remove it.
        public let privacyPolicy: Nullable<UpdateAccountsRequestPrivacyPolicy>?
        /// ID of the tax classification code applied by default to the account's products. See the available [product categories](https://docs.numeral.com/essentials/product-categories).
        public let productTaxCodeId: Nullable<String>?
        /// Whether the account requires authorized users to have two-factor authentication enabled.
        public let require2Fa: Bool?
        /// The account's return and refund policy document. Attached to new disputes as the refund policy evidence, with the terms of service as the fallback. PDF only. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file), or `null` to remove it.
        public let returnPolicy: Nullable<UpdateAccountsRequestReturnPolicy>?
        /// The unique URL slug for the account.
        public let route: Nullable<String>?
        /// Whether Whop sends transactional emails to customers on behalf of this account.
        public let sendCustomerEmails: Bool?
        /// The account's shipping policy document. Sent with physical-goods dispute evidence. PDF only. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file), or `null` to remove it.
        public let shippingPolicy: Nullable<UpdateAccountsRequestShippingPolicy>?
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
        /// Tax IDs to add to the account, or to replace when the account already has one of that type. When `tax_remitted_by` is `self`, tax outside the US is calculated and collected only in the countries where the account has a tax ID. US collection follows `tax_collection_enabled_states`.
        public let taxIdentifiers: [UpdateAccountsRequestTaxIdentifiersItem]?
        /// Determines whether Whop or the account calculates and remits tax. The account must provide a supported-country business address when it self-remits.
        public let taxRemittedBy: UpdateAccountsRequestTaxRemittedBy?
        /// Determines whether tax is included in the listed price or added at checkout.
        public let taxType: UpdateAccountsRequestTaxType?
        /// The account's terms of service document. Attached to new disputes as the cancellation policy evidence when no cancellation policy is set. PDF only. Pass a JSON object containing an `id` from [Create File](/api-reference/files/create-file), or `null` to remove it.
        public let termsOfService: Nullable<UpdateAccountsRequestTermsOfService>?
        /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. `null` uses the standard checkout flow.
        public let threeDsLevel: Nullable<UpdateAccountsRequestThreeDsLevel>?
        /// The display name of the account.
        public let title: Nullable<String>?
        /// Whether the account uses its logo as the fallback Open Graph image.
        public let useLogoAsOpengraphImageFallback: Bool?
        /// The account's business website, as an `http` or `https` URL of at most 255 characters. Also added to the account's `social_links` as a `website` entry. Pass `null` to clear the website; existing social links are left unchanged.
        public let website: Nullable<String>?
        /// Set to `true` to turn on Whop Partner mode for the account, so its team can refer businesses and the account is paid partner commission on their sales. Recorded once; `false` is rejected. Only a verified Whop Partner can turn it on.
        public let whopPartnerEnabled: Bool?
        public let industryType: JSONValue?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            affiliateApplicationRequired: Bool? = nil,
            affiliateInstructions: Nullable<String>? = nil,
            bannerImage: Nullable<UpdateAccountsRequestBannerImage>? = nil,
            businessAddress: UpdateAccountsRequestBusinessAddress? = nil,
            businessName: Nullable<String>? = nil,
            cancellationPolicy: Nullable<UpdateAccountsRequestCancellationPolicy>? = nil,
            collectVatId: Bool? = nil,
            country: Nullable<String>? = nil,
            description: Nullable<String>? = nil,
            disputeFighterEnabled: Bool? = nil,
            eula: Nullable<UpdateAccountsRequestEula>? = nil,
            externalId: Nullable<String>? = nil,
            featuredAffiliateProductId: Nullable<String>? = nil,
            homePreferences: [UpdateAccountsRequestHomePreferencesItem]? = nil,
            invoicePrefix: Nullable<String>? = nil,
            logo: Nullable<UpdateAccountsRequestLogo>? = nil,
            metadata: [String: JSONValue]? = nil,
            onboardingType: Nullable<UpdateAccountsRequestOnboardingType>? = nil,
            opengraphImage: Nullable<UpdateAccountsRequestOpengraphImage>? = nil,
            opengraphImageVariant: Nullable<UpdateAccountsRequestOpengraphImageVariant>? = nil,
            orchestrationEnabled: Bool? = nil,
            otherBusinessDescription: Nullable<String>? = nil,
            otherIndustryDescription: Nullable<String>? = nil,
            privacyPolicy: Nullable<UpdateAccountsRequestPrivacyPolicy>? = nil,
            productTaxCodeId: Nullable<String>? = nil,
            require2Fa: Bool? = nil,
            returnPolicy: Nullable<UpdateAccountsRequestReturnPolicy>? = nil,
            route: Nullable<String>? = nil,
            sendCustomerEmails: Bool? = nil,
            shippingPolicy: Nullable<UpdateAccountsRequestShippingPolicy>? = nil,
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
            termsOfService: Nullable<UpdateAccountsRequestTermsOfService>? = nil,
            threeDsLevel: Nullable<UpdateAccountsRequestThreeDsLevel>? = nil,
            title: Nullable<String>? = nil,
            useLogoAsOpengraphImageFallback: Bool? = nil,
            website: Nullable<String>? = nil,
            whopPartnerEnabled: Bool? = nil,
            industryType: JSONValue? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.affiliateApplicationRequired = affiliateApplicationRequired
            self.affiliateInstructions = affiliateInstructions
            self.bannerImage = bannerImage
            self.businessAddress = businessAddress
            self.businessName = businessName
            self.cancellationPolicy = cancellationPolicy
            self.collectVatId = collectVatId
            self.country = country
            self.description = description
            self.disputeFighterEnabled = disputeFighterEnabled
            self.eula = eula
            self.externalId = externalId
            self.featuredAffiliateProductId = featuredAffiliateProductId
            self.homePreferences = homePreferences
            self.invoicePrefix = invoicePrefix
            self.logo = logo
            self.metadata = metadata
            self.onboardingType = onboardingType
            self.opengraphImage = opengraphImage
            self.opengraphImageVariant = opengraphImageVariant
            self.orchestrationEnabled = orchestrationEnabled
            self.otherBusinessDescription = otherBusinessDescription
            self.otherIndustryDescription = otherIndustryDescription
            self.privacyPolicy = privacyPolicy
            self.productTaxCodeId = productTaxCodeId
            self.require2Fa = require2Fa
            self.returnPolicy = returnPolicy
            self.route = route
            self.sendCustomerEmails = sendCustomerEmails
            self.shippingPolicy = shippingPolicy
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
            self.termsOfService = termsOfService
            self.threeDsLevel = threeDsLevel
            self.title = title
            self.useLogoAsOpengraphImageFallback = useLogoAsOpengraphImageFallback
            self.website = website
            self.whopPartnerEnabled = whopPartnerEnabled
            self.industryType = industryType
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.affiliateApplicationRequired = try container.decodeIfPresent(Bool.self, forKey: .affiliateApplicationRequired)
            self.affiliateInstructions = try container.decodeNullableIfPresent(String.self, forKey: .affiliateInstructions)
            self.bannerImage = try container.decodeNullableIfPresent(UpdateAccountsRequestBannerImage.self, forKey: .bannerImage)
            self.businessAddress = try container.decodeIfPresent(UpdateAccountsRequestBusinessAddress.self, forKey: .businessAddress)
            self.businessName = try container.decodeNullableIfPresent(String.self, forKey: .businessName)
            self.cancellationPolicy = try container.decodeNullableIfPresent(UpdateAccountsRequestCancellationPolicy.self, forKey: .cancellationPolicy)
            self.collectVatId = try container.decodeIfPresent(Bool.self, forKey: .collectVatId)
            self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.disputeFighterEnabled = try container.decodeIfPresent(Bool.self, forKey: .disputeFighterEnabled)
            self.eula = try container.decodeNullableIfPresent(UpdateAccountsRequestEula.self, forKey: .eula)
            self.externalId = try container.decodeNullableIfPresent(String.self, forKey: .externalId)
            self.featuredAffiliateProductId = try container.decodeNullableIfPresent(String.self, forKey: .featuredAffiliateProductId)
            self.homePreferences = try container.decodeIfPresent([UpdateAccountsRequestHomePreferencesItem].self, forKey: .homePreferences)
            self.invoicePrefix = try container.decodeNullableIfPresent(String.self, forKey: .invoicePrefix)
            self.logo = try container.decodeNullableIfPresent(UpdateAccountsRequestLogo.self, forKey: .logo)
            self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
            self.onboardingType = try container.decodeNullableIfPresent(UpdateAccountsRequestOnboardingType.self, forKey: .onboardingType)
            self.opengraphImage = try container.decodeNullableIfPresent(UpdateAccountsRequestOpengraphImage.self, forKey: .opengraphImage)
            self.opengraphImageVariant = try container.decodeNullableIfPresent(UpdateAccountsRequestOpengraphImageVariant.self, forKey: .opengraphImageVariant)
            self.orchestrationEnabled = try container.decodeIfPresent(Bool.self, forKey: .orchestrationEnabled)
            self.otherBusinessDescription = try container.decodeNullableIfPresent(String.self, forKey: .otherBusinessDescription)
            self.otherIndustryDescription = try container.decodeNullableIfPresent(String.self, forKey: .otherIndustryDescription)
            self.privacyPolicy = try container.decodeNullableIfPresent(UpdateAccountsRequestPrivacyPolicy.self, forKey: .privacyPolicy)
            self.productTaxCodeId = try container.decodeNullableIfPresent(String.self, forKey: .productTaxCodeId)
            self.require2Fa = try container.decodeIfPresent(Bool.self, forKey: .require2Fa)
            self.returnPolicy = try container.decodeNullableIfPresent(UpdateAccountsRequestReturnPolicy.self, forKey: .returnPolicy)
            self.route = try container.decodeNullableIfPresent(String.self, forKey: .route)
            self.sendCustomerEmails = try container.decodeIfPresent(Bool.self, forKey: .sendCustomerEmails)
            self.shippingPolicy = try container.decodeNullableIfPresent(UpdateAccountsRequestShippingPolicy.self, forKey: .shippingPolicy)
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
            self.termsOfService = try container.decodeNullableIfPresent(UpdateAccountsRequestTermsOfService.self, forKey: .termsOfService)
            self.threeDsLevel = try container.decodeNullableIfPresent(UpdateAccountsRequestThreeDsLevel.self, forKey: .threeDsLevel)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.useLogoAsOpengraphImageFallback = try container.decodeIfPresent(Bool.self, forKey: .useLogoAsOpengraphImageFallback)
            self.website = try container.decodeNullableIfPresent(String.self, forKey: .website)
            self.whopPartnerEnabled = try container.decodeIfPresent(Bool.self, forKey: .whopPartnerEnabled)
            self.industryType = try container.decodeIfPresent(JSONValue.self, forKey: .industryType)
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
            try container.encodeNullableIfPresent(self.cancellationPolicy, forKey: .cancellationPolicy)
            try container.encodeIfPresent(self.collectVatId, forKey: .collectVatId)
            try container.encodeNullableIfPresent(self.country, forKey: .country)
            try container.encodeNullableIfPresent(self.description, forKey: .description)
            try container.encodeIfPresent(self.disputeFighterEnabled, forKey: .disputeFighterEnabled)
            try container.encodeNullableIfPresent(self.eula, forKey: .eula)
            try container.encodeNullableIfPresent(self.externalId, forKey: .externalId)
            try container.encodeNullableIfPresent(self.featuredAffiliateProductId, forKey: .featuredAffiliateProductId)
            try container.encodeIfPresent(self.homePreferences, forKey: .homePreferences)
            try container.encodeNullableIfPresent(self.invoicePrefix, forKey: .invoicePrefix)
            try container.encodeNullableIfPresent(self.logo, forKey: .logo)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.onboardingType, forKey: .onboardingType)
            try container.encodeNullableIfPresent(self.opengraphImage, forKey: .opengraphImage)
            try container.encodeNullableIfPresent(self.opengraphImageVariant, forKey: .opengraphImageVariant)
            try container.encodeIfPresent(self.orchestrationEnabled, forKey: .orchestrationEnabled)
            try container.encodeNullableIfPresent(self.otherBusinessDescription, forKey: .otherBusinessDescription)
            try container.encodeNullableIfPresent(self.otherIndustryDescription, forKey: .otherIndustryDescription)
            try container.encodeNullableIfPresent(self.privacyPolicy, forKey: .privacyPolicy)
            try container.encodeNullableIfPresent(self.productTaxCodeId, forKey: .productTaxCodeId)
            try container.encodeIfPresent(self.require2Fa, forKey: .require2Fa)
            try container.encodeNullableIfPresent(self.returnPolicy, forKey: .returnPolicy)
            try container.encodeNullableIfPresent(self.route, forKey: .route)
            try container.encodeIfPresent(self.sendCustomerEmails, forKey: .sendCustomerEmails)
            try container.encodeNullableIfPresent(self.shippingPolicy, forKey: .shippingPolicy)
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
            try container.encodeNullableIfPresent(self.termsOfService, forKey: .termsOfService)
            try container.encodeNullableIfPresent(self.threeDsLevel, forKey: .threeDsLevel)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encodeIfPresent(self.useLogoAsOpengraphImageFallback, forKey: .useLogoAsOpengraphImageFallback)
            try container.encodeNullableIfPresent(self.website, forKey: .website)
            try container.encodeIfPresent(self.whopPartnerEnabled, forKey: .whopPartnerEnabled)
            try container.encodeIfPresent(self.industryType, forKey: .industryType)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case affiliateApplicationRequired = "affiliate_application_required"
            case affiliateInstructions = "affiliate_instructions"
            case bannerImage = "banner_image"
            case businessAddress = "business_address"
            case businessName = "business_name"
            case cancellationPolicy = "cancellation_policy"
            case collectVatId = "collect_vat_id"
            case country
            case description
            case disputeFighterEnabled = "dispute_fighter_enabled"
            case eula
            case externalId = "external_id"
            case featuredAffiliateProductId = "featured_affiliate_product_id"
            case homePreferences = "home_preferences"
            case invoicePrefix = "invoice_prefix"
            case logo
            case metadata
            case onboardingType = "onboarding_type"
            case opengraphImage = "opengraph_image"
            case opengraphImageVariant = "opengraph_image_variant"
            case orchestrationEnabled = "orchestration_enabled"
            case otherBusinessDescription = "other_business_description"
            case otherIndustryDescription = "other_industry_description"
            case privacyPolicy = "privacy_policy"
            case productTaxCodeId = "product_tax_code_id"
            case require2Fa = "require_2fa"
            case returnPolicy = "return_policy"
            case route
            case sendCustomerEmails = "send_customer_emails"
            case shippingPolicy = "shipping_policy"
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
            case termsOfService = "terms_of_service"
            case threeDsLevel = "three_ds_level"
            case title
            case useLogoAsOpengraphImageFallback = "use_logo_as_opengraph_image_fallback"
            case website
            case whopPartnerEnabled = "whop_partner_enabled"
            case industryType = "industry_type"
        }
    }
}