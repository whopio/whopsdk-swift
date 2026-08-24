import Foundation

/// Use this class to access the different functions within the SDK. You can instantiate any number of clients with different configuration that will propagate to these functions.
public final class Whop: Sendable {
    public let accessTokens: AccessTokensClient
    public let accountLinks: AccountLinksClient
    public let accounts: AccountsClient
    public let adCampaigns: AdCampaignsClient
    public let adGroups: AdGroupsClient
    public let adReports: AdReportsClient
    public let ads: AdsClient
    public let affiliates: AffiliatesClient
    public let aiChats: AiChatsClient
    public let apiKeys: ApiKeysClient
    public let appBuilds: AppBuildsClient
    public let apps: AppsClient
    public let audiences: AudiencesClient
    public let authorizedUsers: AuthorizedUsersClient
    public let bounties: BountiesClient
    public let bountySubmissions: BountySubmissionsClient
    public let cardTransactions: CardTransactionsClient
    public let cards: CardsClient
    public let chatChannels: ChatChannelsClient
    public let checkoutConfigurations: CheckoutConfigurationsClient
    public let companies: CompaniesClient
    public let companyTokenTransactions: CompanyTokenTransactionsClient
    public let courseChapters: CourseChaptersClient
    public let courseLessonInteractions: CourseLessonInteractionsClient
    public let courseLessons: CourseLessonsClient
    public let courseStudents: CourseStudentsClient
    public let courses: CoursesClient
    public let deposits: DepositsClient
    public let disputeAlerts: DisputeAlertsClient
    public let disputes: DisputesClient
    public let dmChannels: DmChannelsClient
    public let dmMembers: DmMembersClient
    public let entries: EntriesClient
    public let events: EventsClient
    public let experiences: ExperiencesClient
    public let exports: ExportsClient
    public let feeMarkups: FeeMarkupsClient
    public let files: FilesClient
    public let financialActivity: FinancialActivityClient
    public let ledgers: LedgersClient
    public let forumPosts: ForumPostsClient
    public let forums: ForumsClient
    public let identityProfiles: IdentityProfilesClient
    public let invoices: InvoicesClient
    public let leads: LeadsClient
    public let ledgerAccounts: LedgerAccountsClient
    public let media: MediaClient
    public let members: MembersClient
    public let memberships: MembershipsClient
    public let messages: MessagesClient
    public let notifications: NotificationsClient
    public let partners: PartnersClient
    public let paymentMethodDomains: PaymentMethodDomainsClient
    public let paymentMethods: PaymentMethodsClient
    public let payments: PaymentsClient
    public let payoutAccounts: PayoutAccountsClient
    public let payoutMethods: PayoutMethodsClient
    public let payouts: PayoutsClient
    public let people: PeopleClient
    public let permissions: PermissionsClient
    public let plans: PlansClient
    public let products: ProductsClient
    public let promoCodes: PromoCodesClient
    public let reactions: ReactionsClient
    public let recommendedActions: RecommendedActionsClient
    public let refunds: RefundsClient
    public let resolutionCenterCases: ResolutionCenterCasesClient
    public let reviews: ReviewsClient
    public let setupIntents: SetupIntentsClient
    public let shipments: ShipmentsClient
    public let socialAccounts: SocialAccountsClient
    public let stats: StatsClient
    public let supportChannels: SupportChannelsClient
    public let swaps: SwapsClient
    public let teamMembers: TeamMembersClient
    public let topups: TopupsClient
    public let transfers: TransfersClient
    public let users: UsersClient
    public let verifications: VerificationsClient
    public let webhooks: WebhooksClient
    public let withdrawals: WithdrawalsClient
    private let httpClient: HTTPClient

