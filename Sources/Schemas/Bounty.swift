import Foundation

public struct Bounty: Codable, Hashable, Sendable {
    public let acceptedDeliverableTypes: [BountyAcceptedDeliverableTypesItem]
    /// Submissions accepted so far.
    public let acceptedSubmissionsCount: Int
    /// Number of submissions that can be accepted (winner slots).
    public let acceptedSubmissionsLimit: Int
    /// How many winner slots one worker can win. Defaults to `1`. Wins plus proofs awaiting review never exceed this number, and a worker runs one attempt at a time. Cannot exceed `accepted_submissions_limit`.
    public let acceptedSubmissionsPerUserLimit: Int
    public let activeProofLivestreamFeeds: [BountyActiveLivestreamFeed]
    /// What a referrer earns per accepted submission when the worker arrived through their affiliate link, in whole currency units, at the standard platform fee rate. Taken out of the worker's post-fee reward rather than added on top. `0` when the bounty pays no affiliate share, including bounties tied to no account, which cannot record a referral.
    public let affiliateShareAmount: Double
    public let allowedCountryCodes: [String]
    /// Submissions delivered and waiting on review. A subset of `unresolved_submissions_count`, which also counts attempts still in progress.
    public let awaitingReviewSubmissionsCount: Int
    /// Total gross budget committed to the bounty: `gross_reward_amount` times `accepted_submissions_limit`.
    public let budgetAmount: Double
    /// What the poster wants the work to achieve, declared once at create. `null` for bounties created before the taxonomy rolled out.
    public let businessGoalType: Nullable<BountyBusinessGoalType>
    /// When cancellation was requested, as an ISO 8601 timestamp. On a `closed` bounty this means the cancel is pending: submissions are stopped and the bounty cancels once in-flight submissions resolve. On a `canceled` bounty it records when the cancellation was requested. `null` when no cancellation was ever requested.
    public let cancelRequestedAt: Nullable<String>
    /// The technical contract footage must be recorded against. Present only on `data_capture` bounties; `null` for every other goal type.
    public let captureSpec: Nullable<CaptureSpec>
    /// When the bounty was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Currency for all amounts on the bounty, as a lowercase ISO 4217 code.
    public let currency: BountyCurrency
    /// Submissions reviewed and turned down.
    public let deniedSubmissionsCount: Int
    /// Full task instructions shown to workers.
    public let description: String
    /// Experience the bounty's discussion thread lives in, prefixed `exp_`. Read this — not `experience_id` — to open the thread: a platform-wide bounty has no hosting experience of its own but its discussion still lives in one.
    public let discussionExperienceId: Nullable<String>
    /// Forum feed containing the bounty's discussion thread. `null` for a bounty with no forum post.
    public let discussionFeedId: Nullable<String>
    /// Forum post anchoring the bounty's discussion thread. Read together with `discussion_experience_id` to address the thread. `null` for a bounty with no forum post.
    public let discussionPostId: Nullable<String>
    /// Experience the bounty is hosted in, prefixed `exp_`. `null` for platform-wide bounties; may belong to a different account than the funder.
    public let experienceId: Nullable<String>
    /// Account whose balance funds the bounty pool, or `null` when a user funds it personally. May differ from the account hosting `experience_id`.
    public let fundingAccount: Nullable<AccountSummary>
    /// Gross amount paid out from the bounty pool across accepted submissions — worker payouts, platform fees, and affiliate shares together. Tips and reviewer rewards are excluded.
    public let grossPaidOutAmount: Double
    /// Gross bounty-pool amount allocated per accepted submission, in whole currency units.
    public let grossRewardAmount: Double
    /// Account hosting the bounty's forum — the one whose `route` and `experience_id` address its discussion thread, and where its submissions dashboard lives. `null` for a platform-wide bounty with no host. May differ from `funding_account`.
    public let hostingAccount: Nullable<StorefrontAccount>
    /// Bounty ID, prefixed `bnty_`.
    public let id: String
    /// Total verified footage a submission must accumulate before it can be submitted, in seconds. Always a whole number of hours. Present only on `data_capture` bounties — it is what `net_reward_amount` pays for, so rate displays divide by it. `null` for every other goal type.
    public let minTotalVerifiedDurationSeconds: Nullable<Int>
    /// What a worker is quoted per accepted submission after the platform fee, in whole currency units. The exact post-fee figure, at the standard platform fee rate — a worker who locked a different rate, or who arrived through an affiliate link, is paid a different amount.
    public let netRewardAmount: Double
    /// User who posted the bounty — the account owner when created with an account API key.
    public let poster: UserSummary
    /// How often the schedule creates a new bounty. Each occurrence is a separate bounty; the original is not republished.
    public let scheduledFrequency: Nullable<BountyScheduledFrequency>
    /// When a scheduled bounty will publish, as an ISO 8601 timestamp. `null` once published, for bounties that were never scheduled, and for terminally failed drafts parked for manual rescheduling.
    public let scheduledPublishAt: Nullable<String>
    /// Unfilled winner capacity: `accepted_submissions_limit` minus `accepted_submissions_count`, clamped to zero. Not on its own a signal that the bounty accepts new claims — read `status` for that: only an `open` bounty takes new submissions.
    public let spotsRemaining: Int
    /// Lifecycle state. `scheduled` bounties are unpublished drafts, visible to their poster and the account's authorized managers; `open` bounties accept new submissions; `closed` bounties are live but no longer accept new submissions; `completed` bounties paid out every winner slot; `canceled` bounties ended before filling their slots.
    public let status: BountyStatus
    /// When new submissions stopped being accepted, as an ISO 8601 timestamp. Set when a cancellation is requested on a bounty with work in flight, so in-flight submissions can resolve before the bounty cancels. `null` when submissions were never stopped — including completed bounties that simply filled every winner slot.
    public let submissionsClosedAt: Nullable<String>
    /// Short name of the task shown to workers.
    public let title: String
    /// Submissions still awaiting an outcome: in progress or pending review.
    public let unresolvedSubmissionsCount: Int
    /// When the bounty was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// How many winner slots the authenticated user has already won on this bounty. Read against `accepted_submissions_per_user_limit` to show a worker their remaining allowance. `0` when the request has no authenticated user.
    public let viewerAcceptedSubmissionsCount: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        acceptedDeliverableTypes: [BountyAcceptedDeliverableTypesItem],
        acceptedSubmissionsCount: Int,
        acceptedSubmissionsLimit: Int,
        acceptedSubmissionsPerUserLimit: Int,
        activeProofLivestreamFeeds: [BountyActiveLivestreamFeed],
        affiliateShareAmount: Double,
        allowedCountryCodes: [String],
        awaitingReviewSubmissionsCount: Int,
        budgetAmount: Double,
        businessGoalType: Nullable<BountyBusinessGoalType>,
        cancelRequestedAt: Nullable<String>,
        captureSpec: Nullable<CaptureSpec>,
        createdAt: String,
        currency: BountyCurrency,
        deniedSubmissionsCount: Int,
        description: String,
        discussionExperienceId: Nullable<String>,
        discussionFeedId: Nullable<String>,
        discussionPostId: Nullable<String>,
        experienceId: Nullable<String>,
        fundingAccount: Nullable<AccountSummary>,
        grossPaidOutAmount: Double,
        grossRewardAmount: Double,
        hostingAccount: Nullable<StorefrontAccount>,
        id: String,
        minTotalVerifiedDurationSeconds: Nullable<Int>,
        netRewardAmount: Double,
        poster: UserSummary,
        scheduledFrequency: Nullable<BountyScheduledFrequency>,
        scheduledPublishAt: Nullable<String>,
        spotsRemaining: Int,
        status: BountyStatus,
        submissionsClosedAt: Nullable<String>,
        title: String,
        unresolvedSubmissionsCount: Int,
        updatedAt: String,
        viewerAcceptedSubmissionsCount: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.acceptedDeliverableTypes = acceptedDeliverableTypes
        self.acceptedSubmissionsCount = acceptedSubmissionsCount
        self.acceptedSubmissionsLimit = acceptedSubmissionsLimit
        self.acceptedSubmissionsPerUserLimit = acceptedSubmissionsPerUserLimit
        self.activeProofLivestreamFeeds = activeProofLivestreamFeeds
        self.affiliateShareAmount = affiliateShareAmount
        self.allowedCountryCodes = allowedCountryCodes
        self.awaitingReviewSubmissionsCount = awaitingReviewSubmissionsCount
        self.budgetAmount = budgetAmount
        self.businessGoalType = businessGoalType
        self.cancelRequestedAt = cancelRequestedAt
        self.captureSpec = captureSpec
        self.createdAt = createdAt
        self.currency = currency
        self.deniedSubmissionsCount = deniedSubmissionsCount
        self.description = description
        self.discussionExperienceId = discussionExperienceId
        self.discussionFeedId = discussionFeedId
        self.discussionPostId = discussionPostId
        self.experienceId = experienceId
        self.fundingAccount = fundingAccount
        self.grossPaidOutAmount = grossPaidOutAmount
        self.grossRewardAmount = grossRewardAmount
        self.hostingAccount = hostingAccount
        self.id = id
        self.minTotalVerifiedDurationSeconds = minTotalVerifiedDurationSeconds
        self.netRewardAmount = netRewardAmount
        self.poster = poster
        self.scheduledFrequency = scheduledFrequency
        self.scheduledPublishAt = scheduledPublishAt
        self.spotsRemaining = spotsRemaining
        self.status = status
        self.submissionsClosedAt = submissionsClosedAt
        self.title = title
        self.unresolvedSubmissionsCount = unresolvedSubmissionsCount
        self.updatedAt = updatedAt
        self.viewerAcceptedSubmissionsCount = viewerAcceptedSubmissionsCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.acceptedDeliverableTypes = try container.decode([BountyAcceptedDeliverableTypesItem].self, forKey: .acceptedDeliverableTypes)
        self.acceptedSubmissionsCount = try container.decode(Int.self, forKey: .acceptedSubmissionsCount)
        self.acceptedSubmissionsLimit = try container.decode(Int.self, forKey: .acceptedSubmissionsLimit)
        self.acceptedSubmissionsPerUserLimit = try container.decode(Int.self, forKey: .acceptedSubmissionsPerUserLimit)
        self.activeProofLivestreamFeeds = try container.decode([BountyActiveLivestreamFeed].self, forKey: .activeProofLivestreamFeeds)
        self.affiliateShareAmount = try container.decode(Double.self, forKey: .affiliateShareAmount)
        self.allowedCountryCodes = try container.decode([String].self, forKey: .allowedCountryCodes)
        self.awaitingReviewSubmissionsCount = try container.decode(Int.self, forKey: .awaitingReviewSubmissionsCount)
        self.budgetAmount = try container.decode(Double.self, forKey: .budgetAmount)
        self.businessGoalType = try container.decode(Nullable<BountyBusinessGoalType>.self, forKey: .businessGoalType)
        self.cancelRequestedAt = try container.decode(Nullable<String>.self, forKey: .cancelRequestedAt)
        self.captureSpec = try container.decode(Nullable<CaptureSpec>.self, forKey: .captureSpec)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(BountyCurrency.self, forKey: .currency)
        self.deniedSubmissionsCount = try container.decode(Int.self, forKey: .deniedSubmissionsCount)
        self.description = try container.decode(String.self, forKey: .description)
        self.discussionExperienceId = try container.decode(Nullable<String>.self, forKey: .discussionExperienceId)
        self.discussionFeedId = try container.decode(Nullable<String>.self, forKey: .discussionFeedId)
        self.discussionPostId = try container.decode(Nullable<String>.self, forKey: .discussionPostId)
        self.experienceId = try container.decode(Nullable<String>.self, forKey: .experienceId)
        self.fundingAccount = try container.decode(Nullable<AccountSummary>.self, forKey: .fundingAccount)
        self.grossPaidOutAmount = try container.decode(Double.self, forKey: .grossPaidOutAmount)
        self.grossRewardAmount = try container.decode(Double.self, forKey: .grossRewardAmount)
        self.hostingAccount = try container.decode(Nullable<StorefrontAccount>.self, forKey: .hostingAccount)
        self.id = try container.decode(String.self, forKey: .id)
        self.minTotalVerifiedDurationSeconds = try container.decode(Nullable<Int>.self, forKey: .minTotalVerifiedDurationSeconds)
        self.netRewardAmount = try container.decode(Double.self, forKey: .netRewardAmount)
        self.poster = try container.decode(UserSummary.self, forKey: .poster)
        self.scheduledFrequency = try container.decode(Nullable<BountyScheduledFrequency>.self, forKey: .scheduledFrequency)
        self.scheduledPublishAt = try container.decode(Nullable<String>.self, forKey: .scheduledPublishAt)
        self.spotsRemaining = try container.decode(Int.self, forKey: .spotsRemaining)
        self.status = try container.decode(BountyStatus.self, forKey: .status)
        self.submissionsClosedAt = try container.decode(Nullable<String>.self, forKey: .submissionsClosedAt)
        self.title = try container.decode(String.self, forKey: .title)
        self.unresolvedSubmissionsCount = try container.decode(Int.self, forKey: .unresolvedSubmissionsCount)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.viewerAcceptedSubmissionsCount = try container.decode(Int.self, forKey: .viewerAcceptedSubmissionsCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.acceptedDeliverableTypes, forKey: .acceptedDeliverableTypes)
        try container.encode(self.acceptedSubmissionsCount, forKey: .acceptedSubmissionsCount)
        try container.encode(self.acceptedSubmissionsLimit, forKey: .acceptedSubmissionsLimit)
        try container.encode(self.acceptedSubmissionsPerUserLimit, forKey: .acceptedSubmissionsPerUserLimit)
        try container.encode(self.activeProofLivestreamFeeds, forKey: .activeProofLivestreamFeeds)
        try container.encode(self.affiliateShareAmount, forKey: .affiliateShareAmount)
        try container.encode(self.allowedCountryCodes, forKey: .allowedCountryCodes)
        try container.encode(self.awaitingReviewSubmissionsCount, forKey: .awaitingReviewSubmissionsCount)
        try container.encode(self.budgetAmount, forKey: .budgetAmount)
        try container.encode(self.businessGoalType, forKey: .businessGoalType)
        try container.encode(self.cancelRequestedAt, forKey: .cancelRequestedAt)
        try container.encode(self.captureSpec, forKey: .captureSpec)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.deniedSubmissionsCount, forKey: .deniedSubmissionsCount)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.discussionExperienceId, forKey: .discussionExperienceId)
        try container.encode(self.discussionFeedId, forKey: .discussionFeedId)
        try container.encode(self.discussionPostId, forKey: .discussionPostId)
        try container.encode(self.experienceId, forKey: .experienceId)
        try container.encode(self.fundingAccount, forKey: .fundingAccount)
        try container.encode(self.grossPaidOutAmount, forKey: .grossPaidOutAmount)
        try container.encode(self.grossRewardAmount, forKey: .grossRewardAmount)
        try container.encode(self.hostingAccount, forKey: .hostingAccount)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.minTotalVerifiedDurationSeconds, forKey: .minTotalVerifiedDurationSeconds)
        try container.encode(self.netRewardAmount, forKey: .netRewardAmount)
        try container.encode(self.poster, forKey: .poster)
        try container.encode(self.scheduledFrequency, forKey: .scheduledFrequency)
        try container.encode(self.scheduledPublishAt, forKey: .scheduledPublishAt)
        try container.encode(self.spotsRemaining, forKey: .spotsRemaining)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.submissionsClosedAt, forKey: .submissionsClosedAt)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.unresolvedSubmissionsCount, forKey: .unresolvedSubmissionsCount)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.viewerAcceptedSubmissionsCount, forKey: .viewerAcceptedSubmissionsCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case acceptedDeliverableTypes = "accepted_deliverable_types"
        case acceptedSubmissionsCount = "accepted_submissions_count"
        case acceptedSubmissionsLimit = "accepted_submissions_limit"
        case acceptedSubmissionsPerUserLimit = "accepted_submissions_per_user_limit"
        case activeProofLivestreamFeeds = "active_proof_livestream_feeds"
        case affiliateShareAmount = "affiliate_share_amount"
        case allowedCountryCodes = "allowed_country_codes"
        case awaitingReviewSubmissionsCount = "awaiting_review_submissions_count"
        case budgetAmount = "budget_amount"
        case businessGoalType = "business_goal_type"
        case cancelRequestedAt = "cancel_requested_at"
        case captureSpec = "capture_spec"
        case createdAt = "created_at"
        case currency
        case deniedSubmissionsCount = "denied_submissions_count"
        case description
        case discussionExperienceId = "discussion_experience_id"
        case discussionFeedId = "discussion_feed_id"
        case discussionPostId = "discussion_post_id"
        case experienceId = "experience_id"
        case fundingAccount = "funding_account"
        case grossPaidOutAmount = "gross_paid_out_amount"
        case grossRewardAmount = "gross_reward_amount"
        case hostingAccount = "hosting_account"
        case id
        case minTotalVerifiedDurationSeconds = "min_total_verified_duration_seconds"
        case netRewardAmount = "net_reward_amount"
        case poster
        case scheduledFrequency = "scheduled_frequency"
        case scheduledPublishAt = "scheduled_publish_at"
        case spotsRemaining = "spots_remaining"
        case status
        case submissionsClosedAt = "submissions_closed_at"
        case title
        case unresolvedSubmissionsCount = "unresolved_submissions_count"
        case updatedAt = "updated_at"
        case viewerAcceptedSubmissionsCount = "viewer_accepted_submissions_count"
    }
}