import Foundation

public struct Account: Codable, Hashable, Sendable {
    /// Lifetime charged ad spend for the account, in USD. Computed only on `list` for callers with `stats:read` on the account; `null` otherwise.
    public let adsSpendUsd: Nullable<Double>
    public let balances: [AccountBalanceToken]
    /// Account banner image URL.
    public let bannerImageUrl: Nullable<String>
    /// Account business address used to calculate tax, with `line1`, `line2`, `city`, `state`, `postal_code`, and `country`. `null` when no address is set.
    public let businessAddress: Nullable<[String: JSONValue]>
    /// The account's legal business name used with its tax address.
    public let businessName: Nullable<String>
    /// High-level business category for the account. See the [business types and industries glossary](/api-reference/accounts/account#business-types-and-industries-glossary) for valid values.
    public let businessType: Nullable<String>
    /// Whether pending funds may be transferred from this platform account to its subaccounts.
    public let canTransferPendingBalanceToChildren: Bool
    /// The account's cancellation policy document, or `null` if they have not published one.
    public let cancellationPolicy: Nullable<File>
    /// Payment rails enabled for this account, each `active`, `inactive`, or `pending` (onboarding or review in progress). Computed only on `retrieve` and `me` for callers with `company:balance:read` scope; `null` otherwise.
    public let capabilities: Nullable<AccountCapabilities>
    /// Whop Cards application details for the account. Returned on `list`, `retrieve`, and `me` for callers with `company:balance:read` scope; `null` otherwise, or when the account has no card application or blocking application review.
    public let cards: Nullable<AccountCards>
    /// Whether checkout shows a VAT/tax ID field for buyers to optionally enter. Does not require a VAT ID to purchase.
    public let collectVatId: Bool
    /// Company formation state for the account, managed through [Form Company](/api-reference/accounts/form-company). A `draft` `status` until the formation checkout is paid, then filing progress with downloadable documents and signatures awaiting action. Empty when the formation state is temporarily unavailable.
    public let companyFormation: AccountCompanyFormation
    /// Country where the account is located.
    public let country: Nullable<String>
    /// When the account was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Distinct customers with a paid receipt at the account in the last 30 days, refreshed every few hours. Computed only on `retrieve` for callers with `stats:read` on the account; `null` otherwise, and when the count is unavailable.
    public let customersL30D: Nullable<Int>
    /// Account promotional description.
    public let description: Nullable<String>
    /// How many team members report to the business directly, with no manager above them. Present on single-account reads.
    public let directReportsCount: Int?
    /// Whether Whop assembles and files dispute evidence for this account. Enabling it opts the account into the success fee charged on disputes it wins.
    public let disputeFighterEnabled: Bool
    /// Whether Economic Intelligence is on for the account. It turns off automatically when its committed period ends. While it is off, the account can't activate an experiment or run a recommendation.
    public let economicIntelligence: Bool
    /// Account owner email address.
    public let email: Nullable<String>
    /// The account's end-user license agreement document, or `null` if they have not published one.
    public let eula: Nullable<File>
    /// The parent platform's own identifier for this subaccount, unique among the platform's subaccounts. `null` when unset.
    public let externalId: Nullable<String>
    /// The account's most recent financing application. Computed only on `retrieve` and `me` for callers with `company:balance:read` scope; `null` otherwise, or when the account has never applied for financing.
    public let financing: Nullable<AccountFinancing>
    /// When a suspended account can pay out its balance to its own payout method, as an ISO 8601 timestamp. A dispute can move it later. Computed on `retrieve`, `me`, and `suspend`; `null` otherwise, when `status` is not `suspended`, and when the suspension holds the balance.
    public let fundsReleaseAt: Nullable<String>
    public let homePreferences: [AccountHomePreferencesItem]
    /// Account ID, prefixed `biz_`.
    public let id: String
    /// Specific industry vertical for the account. See the [business types and industries glossary](/api-reference/accounts/account#business-types-and-industries-glossary) for valid values.
    public let industryType: Nullable<String>
    /// Prefix used for account invoices.
    public let invoicePrefix: Nullable<String>
    /// The Whop Levels progress of the account's `owner`, counted across every account they own, so all of them show the same level. Computed only on `retrieve` and `me` for callers with `company:basic:read` scope; `null` otherwise, and when the account is not in Whop Levels.
    public let level: Nullable<AccountLevel>
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
    /// Whether payment orchestration is enabled for this account.
    public let orchestrationEnabled: Bool
    /// Business type details when business_type is `other`.
    public let otherBusinessDescription: Nullable<String>
    /// Industry details when industry_type is `other`.
    public let otherIndustryDescription: Nullable<String>
    /// The single user who owns the account, whose email is the `email` above. Distinct from the `owner` role on team members, which any number of them can hold.
    public let owner: UserSummary
    /// Parent account for subaccounts, or `null` for standalone accounts.
    public let parentAccount: Nullable<AccountParent>
    /// The account's active first-tier partner. Present on retrieve responses; null when no active first-tier partner is attributed to the account. Omitted from other responses.
    public let partner: Nullable<AccountPartner>?
    /// Payment health controls currently applied to the account. Computed only on `retrieve` and `me` for callers with `company:balance:read` scope; `null` otherwise.
    public let paymentControls: Nullable<AccountPaymentControls>
    /// The account's default payment methods at checkout. A variant's or checkout configuration's own `payment_method_configuration` takes precedence. `null` when the account uses Whop's platform defaults.
    public let paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>
    public let platformCredits: [Money]
    /// The account's privacy policy document, or `null` if they have not published one.
    public let privacyPolicy: Nullable<File>
    /// Tax classification code applied by default to the account's products, with `id`, `name`, and `product_type`. `null` when no default is set.
    public let productTaxCode: Nullable<[String: JSONValue]>
    /// DEPRECATED: Use the `GET /economic_intelligence?account_id={account_id}` endpoint instead.
    public let recommendedActions: Nullable<[AccountRecommendedAction]>
    /// Whether authorized users must enable two-factor authentication.
    public let require2Fa: Bool
    public let requiredActions: Nullable<[AccountRequiredAction]>
    /// The account's return policy document, or `null` if they have not published one.
    public let returnPolicy: Nullable<File>
    public let rewards: [AccountPartnerReward]?
    /// Account public route identifier.
    public let route: String
    /// Whether Whop sends transactional emails to customers on behalf of this account.
    public let sendCustomerEmails: Bool
    /// The account's shipping policy document, or `null` if they have not published one.
    public let shippingPolicy: Nullable<File>
    /// Whether the account appears in joined whops on other accounts.
    public let showJoinedWhops: Bool
    /// Whether reviews are displayed on direct-to-consumer product pages.
    public let showReviewsDtc: Bool
    /// Whether the account shows users in the user directory.
    public let showUserDirectory: Bool
    public let socialLinks: [AccountSocialLink]
    /// Whether the account can operate on Whop: `active` or `suspended`. Computed on `list`, `retrieve`, `me`, and `suspend`; `null` otherwise.
    public let status: Nullable<String>
    /// Why the account was suspended, as the label shown to the account owner, such as `Suspended - Fraudulent activity`. Computed on `retrieve`, `me`, and `suspend`; `null` otherwise, when `status` is not `suspended`, and when the suspension was recorded without a reason.
    public let statusReason: Nullable<String>
    /// Account store page display configuration.
    public let storePageConfig: AccountStorePageConfig
    /// Target audience for this account.
    public let targetAudience: Nullable<String>
    public let taxCollectionEnabledStates: [String]
    public let taxIdentifiers: [AccountTaxIdentifier]
    /// Who calculates and remits tax for the account. `whop` means Whop calculates and remits. `self` means Whop calculates, and the account collects and remits. `none` means neither, and the account is responsible. New businesses start on `whop`, and new connected accounts start on `none`. `null` means the account has no setting yet.
    public let taxRemittedBy: Nullable<AccountTaxRemittedBy>
    /// How tax is applied to the account's prices: `inclusive` (tax included in the listed price) or `exclusive` (tax added on top). Defaults to `exclusive` when unset; `null` only when the account has no payment connection.
    public let taxType: Nullable<AccountTaxType>
    /// The account's terms of service document, or `null` if they have not published one.
    public let termsOfService: Nullable<File>
    /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. `null` uses the standard checkout flow.
    public let threeDsLevel: Nullable<AccountThreeDsLevel>
    /// Account display name.
    public let title: String
    /// Account lifetime sales, normalized to USD. Computed only on `retrieve` and `me` for callers with `stats:read` scope; `null` otherwise.
    public let totalEarnedUsd: Nullable<Double>
    /// Total USD value across balances with known exchange rates. Computed only on single-account reads (`retrieve` and `me`); `null` on list responses, writes, missing balance-read permission, or unavailable balance source.
    public let totalUsd: Nullable<String>
    /// The trading account address, a snapshot of its margin and open positions, and its WebSocket subscriptions. Opt in with `include_trading=true` on single-account reads. `null` otherwise, without trading permission, or without an Ethereum wallet.
    public let trading: Nullable<TradingAccount>
    /// Whether the account uses its logo as the fallback Open Graph image.
    public let useLogoAsOpengraphImageFallback: Bool
    /// Account identity verification status for the `individual` (KYC) and `business` (KYB) profiles. Each is `null` until created, otherwise a `status` of `not_started`, `pending`, `manual_review`, `approved`, or `rejected`.
    public let verification: [String: JSONValue]
    /// Volume through the account in the last 30 days (GMV from paid receipts), normalized to USD. Computed only on `list` for callers with `stats:read` on the account; `null` otherwise.
    public let volumeL30DUsd: Nullable<Double>
    /// Lifetime volume through the account — sales plus transfers received — normalized to USD. Computed only on `list` for callers with `stats:read` on the account; `null` otherwise.
    public let volumeUsd: Nullable<Double>
    /// Account primary crypto wallet, or `null` if none has been provisioned.
    public let wallet: Nullable<AccountWallet>
    /// The account's business website URL, or `null` if none has been provided. Setting it also adds a `website` entry to `social_links`.
    public let website: Nullable<String>
    /// When the account turned on Whop Partner mode, as an ISO 8601 timestamp. Present on single-account reads and update responses; `null` until the account turns Whop Partner mode on by sending `whop_partner_enabled: true` on update.
    public let whopPartnerEnabledAt: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adsSpendUsd: Nullable<Double>,
        balances: [AccountBalanceToken],
        bannerImageUrl: Nullable<String>,
        businessAddress: Nullable<[String: JSONValue]>,
        businessName: Nullable<String>,
        businessType: Nullable<String>,
        canTransferPendingBalanceToChildren: Bool,
        cancellationPolicy: Nullable<File>,
        capabilities: Nullable<AccountCapabilities>,
        cards: Nullable<AccountCards>,
        collectVatId: Bool,
        companyFormation: AccountCompanyFormation,
        country: Nullable<String>,
        createdAt: String,
        customersL30D: Nullable<Int>,
        description: Nullable<String>,
        directReportsCount: Int? = nil,
        disputeFighterEnabled: Bool,
        economicIntelligence: Bool,
        email: Nullable<String>,
        eula: Nullable<File>,
        externalId: Nullable<String>,
        financing: Nullable<AccountFinancing>,
        fundsReleaseAt: Nullable<String>,
        homePreferences: [AccountHomePreferencesItem],
        id: String,
        industryType: Nullable<String>,
        invoicePrefix: Nullable<String>,
        level: Nullable<AccountLevel>,
        logoUrl: Nullable<String>,
        metadata: [String: JSONValue],
        onboardingType: Nullable<AccountOnboardingType>,
        opengraphImageUrl: Nullable<String>,
        opengraphImageVariant: Nullable<AccountOpengraphImageVariant>,
        orchestrationEnabled: Bool,
        otherBusinessDescription: Nullable<String>,
        otherIndustryDescription: Nullable<String>,
        owner: UserSummary,
        parentAccount: Nullable<AccountParent>,
        partner: Nullable<AccountPartner>? = nil,
        paymentControls: Nullable<AccountPaymentControls>,
        paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>,
        platformCredits: [Money],
        privacyPolicy: Nullable<File>,
        productTaxCode: Nullable<[String: JSONValue]>,
        recommendedActions: Nullable<[AccountRecommendedAction]>,
        require2Fa: Bool,
        requiredActions: Nullable<[AccountRequiredAction]>,
        returnPolicy: Nullable<File>,
        rewards: [AccountPartnerReward]? = nil,
        route: String,
        sendCustomerEmails: Bool,
        shippingPolicy: Nullable<File>,
        showJoinedWhops: Bool,
        showReviewsDtc: Bool,
        showUserDirectory: Bool,
        socialLinks: [AccountSocialLink],
        status: Nullable<String>,
        statusReason: Nullable<String>,
        storePageConfig: AccountStorePageConfig,
        targetAudience: Nullable<String>,
        taxCollectionEnabledStates: [String],
        taxIdentifiers: [AccountTaxIdentifier],
        taxRemittedBy: Nullable<AccountTaxRemittedBy>,
        taxType: Nullable<AccountTaxType>,
        termsOfService: Nullable<File>,
        threeDsLevel: Nullable<AccountThreeDsLevel>,
        title: String,
        totalEarnedUsd: Nullable<Double>,
        totalUsd: Nullable<String>,
        trading: Nullable<TradingAccount>,
        useLogoAsOpengraphImageFallback: Bool,
        verification: [String: JSONValue],
        volumeL30DUsd: Nullable<Double>,
        volumeUsd: Nullable<Double>,
        wallet: Nullable<AccountWallet>,
        website: Nullable<String>,
        whopPartnerEnabledAt: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adsSpendUsd = adsSpendUsd
        self.balances = balances
        self.bannerImageUrl = bannerImageUrl
        self.businessAddress = businessAddress
        self.businessName = businessName
        self.businessType = businessType
        self.canTransferPendingBalanceToChildren = canTransferPendingBalanceToChildren
        self.cancellationPolicy = cancellationPolicy
        self.capabilities = capabilities
        self.cards = cards
        self.collectVatId = collectVatId
        self.companyFormation = companyFormation
        self.country = country
        self.createdAt = createdAt
        self.customersL30D = customersL30D
        self.description = description
        self.directReportsCount = directReportsCount
        self.disputeFighterEnabled = disputeFighterEnabled
        self.economicIntelligence = economicIntelligence
        self.email = email
        self.eula = eula
        self.externalId = externalId
        self.financing = financing
        self.fundsReleaseAt = fundsReleaseAt
        self.homePreferences = homePreferences
        self.id = id
        self.industryType = industryType
        self.invoicePrefix = invoicePrefix
        self.level = level
        self.logoUrl = logoUrl
        self.metadata = metadata
        self.onboardingType = onboardingType
        self.opengraphImageUrl = opengraphImageUrl
        self.opengraphImageVariant = opengraphImageVariant
        self.orchestrationEnabled = orchestrationEnabled
        self.otherBusinessDescription = otherBusinessDescription
        self.otherIndustryDescription = otherIndustryDescription
        self.owner = owner
        self.parentAccount = parentAccount
        self.partner = partner
        self.paymentControls = paymentControls
        self.paymentMethodConfiguration = paymentMethodConfiguration
        self.platformCredits = platformCredits
        self.privacyPolicy = privacyPolicy
        self.productTaxCode = productTaxCode
        self.recommendedActions = recommendedActions
        self.require2Fa = require2Fa
        self.requiredActions = requiredActions
        self.returnPolicy = returnPolicy
        self.rewards = rewards
        self.route = route
        self.sendCustomerEmails = sendCustomerEmails
        self.shippingPolicy = shippingPolicy
        self.showJoinedWhops = showJoinedWhops
        self.showReviewsDtc = showReviewsDtc
        self.showUserDirectory = showUserDirectory
        self.socialLinks = socialLinks
        self.status = status
        self.statusReason = statusReason
        self.storePageConfig = storePageConfig
        self.targetAudience = targetAudience
        self.taxCollectionEnabledStates = taxCollectionEnabledStates
        self.taxIdentifiers = taxIdentifiers
        self.taxRemittedBy = taxRemittedBy
        self.taxType = taxType
        self.termsOfService = termsOfService
        self.threeDsLevel = threeDsLevel
        self.title = title
        self.totalEarnedUsd = totalEarnedUsd
        self.totalUsd = totalUsd
        self.trading = trading
        self.useLogoAsOpengraphImageFallback = useLogoAsOpengraphImageFallback
        self.verification = verification
        self.volumeL30DUsd = volumeL30DUsd
        self.volumeUsd = volumeUsd
        self.wallet = wallet
        self.website = website
        self.whopPartnerEnabledAt = whopPartnerEnabledAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adsSpendUsd = try container.decode(Nullable<Double>.self, forKey: .adsSpendUsd)
        self.balances = try container.decode([AccountBalanceToken].self, forKey: .balances)
        self.bannerImageUrl = try container.decode(Nullable<String>.self, forKey: .bannerImageUrl)
        self.businessAddress = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .businessAddress)
        self.businessName = try container.decode(Nullable<String>.self, forKey: .businessName)
        self.businessType = try container.decode(Nullable<String>.self, forKey: .businessType)
        self.canTransferPendingBalanceToChildren = try container.decode(Bool.self, forKey: .canTransferPendingBalanceToChildren)
        self.cancellationPolicy = try container.decode(Nullable<File>.self, forKey: .cancellationPolicy)
        self.capabilities = try container.decode(Nullable<AccountCapabilities>.self, forKey: .capabilities)
        self.cards = try container.decode(Nullable<AccountCards>.self, forKey: .cards)
        self.collectVatId = try container.decode(Bool.self, forKey: .collectVatId)
        self.companyFormation = try container.decode(AccountCompanyFormation.self, forKey: .companyFormation)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.customersL30D = try container.decode(Nullable<Int>.self, forKey: .customersL30D)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.directReportsCount = try container.decodeIfPresent(Int.self, forKey: .directReportsCount)
        self.disputeFighterEnabled = try container.decode(Bool.self, forKey: .disputeFighterEnabled)
        self.economicIntelligence = try container.decode(Bool.self, forKey: .economicIntelligence)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.eula = try container.decode(Nullable<File>.self, forKey: .eula)
        self.externalId = try container.decode(Nullable<String>.self, forKey: .externalId)
        self.financing = try container.decode(Nullable<AccountFinancing>.self, forKey: .financing)
        self.fundsReleaseAt = try container.decode(Nullable<String>.self, forKey: .fundsReleaseAt)
        self.homePreferences = try container.decode([AccountHomePreferencesItem].self, forKey: .homePreferences)
        self.id = try container.decode(String.self, forKey: .id)
        self.industryType = try container.decode(Nullable<String>.self, forKey: .industryType)
        self.invoicePrefix = try container.decode(Nullable<String>.self, forKey: .invoicePrefix)
        self.level = try container.decode(Nullable<AccountLevel>.self, forKey: .level)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.onboardingType = try container.decode(Nullable<AccountOnboardingType>.self, forKey: .onboardingType)
        self.opengraphImageUrl = try container.decode(Nullable<String>.self, forKey: .opengraphImageUrl)
        self.opengraphImageVariant = try container.decode(Nullable<AccountOpengraphImageVariant>.self, forKey: .opengraphImageVariant)
        self.orchestrationEnabled = try container.decode(Bool.self, forKey: .orchestrationEnabled)
        self.otherBusinessDescription = try container.decode(Nullable<String>.self, forKey: .otherBusinessDescription)
        self.otherIndustryDescription = try container.decode(Nullable<String>.self, forKey: .otherIndustryDescription)
        self.owner = try container.decode(UserSummary.self, forKey: .owner)
        self.parentAccount = try container.decode(Nullable<AccountParent>.self, forKey: .parentAccount)
        self.partner = try container.decodeNullableIfPresent(AccountPartner.self, forKey: .partner)
        self.paymentControls = try container.decode(Nullable<AccountPaymentControls>.self, forKey: .paymentControls)
        self.paymentMethodConfiguration = try container.decode(Nullable<CheckoutSessionPaymentMethodConfiguration>.self, forKey: .paymentMethodConfiguration)
        self.platformCredits = try container.decode([Money].self, forKey: .platformCredits)
        self.privacyPolicy = try container.decode(Nullable<File>.self, forKey: .privacyPolicy)
        self.productTaxCode = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .productTaxCode)
        self.recommendedActions = try container.decode(Nullable<[AccountRecommendedAction]>.self, forKey: .recommendedActions)
        self.require2Fa = try container.decode(Bool.self, forKey: .require2Fa)
        self.requiredActions = try container.decode(Nullable<[AccountRequiredAction]>.self, forKey: .requiredActions)
        self.returnPolicy = try container.decode(Nullable<File>.self, forKey: .returnPolicy)
        self.rewards = try container.decodeIfPresent([AccountPartnerReward].self, forKey: .rewards)
        self.route = try container.decode(String.self, forKey: .route)
        self.sendCustomerEmails = try container.decode(Bool.self, forKey: .sendCustomerEmails)
        self.shippingPolicy = try container.decode(Nullable<File>.self, forKey: .shippingPolicy)
        self.showJoinedWhops = try container.decode(Bool.self, forKey: .showJoinedWhops)
        self.showReviewsDtc = try container.decode(Bool.self, forKey: .showReviewsDtc)
        self.showUserDirectory = try container.decode(Bool.self, forKey: .showUserDirectory)
        self.socialLinks = try container.decode([AccountSocialLink].self, forKey: .socialLinks)
        self.status = try container.decode(Nullable<String>.self, forKey: .status)
        self.statusReason = try container.decode(Nullable<String>.self, forKey: .statusReason)
        self.storePageConfig = try container.decode(AccountStorePageConfig.self, forKey: .storePageConfig)
        self.targetAudience = try container.decode(Nullable<String>.self, forKey: .targetAudience)
        self.taxCollectionEnabledStates = try container.decode([String].self, forKey: .taxCollectionEnabledStates)
        self.taxIdentifiers = try container.decode([AccountTaxIdentifier].self, forKey: .taxIdentifiers)
        self.taxRemittedBy = try container.decode(Nullable<AccountTaxRemittedBy>.self, forKey: .taxRemittedBy)
        self.taxType = try container.decode(Nullable<AccountTaxType>.self, forKey: .taxType)
        self.termsOfService = try container.decode(Nullable<File>.self, forKey: .termsOfService)
        self.threeDsLevel = try container.decode(Nullable<AccountThreeDsLevel>.self, forKey: .threeDsLevel)
        self.title = try container.decode(String.self, forKey: .title)
        self.totalEarnedUsd = try container.decode(Nullable<Double>.self, forKey: .totalEarnedUsd)
        self.totalUsd = try container.decode(Nullable<String>.self, forKey: .totalUsd)
        self.trading = try container.decode(Nullable<TradingAccount>.self, forKey: .trading)
        self.useLogoAsOpengraphImageFallback = try container.decode(Bool.self, forKey: .useLogoAsOpengraphImageFallback)
        self.verification = try container.decode([String: JSONValue].self, forKey: .verification)
        self.volumeL30DUsd = try container.decode(Nullable<Double>.self, forKey: .volumeL30DUsd)
        self.volumeUsd = try container.decode(Nullable<Double>.self, forKey: .volumeUsd)
        self.wallet = try container.decode(Nullable<AccountWallet>.self, forKey: .wallet)
        self.website = try container.decode(Nullable<String>.self, forKey: .website)
        self.whopPartnerEnabledAt = try container.decodeNullableIfPresent(String.self, forKey: .whopPartnerEnabledAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adsSpendUsd, forKey: .adsSpendUsd)
        try container.encode(self.balances, forKey: .balances)
        try container.encode(self.bannerImageUrl, forKey: .bannerImageUrl)
        try container.encode(self.businessAddress, forKey: .businessAddress)
        try container.encode(self.businessName, forKey: .businessName)
        try container.encode(self.businessType, forKey: .businessType)
        try container.encode(self.canTransferPendingBalanceToChildren, forKey: .canTransferPendingBalanceToChildren)
        try container.encode(self.cancellationPolicy, forKey: .cancellationPolicy)
        try container.encode(self.capabilities, forKey: .capabilities)
        try container.encode(self.cards, forKey: .cards)
        try container.encode(self.collectVatId, forKey: .collectVatId)
        try container.encode(self.companyFormation, forKey: .companyFormation)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customersL30D, forKey: .customersL30D)
        try container.encode(self.description, forKey: .description)
        try container.encodeIfPresent(self.directReportsCount, forKey: .directReportsCount)
        try container.encode(self.disputeFighterEnabled, forKey: .disputeFighterEnabled)
        try container.encode(self.economicIntelligence, forKey: .economicIntelligence)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.eula, forKey: .eula)
        try container.encode(self.externalId, forKey: .externalId)
        try container.encode(self.financing, forKey: .financing)
        try container.encode(self.fundsReleaseAt, forKey: .fundsReleaseAt)
        try container.encode(self.homePreferences, forKey: .homePreferences)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.industryType, forKey: .industryType)
        try container.encode(self.invoicePrefix, forKey: .invoicePrefix)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.onboardingType, forKey: .onboardingType)
        try container.encode(self.opengraphImageUrl, forKey: .opengraphImageUrl)
        try container.encode(self.opengraphImageVariant, forKey: .opengraphImageVariant)
        try container.encode(self.orchestrationEnabled, forKey: .orchestrationEnabled)
        try container.encode(self.otherBusinessDescription, forKey: .otherBusinessDescription)
        try container.encode(self.otherIndustryDescription, forKey: .otherIndustryDescription)
        try container.encode(self.owner, forKey: .owner)
        try container.encode(self.parentAccount, forKey: .parentAccount)
        try container.encodeNullableIfPresent(self.partner, forKey: .partner)
        try container.encode(self.paymentControls, forKey: .paymentControls)
        try container.encode(self.paymentMethodConfiguration, forKey: .paymentMethodConfiguration)
        try container.encode(self.platformCredits, forKey: .platformCredits)
        try container.encode(self.privacyPolicy, forKey: .privacyPolicy)
        try container.encode(self.productTaxCode, forKey: .productTaxCode)
        try container.encode(self.recommendedActions, forKey: .recommendedActions)
        try container.encode(self.require2Fa, forKey: .require2Fa)
        try container.encode(self.requiredActions, forKey: .requiredActions)
        try container.encode(self.returnPolicy, forKey: .returnPolicy)
        try container.encodeIfPresent(self.rewards, forKey: .rewards)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.sendCustomerEmails, forKey: .sendCustomerEmails)
        try container.encode(self.shippingPolicy, forKey: .shippingPolicy)
        try container.encode(self.showJoinedWhops, forKey: .showJoinedWhops)
        try container.encode(self.showReviewsDtc, forKey: .showReviewsDtc)
        try container.encode(self.showUserDirectory, forKey: .showUserDirectory)
        try container.encode(self.socialLinks, forKey: .socialLinks)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.statusReason, forKey: .statusReason)
        try container.encode(self.storePageConfig, forKey: .storePageConfig)
        try container.encode(self.targetAudience, forKey: .targetAudience)
        try container.encode(self.taxCollectionEnabledStates, forKey: .taxCollectionEnabledStates)
        try container.encode(self.taxIdentifiers, forKey: .taxIdentifiers)
        try container.encode(self.taxRemittedBy, forKey: .taxRemittedBy)
        try container.encode(self.taxType, forKey: .taxType)
        try container.encode(self.termsOfService, forKey: .termsOfService)
        try container.encode(self.threeDsLevel, forKey: .threeDsLevel)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.totalEarnedUsd, forKey: .totalEarnedUsd)
        try container.encode(self.totalUsd, forKey: .totalUsd)
        try container.encode(self.trading, forKey: .trading)
        try container.encode(self.useLogoAsOpengraphImageFallback, forKey: .useLogoAsOpengraphImageFallback)
        try container.encode(self.verification, forKey: .verification)
        try container.encode(self.volumeL30DUsd, forKey: .volumeL30DUsd)
        try container.encode(self.volumeUsd, forKey: .volumeUsd)
        try container.encode(self.wallet, forKey: .wallet)
        try container.encode(self.website, forKey: .website)
        try container.encodeNullableIfPresent(self.whopPartnerEnabledAt, forKey: .whopPartnerEnabledAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adsSpendUsd = "ads_spend_usd"
        case balances
        case bannerImageUrl = "banner_image_url"
        case businessAddress = "business_address"
        case businessName = "business_name"
        case businessType = "business_type"
        case canTransferPendingBalanceToChildren = "can_transfer_pending_balance_to_children"
        case cancellationPolicy = "cancellation_policy"
        case capabilities
        case cards
        case collectVatId = "collect_vat_id"
        case companyFormation = "company_formation"
        case country
        case createdAt = "created_at"
        case customersL30D = "customers_l30d"
        case description
        case directReportsCount = "direct_reports_count"
        case disputeFighterEnabled = "dispute_fighter_enabled"
        case economicIntelligence = "economic_intelligence"
        case email
        case eula
        case externalId = "external_id"
        case financing
        case fundsReleaseAt = "funds_release_at"
        case homePreferences = "home_preferences"
        case id
        case industryType = "industry_type"
        case invoicePrefix = "invoice_prefix"
        case level
        case logoUrl = "logo_url"
        case metadata
        case onboardingType = "onboarding_type"
        case opengraphImageUrl = "opengraph_image_url"
        case opengraphImageVariant = "opengraph_image_variant"
        case orchestrationEnabled = "orchestration_enabled"
        case otherBusinessDescription = "other_business_description"
        case otherIndustryDescription = "other_industry_description"
        case owner
        case parentAccount = "parent_account"
        case partner
        case paymentControls = "payment_controls"
        case paymentMethodConfiguration = "payment_method_configuration"
        case platformCredits = "platform_credits"
        case privacyPolicy = "privacy_policy"
        case productTaxCode = "product_tax_code"
        case recommendedActions = "recommended_actions"
        case require2Fa = "require_2fa"
        case requiredActions = "required_actions"
        case returnPolicy = "return_policy"
        case rewards
        case route
        case sendCustomerEmails = "send_customer_emails"
        case shippingPolicy = "shipping_policy"
        case showJoinedWhops = "show_joined_whops"
        case showReviewsDtc = "show_reviews_dtc"
        case showUserDirectory = "show_user_directory"
        case socialLinks = "social_links"
        case status
        case statusReason = "status_reason"
        case storePageConfig = "store_page_config"
        case targetAudience = "target_audience"
        case taxCollectionEnabledStates = "tax_collection_enabled_states"
        case taxIdentifiers = "tax_identifiers"
        case taxRemittedBy = "tax_remitted_by"
        case taxType = "tax_type"
        case termsOfService = "terms_of_service"
        case threeDsLevel = "three_ds_level"
        case title
        case totalEarnedUsd = "total_earned_usd"
        case totalUsd = "total_usd"
        case trading
        case useLogoAsOpengraphImageFallback = "use_logo_as_opengraph_image_fallback"
        case verification
        case volumeL30DUsd = "volume_l30d_usd"
        case volumeUsd = "volume_usd"
        case wallet
        case website
        case whopPartnerEnabledAt = "whop_partner_enabled_at"
    }
}