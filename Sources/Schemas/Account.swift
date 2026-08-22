import Foundation

public struct Account: Codable, Hashable, Sendable {
    public let balances: [AccountBalanceToken]
    /// Account banner image URL.
    public let bannerImageUrl: Nullable<String>
    /// Account business address used to calculate tax, with `line1`, `line2`, `city`, `state`, `postal_code`, and `country`. `null` when no address is set.
    public let businessAddress: Nullable<[String: JSONValue]>
    /// The account's legal business name used with its tax address.
    public let businessName: Nullable<String>
    /// High-level business category for the account. See the [business types and industries glossary](/api-reference/beta/accounts/account#business-types-and-industries-glossary) for valid values.
    public let businessType: Nullable<AccountBusinessType>
    /// Whether pending funds may be transferred from this platform account to its connected accounts.
    public let canTransferPendingBalanceToChildren: Bool
    /// Payment rails enabled for this account, each `active`, `inactive`, or `pending` (onboarding or review in progress). Computed only on `retrieve` and `me` for callers with `company:balance:read` scope; `null` otherwise.
    public let capabilities: Nullable<AccountCapabilities>
    /// Whop Cards application details for the account. Computed only on `retrieve` and `me` for callers with `company:balance:read` scope; `null` otherwise, or when the account has no card application.
    public let cards: Nullable<AccountCards>
    /// Whether checkout shows a VAT/tax ID field for buyers to optionally enter. Does not require a VAT ID to purchase.
    public let collectVatId: Bool
    /// Company formation state for the account, managed through [Form Company](/api-reference/beta/accounts/form-company). A `draft` `status` until the formation checkout is paid, then filing progress with downloadable documents and signatures awaiting action. Empty when the formation state is temporarily unavailable.
    public let companyFormation: AccountCompanyFormation
    /// Country where the account is located.
    public let country: Nullable<String>
    /// When the account was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Account promotional description.
    public let description: Nullable<String>
    /// Account owner email address.
    public let email: Nullable<String>
    public let homePreferences: [AccountHomePreferencesItem]
    /// Account ID, prefixed `biz_`.
    public let id: String
    /// Account industry group. See the [business types and industries glossary](/api-reference/beta/accounts/account#business-types-and-industries-glossary) for valid values.
    public let industryGroup: Nullable<AccountIndustryGroup>
    /// Specific industry vertical for the account. See the [business types and industries glossary](/api-reference/beta/accounts/account#business-types-and-industries-glossary) for valid values.
    public let industryType: Nullable<String>
    /// Prefix used for account invoices.
    public let invoicePrefix: Nullable<String>
    /// Account logo image URL.
    public let logoUrl: Nullable<String>
    /// Arbitrary key/value metadata supplied at account creation.
    public let metadata: [String: JSONValue]
    /// Type of onboarding the account has completed.
    public let onboardingType: Nullable<AccountOnboardingType>
    /// Account Open Graph image URL.
    public let opengraphImageUrl: Nullable<String>
    /// Account Open Graph image variant.
    public let opengraphImageVariant: Nullable<AccountOpengraphImageVariant>
    /// Business type details when business_type is `other`.
    public let otherBusinessDescription: Nullable<String>
    /// Industry details when industry_type is `other`.
    public let otherIndustryDescription: Nullable<String>
    /// The single user who owns the account, whose email is the `email` above. Distinct from the `owner` role on team members, which any number of them can hold.
    public let owner: UserSummary
    /// Parent account for connected accounts, or `null` for standalone accounts.
    public let parentAccount: Nullable<AccountParent>
    /// Payment health controls currently applied to the account. Computed only on `retrieve` and `me` for callers with `company:balance:read` scope; `null` otherwise.
    public let paymentControls: Nullable<AccountPaymentControls>
    /// Tax classification code applied by default to the account's products, with `id`, `name`, and `product_type`. `null` when no default is set.
    public let productTaxCode: Nullable<[String: JSONValue]>
    /// DEPRECATED: Use the `GET /recommended_actions?account_id={account_id}` endpoint instead.
    public let recommendedActions: Nullable<[AccountRecommendedAction]>
    /// Whether authorized users must enable two-factor authentication.
    public let require2Fa: Bool
    public let requiredActions: Nullable<[AccountRequiredAction]>
    /// Account public route identifier.
    public let route: String
    /// Whether Whop sends transactional emails to customers on behalf of this account.
    public let sendCustomerEmails: Bool
    /// Whether the account appears in joined whops on other accounts.
    public let showJoinedWhops: Bool
    /// Whether reviews are displayed on direct-to-consumer product pages.
    public let showReviewsDtc: Bool
    /// Whether the account shows users in the user directory.
    public let showUserDirectory: Bool
    public let socialLinks: [AccountSocialLink]
    /// Whether the account settles on stablecoin rails — its balance is held on-chain as USDT and paid out over crypto, rather than as fiat cash.
    public let stablecoinRails: Bool
    /// Whether the account can operate on Whop: `active` or `suspended`. Computed on `list`, `retrieve`, and `me`; `null` otherwise.
    public let status: Nullable<String>
    /// Why the account was suspended, in language safe to show the account owner. Computed only on `retrieve` and `me`; `null` otherwise, when `status` is not `suspended`, and when the suspension was recorded without a reason.
    public let statusReason: Nullable<String>
    /// Account store page display configuration.
    public let storePageConfig: AccountStorePageConfig
    /// Target audience for this account.
    public let targetAudience: Nullable<String>
    public let taxCollectionEnabledStates: [String]
    public let taxIdentifiers: [AccountTaxIdentifier]
    /// Who calculates and remits tax for the account: `whop` (Whop calculates and remits), `self` (Whop calculates; the account collects and remits), or `none` (neither; the account is responsible). `null` until the account enrolls in the Whop tax service.
    public let taxRemittedBy: Nullable<AccountTaxRemittedBy>
    /// How tax is applied to the account's prices: `inclusive` (tax included in the listed price) or `exclusive` (tax added on top). Defaults to `exclusive` when unset; `null` only when the account has no payment connection.
    public let taxType: Nullable<AccountTaxType>
    /// Account-level 3D Secure behavior. `mandate_challenge` requires cardholder verification on supported card payments; `null` uses the standard checkout flow.
    public let threeDsLevel: Nullable<AccountThreeDsLevel>
    /// Account display name.
    public let title: String
    /// Account lifetime sales, normalized to USD. Computed only on `retrieve` and `me` for callers with `stats:read` scope; `null` otherwise.
    public let totalEarnedUsd: Nullable<Double>
    /// Total USD value across balances with known exchange rates. Computed only on single-account reads (`retrieve` and `me`); `null` on list responses, writes, missing balance-read permission, or unavailable balance source.
    public let totalUsd: Nullable<String>
    /// Whether the account uses its logo as the fallback Open Graph image.
    public let useLogoAsOpengraphImageFallback: Bool
    /// Account identity verification status for the `individual` (KYC) and `business` (KYB) profiles. Each is `null` until created, otherwise a `status` of `not_started`, `pending`, `manual_review`, `approved`, or `rejected`.
    public let verification: [String: JSONValue]
    /// Lifetime volume through the account — sales plus transfers received — normalized to USD. Computed only on `list` for callers with `stats:read` on the account; `null` otherwise.
    public let volumeUsd: Nullable<Double>
    /// Account primary crypto wallet, or `null` if none has been provisioned.
    public let wallet: Nullable<AccountWallet>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        balances: [AccountBalanceToken],
        bannerImageUrl: Nullable<String>,
        businessAddress: Nullable<[String: JSONValue]>,
        businessName: Nullable<String>,
        businessType: Nullable<AccountBusinessType>,
        canTransferPendingBalanceToChildren: Bool,
        capabilities: Nullable<AccountCapabilities>,
        cards: Nullable<AccountCards>,
        collectVatId: Bool,
        companyFormation: AccountCompanyFormation,
        country: Nullable<String>,
        createdAt: String,
        description: Nullable<String>,
        email: Nullable<String>,
        homePreferences: [AccountHomePreferencesItem],
        id: String,
        industryGroup: Nullable<AccountIndustryGroup>,
        industryType: Nullable<String>,
        invoicePrefix: Nullable<String>,
        logoUrl: Nullable<String>,
        metadata: [String: JSONValue],
        onboardingType: Nullable<AccountOnboardingType>,
        opengraphImageUrl: Nullable<String>,
        opengraphImageVariant: Nullable<AccountOpengraphImageVariant>,
        otherBusinessDescription: Nullable<String>,
        otherIndustryDescription: Nullable<String>,
        owner: UserSummary,
        parentAccount: Nullable<AccountParent>,
        paymentControls: Nullable<AccountPaymentControls>,
        productTaxCode: Nullable<[String: JSONValue]>,
        recommendedActions: Nullable<[AccountRecommendedAction]>,
        require2Fa: Bool,
        requiredActions: Nullable<[AccountRequiredAction]>,
        route: String,
        sendCustomerEmails: Bool,
        showJoinedWhops: Bool,
        showReviewsDtc: Bool,
        showUserDirectory: Bool,
        socialLinks: [AccountSocialLink],
        stablecoinRails: Bool,
        status: Nullable<String>,
        statusReason: Nullable<String>,
        storePageConfig: AccountStorePageConfig,
        targetAudience: Nullable<String>,
        taxCollectionEnabledStates: [String],
        taxIdentifiers: [AccountTaxIdentifier],
        taxRemittedBy: Nullable<AccountTaxRemittedBy>,
        taxType: Nullable<AccountTaxType>,
        threeDsLevel: Nullable<AccountThreeDsLevel>,
        title: String,
        totalEarnedUsd: Nullable<Double>,
        totalUsd: Nullable<String>,
        useLogoAsOpengraphImageFallback: Bool,
        verification: [String: JSONValue],
        volumeUsd: Nullable<Double>,
        wallet: Nullable<AccountWallet>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.balances = balances
        self.bannerImageUrl = bannerImageUrl
        self.businessAddress = businessAddress
        self.businessName = businessName
        self.businessType = businessType
        self.canTransferPendingBalanceToChildren = canTransferPendingBalanceToChildren
        self.capabilities = capabilities
        self.cards = cards
        self.collectVatId = collectVatId
        self.companyFormation = companyFormation
        self.country = country
        self.createdAt = createdAt
        self.description = description
        self.email = email
        self.homePreferences = homePreferences
        self.id = id
        self.industryGroup = industryGroup
        self.industryType = industryType
        self.invoicePrefix = invoicePrefix
        self.logoUrl = logoUrl
        self.metadata = metadata
        self.onboardingType = onboardingType
        self.opengraphImageUrl = opengraphImageUrl
        self.opengraphImageVariant = opengraphImageVariant
        self.otherBusinessDescription = otherBusinessDescription
        self.otherIndustryDescription = otherIndustryDescription
        self.owner = owner
        self.parentAccount = parentAccount
        self.paymentControls = paymentControls
        self.productTaxCode = productTaxCode
        self.recommendedActions = recommendedActions
        self.require2Fa = require2Fa
        self.requiredActions = requiredActions
        self.route = route
        self.sendCustomerEmails = sendCustomerEmails
        self.showJoinedWhops = showJoinedWhops
        self.showReviewsDtc = showReviewsDtc
        self.showUserDirectory = showUserDirectory
        self.socialLinks = socialLinks
        self.stablecoinRails = stablecoinRails
        self.status = status
        self.statusReason = statusReason
        self.storePageConfig = storePageConfig
        self.targetAudience = targetAudience
        self.taxCollectionEnabledStates = taxCollectionEnabledStates
        self.taxIdentifiers = taxIdentifiers
        self.taxRemittedBy = taxRemittedBy
        self.taxType = taxType
        self.threeDsLevel = threeDsLevel
        self.title = title
        self.totalEarnedUsd = totalEarnedUsd
        self.totalUsd = totalUsd
        self.useLogoAsOpengraphImageFallback = useLogoAsOpengraphImageFallback
        self.verification = verification
        self.volumeUsd = volumeUsd
        self.wallet = wallet
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.balances = try container.decode([AccountBalanceToken].self, forKey: .balances)
        self.bannerImageUrl = try container.decode(Nullable<String>.self, forKey: .bannerImageUrl)
        self.businessAddress = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .businessAddress)
        self.businessName = try container.decode(Nullable<String>.self, forKey: .businessName)
        self.businessType = try container.decode(Nullable<AccountBusinessType>.self, forKey: .businessType)
        self.canTransferPendingBalanceToChildren = try container.decode(Bool.self, forKey: .canTransferPendingBalanceToChildren)
        self.capabilities = try container.decode(Nullable<AccountCapabilities>.self, forKey: .capabilities)
        self.cards = try container.decode(Nullable<AccountCards>.self, forKey: .cards)
        self.collectVatId = try container.decode(Bool.self, forKey: .collectVatId)
        self.companyFormation = try container.decode(AccountCompanyFormation.self, forKey: .companyFormation)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.homePreferences = try container.decode([AccountHomePreferencesItem].self, forKey: .homePreferences)
        self.id = try container.decode(String.self, forKey: .id)
        self.industryGroup = try container.decode(Nullable<AccountIndustryGroup>.self, forKey: .industryGroup)
        self.industryType = try container.decode(Nullable<String>.self, forKey: .industryType)
        self.invoicePrefix = try container.decode(Nullable<String>.self, forKey: .invoicePrefix)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.onboardingType = try container.decode(Nullable<AccountOnboardingType>.self, forKey: .onboardingType)
        self.opengraphImageUrl = try container.decode(Nullable<String>.self, forKey: .opengraphImageUrl)
        self.opengraphImageVariant = try container.decode(Nullable<AccountOpengraphImageVariant>.self, forKey: .opengraphImageVariant)
        self.otherBusinessDescription = try container.decode(Nullable<String>.self, forKey: .otherBusinessDescription)
        self.otherIndustryDescription = try container.decode(Nullable<String>.self, forKey: .otherIndustryDescription)
        self.owner = try container.decode(UserSummary.self, forKey: .owner)
        self.parentAccount = try container.decode(Nullable<AccountParent>.self, forKey: .parentAccount)
        self.paymentControls = try container.decode(Nullable<AccountPaymentControls>.self, forKey: .paymentControls)
        self.productTaxCode = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .productTaxCode)
        self.recommendedActions = try container.decode(Nullable<[AccountRecommendedAction]>.self, forKey: .recommendedActions)
        self.require2Fa = try container.decode(Bool.self, forKey: .require2Fa)
        self.requiredActions = try container.decode(Nullable<[AccountRequiredAction]>.self, forKey: .requiredActions)
        self.route = try container.decode(String.self, forKey: .route)
        self.sendCustomerEmails = try container.decode(Bool.self, forKey: .sendCustomerEmails)
        self.showJoinedWhops = try container.decode(Bool.self, forKey: .showJoinedWhops)
        self.showReviewsDtc = try container.decode(Bool.self, forKey: .showReviewsDtc)
        self.showUserDirectory = try container.decode(Bool.self, forKey: .showUserDirectory)
        self.socialLinks = try container.decode([AccountSocialLink].self, forKey: .socialLinks)
        self.stablecoinRails = try container.decode(Bool.self, forKey: .stablecoinRails)
        self.status = try container.decode(Nullable<String>.self, forKey: .status)
        self.statusReason = try container.decode(Nullable<String>.self, forKey: .statusReason)
        self.storePageConfig = try container.decode(AccountStorePageConfig.self, forKey: .storePageConfig)
        self.targetAudience = try container.decode(Nullable<String>.self, forKey: .targetAudience)
        self.taxCollectionEnabledStates = try container.decode([String].self, forKey: .taxCollectionEnabledStates)
        self.taxIdentifiers = try container.decode([AccountTaxIdentifier].self, forKey: .taxIdentifiers)
        self.taxRemittedBy = try container.decode(Nullable<AccountTaxRemittedBy>.self, forKey: .taxRemittedBy)
        self.taxType = try container.decode(Nullable<AccountTaxType>.self, forKey: .taxType)
        self.threeDsLevel = try container.decode(Nullable<AccountThreeDsLevel>.self, forKey: .threeDsLevel)
        self.title = try container.decode(String.self, forKey: .title)
        self.totalEarnedUsd = try container.decode(Nullable<Double>.self, forKey: .totalEarnedUsd)
        self.totalUsd = try container.decode(Nullable<String>.self, forKey: .totalUsd)
        self.useLogoAsOpengraphImageFallback = try container.decode(Bool.self, forKey: .useLogoAsOpengraphImageFallback)
        self.verification = try container.decode([String: JSONValue].self, forKey: .verification)
        self.volumeUsd = try container.decode(Nullable<Double>.self, forKey: .volumeUsd)
        self.wallet = try container.decode(Nullable<AccountWallet>.self, forKey: .wallet)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.balances, forKey: .balances)
        try container.encode(self.bannerImageUrl, forKey: .bannerImageUrl)
        try container.encode(self.businessAddress, forKey: .businessAddress)
        try container.encode(self.businessName, forKey: .businessName)
        try container.encode(self.businessType, forKey: .businessType)
        try container.encode(self.canTransferPendingBalanceToChildren, forKey: .canTransferPendingBalanceToChildren)
        try container.encode(self.capabilities, forKey: .capabilities)
        try container.encode(self.cards, forKey: .cards)
        try container.encode(self.collectVatId, forKey: .collectVatId)
        try container.encode(self.companyFormation, forKey: .companyFormation)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.homePreferences, forKey: .homePreferences)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.industryGroup, forKey: .industryGroup)
        try container.encode(self.industryType, forKey: .industryType)
        try container.encode(self.invoicePrefix, forKey: .invoicePrefix)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.onboardingType, forKey: .onboardingType)
        try container.encode(self.opengraphImageUrl, forKey: .opengraphImageUrl)
        try container.encode(self.opengraphImageVariant, forKey: .opengraphImageVariant)
        try container.encode(self.otherBusinessDescription, forKey: .otherBusinessDescription)
        try container.encode(self.otherIndustryDescription, forKey: .otherIndustryDescription)
        try container.encode(self.owner, forKey: .owner)
        try container.encode(self.parentAccount, forKey: .parentAccount)
        try container.encode(self.paymentControls, forKey: .paymentControls)
        try container.encode(self.productTaxCode, forKey: .productTaxCode)
        try container.encode(self.recommendedActions, forKey: .recommendedActions)
        try container.encode(self.require2Fa, forKey: .require2Fa)
        try container.encode(self.requiredActions, forKey: .requiredActions)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.sendCustomerEmails, forKey: .sendCustomerEmails)
        try container.encode(self.showJoinedWhops, forKey: .showJoinedWhops)
        try container.encode(self.showReviewsDtc, forKey: .showReviewsDtc)
        try container.encode(self.showUserDirectory, forKey: .showUserDirectory)
        try container.encode(self.socialLinks, forKey: .socialLinks)
        try container.encode(self.stablecoinRails, forKey: .stablecoinRails)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusReason, forKey: .statusReason)
        try container.encode(self.storePageConfig, forKey: .storePageConfig)
        try container.encode(self.targetAudience, forKey: .targetAudience)
        try container.encode(self.taxCollectionEnabledStates, forKey: .taxCollectionEnabledStates)
        try container.encode(self.taxIdentifiers, forKey: .taxIdentifiers)
        try container.encode(self.taxRemittedBy, forKey: .taxRemittedBy)
        try container.encode(self.taxType, forKey: .taxType)
        try container.encode(self.threeDsLevel, forKey: .threeDsLevel)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.totalEarnedUsd, forKey: .totalEarnedUsd)
        try container.encode(self.totalUsd, forKey: .totalUsd)
        try container.encode(self.useLogoAsOpengraphImageFallback, forKey: .useLogoAsOpengraphImageFallback)
        try container.encode(self.verification, forKey: .verification)
        try container.encode(self.volumeUsd, forKey: .volumeUsd)
        try container.encode(self.wallet, forKey: .wallet)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case balances
        case bannerImageUrl = "banner_image_url"
        case businessAddress = "business_address"
        case businessName = "business_name"
        case businessType = "business_type"
        case canTransferPendingBalanceToChildren = "can_transfer_pending_balance_to_children"
        case capabilities
        case cards
        case collectVatId = "collect_vat_id"
        case companyFormation = "company_formation"
        case country
        case createdAt = "created_at"
        case description
        case email
        case homePreferences = "home_preferences"
        case id
        case industryGroup = "industry_group"
        case industryType = "industry_type"
        case invoicePrefix = "invoice_prefix"
        case logoUrl = "logo_url"
        case metadata
        case onboardingType = "onboarding_type"
        case opengraphImageUrl = "opengraph_image_url"
        case opengraphImageVariant = "opengraph_image_variant"
        case otherBusinessDescription = "other_business_description"
        case otherIndustryDescription = "other_industry_description"
        case owner
        case parentAccount = "parent_account"
        case paymentControls = "payment_controls"
        case productTaxCode = "product_tax_code"
        case recommendedActions = "recommended_actions"
        case require2Fa = "require_2fa"
        case requiredActions = "required_actions"
        case route
        case sendCustomerEmails = "send_customer_emails"
        case showJoinedWhops = "show_joined_whops"
        case showReviewsDtc = "show_reviews_dtc"
        case showUserDirectory = "show_user_directory"
        case socialLinks = "social_links"
        case stablecoinRails = "stablecoin_rails"
        case status
        case statusReason = "status_reason"
        case storePageConfig = "store_page_config"
        case targetAudience = "target_audience"
        case taxCollectionEnabledStates = "tax_collection_enabled_states"
        case taxIdentifiers = "tax_identifiers"
        case taxRemittedBy = "tax_remitted_by"
        case taxType = "tax_type"
        case threeDsLevel = "three_ds_level"
        case title
        case totalEarnedUsd = "total_earned_usd"
        case totalUsd = "total_usd"
        case useLogoAsOpengraphImageFallback = "use_logo_as_opengraph_image_fallback"
        case verification
        case volumeUsd = "volume_usd"
        case wallet
    }
}