    /// Initialize the client with the specified configuration and a static bearer token.
    ///
    /// - Parameter baseURL: The base URL to use for requests from the client. If not provided, the default base URL will be used.
    /// - Parameter token: Bearer token for authentication. If provided, will be sent as "Bearer {token}" in Authorization header.
    /// - Parameter headers: Additional headers to send with each request.
    /// - Parameter timeout: Request timeout in seconds. Defaults to 60 seconds. Ignored if a custom `urlSession` is provided.
    /// - Parameter maxRetries: Maximum number of retries for failed requests. Defaults to 2.
    /// - Parameter urlSession: Custom `URLSession` to use for requests. If not provided, a default session will be created with the specified timeout.
    public convenience init(
        baseURL: String = WhopSDKEnvironment.default.rawValue,
        token: String? = nil,
        apiVersionDate: String? = nil,
        idempotencyKey: String? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        var mergedHeaders = headers ?? [:]
        if let apiVersionDate = apiVersionDate {
            mergedHeaders["Api-Version-Date"] = apiVersionDate
        }
        if let idempotencyKey = idempotencyKey {
            mergedHeaders["Idempotency-Key"] = idempotencyKey
        }
        self.init(
            baseURL: baseURL,
            headerAuth: nil,
            bearerAuth: token.map {
                .init(token: .staticToken($0))
            },
            basicAuth: nil,
            headers: mergedHeaders,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
    }

    /// Initialize the client with the specified configuration and an async bearer token provider.
    ///
    /// - Parameter baseURL: The base URL to use for requests from the client. If not provided, the default base URL will be used.
    /// - Parameter token: An async function that returns the bearer token for authentication. If provided, will be sent as "Bearer {token}" in Authorization header.
    /// - Parameter headers: Additional headers to send with each request.
    /// - Parameter timeout: Request timeout in seconds. Defaults to 60 seconds. Ignored if a custom `urlSession` is provided.
    /// - Parameter maxRetries: Maximum number of retries for failed requests. Defaults to 2.
    /// - Parameter urlSession: Custom `URLSession` to use for requests. If not provided, a default session will be created with the specified timeout.
    public convenience init(
        baseURL: String = WhopSDKEnvironment.default.rawValue,
        token: ClientConfig.CredentialProvider? = nil,
        apiVersionDate: String? = nil,
        idempotencyKey: String? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        var mergedHeaders = headers ?? [:]
        if let apiVersionDate = apiVersionDate {
            mergedHeaders["Api-Version-Date"] = apiVersionDate
        }
        if let idempotencyKey = idempotencyKey {
            mergedHeaders["Idempotency-Key"] = idempotencyKey
        }
        self.init(
            baseURL: baseURL,
            headerAuth: nil,
            bearerAuth: token.map {
                .init(token: .provider($0))
            },
            basicAuth: nil,
            headers: mergedHeaders,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
    }

    init(
        baseURL: String,
        headerAuth: ClientConfig.HeaderAuth? = nil,
        bearerAuth: ClientConfig.BearerAuth? = nil,
        basicAuth: ClientConfig.BasicAuth? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        let config = ClientConfig(
            baseURL: baseURL,
            headerAuth: headerAuth,
            bearerAuth: bearerAuth,
            basicAuth: basicAuth,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
        self.accessTokens = AccessTokensClient(config: config)
        self.accountLinks = AccountLinksClient(config: config)
        self.accounts = AccountsClient(config: config)
        self.adCampaigns = AdCampaignsClient(config: config)
        self.adGroups = AdGroupsClient(config: config)
        self.adReports = AdReportsClient(config: config)
        self.ads = AdsClient(config: config)
        self.affiliates = AffiliatesClient(config: config)
        self.aiChats = AiChatsClient(config: config)
        self.apiKeys = ApiKeysClient(config: config)
        self.appBuilds = AppBuildsClient(config: config)
        self.apps = AppsClient(config: config)
        self.audiences = AudiencesClient(config: config)
        self.authorizedUsers = AuthorizedUsersClient(config: config)
        self.bounties = BountiesClient(config: config)
        self.bountySubmissions = BountySubmissionsClient(config: config)
        self.cardTransactions = CardTransactionsClient(config: config)
        self.cards = CardsClient(config: config)
        self.chatChannels = ChatChannelsClient(config: config)
        self.checkoutConfigurations = CheckoutConfigurationsClient(config: config)
        self.companies = CompaniesClient(config: config)
        self.companyTokenTransactions = CompanyTokenTransactionsClient(config: config)
        self.courseChapters = CourseChaptersClient(config: config)
        self.courseLessonInteractions = CourseLessonInteractionsClient(config: config)
        self.courseLessons = CourseLessonsClient(config: config)
        self.courseStudents = CourseStudentsClient(config: config)
        self.courses = CoursesClient(config: config)
        self.deposits = DepositsClient(config: config)
        self.disputeAlerts = DisputeAlertsClient(config: config)
        self.disputes = DisputesClient(config: config)
        self.dmChannels = DmChannelsClient(config: config)
        self.dmMembers = DmMembersClient(config: config)
        self.entries = EntriesClient(config: config)
        self.events = EventsClient(config: config)
        self.experiences = ExperiencesClient(config: config)
        self.exports = ExportsClient(config: config)
        self.feeMarkups = FeeMarkupsClient(config: config)
        self.files = FilesClient(config: config)
        self.financialActivity = FinancialActivityClient(config: config)
        self.ledgers = LedgersClient(config: config)
        self.forumPosts = ForumPostsClient(config: config)
        self.forums = ForumsClient(config: config)
        self.identityProfiles = IdentityProfilesClient(config: config)
        self.invoices = InvoicesClient(config: config)
        self.leads = LeadsClient(config: config)
        self.ledgerAccounts = LedgerAccountsClient(config: config)
        self.media = MediaClient(config: config)
        self.members = MembersClient(config: config)
        self.memberships = MembershipsClient(config: config)
        self.messages = MessagesClient(config: config)
        self.notifications = NotificationsClient(config: config)
        self.partners = PartnersClient(config: config)
        self.paymentMethodDomains = PaymentMethodDomainsClient(config: config)
        self.paymentMethods = PaymentMethodsClient(config: config)
        self.payments = PaymentsClient(config: config)
        self.payoutAccounts = PayoutAccountsClient(config: config)
        self.payoutMethods = PayoutMethodsClient(config: config)
        self.payouts = PayoutsClient(config: config)
        self.people = PeopleClient(config: config)
        self.permissions = PermissionsClient(config: config)
        self.plans = PlansClient(config: config)
        self.products = ProductsClient(config: config)
        self.promoCodes = PromoCodesClient(config: config)
        self.reactions = ReactionsClient(config: config)
        self.recommendedActions = RecommendedActionsClient(config: config)
        self.refunds = RefundsClient(config: config)
        self.resolutionCenterCases = ResolutionCenterCasesClient(config: config)
        self.reviews = ReviewsClient(config: config)
        self.setupIntents = SetupIntentsClient(config: config)
        self.shipments = ShipmentsClient(config: config)
        self.socialAccounts = SocialAccountsClient(config: config)
        self.stats = StatsClient(config: config)
        self.supportChannels = SupportChannelsClient(config: config)
        self.swaps = SwapsClient(config: config)
        self.teamMembers = TeamMembersClient(config: config)
        self.topups = TopupsClient(config: config)
        self.transfers = TransfersClient(config: config)
        self.users = UsersClient(config: config)
        self.verifications = VerificationsClient(config: config)
        self.webhooks = WebhooksClient(config: config)
        self.withdrawals = WithdrawalsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }
}