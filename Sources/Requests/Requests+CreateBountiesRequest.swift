import Foundation

extension Requests {
    public struct CreateBountiesRequest: Codable, Hashable, Sendable {
        /// Number of submissions that can be accepted (winner slots). Defaults to 1. The escrowed total is `gross_reward_amount` times this limit and must be at least $5.
        public let acceptedSubmissionsLimit: Nullable<Int>?
        /// How many winner slots one worker can win. Defaults to `1`. Wins plus proofs awaiting review never exceed this number, and a worker runs one attempt at a time. Cannot exceed `accepted_submissions_limit`.
        public let acceptedSubmissionsPerUserLimit: Nullable<Int>?
        /// Account whose balance funds the bounty pool (`biz_` tag). Defaults to the caller's personal balance. Requires permission to move the account's funds.
        public let accountId: Nullable<String>?
        /// Countries whose residents can work the bounty, as ISO 3166 alpha-2 codes. Empty means worldwide.
        public let allowedCountryCodes: Nullable<[String]>?
        /// What the poster wants the work to achieve, declared once here.
        public let businessGoalType: CreateBountiesRequestBusinessGoalType?
        /// Per-bounty overrides of the served capture contract. Only accepted when `business_goal_type` is `data_capture`; omitted fields keep the platform defaults, and the resulting contract is echoed back as `capture_spec` on the bounty.
        public let captureSpec: CreateBountiesRequestCaptureSpec?
        /// Full task instructions shown to workers.
        public let description: String
        /// Experience to host the bounty in (`exp_` tag). Any visibility — public for an open bounty, private for an invited one. Required unless account_id is set, in which case the bounty anchors in that account's public forum.
        public let experienceId: Nullable<String>?
        /// How often the schedule creates a new bounty. Each occurrence is a separate bounty. Defaults to `once`; only applies with `publish_at`.
        public let frequency: CreateBountiesRequestFrequency?
        /// Gross bounty-pool amount (USD) escrowed per accepted submission, in whole dollars. Platform fees and affiliate shares are paid from this amount.
        public let grossRewardAmount: Double
        /// ISO 8601 time to publish the bounty. When set, the bounty is created as a hidden draft and funded + published at this time instead of immediately.
        public let publishAt: Nullable<String>?
        /// IANA timezone for recurring occurrences. Required when publish_at is set.
        public let publishAtTimezone: Nullable<String>?
        /// Short name of the task shown to workers.
        public let title: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            acceptedSubmissionsLimit: Nullable<Int>? = nil,
            acceptedSubmissionsPerUserLimit: Nullable<Int>? = nil,
            accountId: Nullable<String>? = nil,
            allowedCountryCodes: Nullable<[String]>? = nil,
            businessGoalType: CreateBountiesRequestBusinessGoalType? = nil,
            captureSpec: CreateBountiesRequestCaptureSpec? = nil,
            description: String,
            experienceId: Nullable<String>? = nil,
            frequency: CreateBountiesRequestFrequency? = nil,
            grossRewardAmount: Double,
            publishAt: Nullable<String>? = nil,
            publishAtTimezone: Nullable<String>? = nil,
            title: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.acceptedSubmissionsLimit = acceptedSubmissionsLimit
            self.acceptedSubmissionsPerUserLimit = acceptedSubmissionsPerUserLimit
            self.accountId = accountId
            self.allowedCountryCodes = allowedCountryCodes
            self.businessGoalType = businessGoalType
            self.captureSpec = captureSpec
            self.description = description
            self.experienceId = experienceId
            self.frequency = frequency
            self.grossRewardAmount = grossRewardAmount
            self.publishAt = publishAt
            self.publishAtTimezone = publishAtTimezone
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.acceptedSubmissionsLimit = try container.decodeNullableIfPresent(Int.self, forKey: .acceptedSubmissionsLimit)
            self.acceptedSubmissionsPerUserLimit = try container.decodeNullableIfPresent(Int.self, forKey: .acceptedSubmissionsPerUserLimit)
            self.accountId = try container.decodeNullableIfPresent(String.self, forKey: .accountId)
            self.allowedCountryCodes = try container.decodeNullableIfPresent([String].self, forKey: .allowedCountryCodes)
            self.businessGoalType = try container.decodeIfPresent(CreateBountiesRequestBusinessGoalType.self, forKey: .businessGoalType)
            self.captureSpec = try container.decodeIfPresent(CreateBountiesRequestCaptureSpec.self, forKey: .captureSpec)
            self.description = try container.decode(String.self, forKey: .description)
            self.experienceId = try container.decodeNullableIfPresent(String.self, forKey: .experienceId)
            self.frequency = try container.decodeIfPresent(CreateBountiesRequestFrequency.self, forKey: .frequency)
            self.grossRewardAmount = try container.decode(Double.self, forKey: .grossRewardAmount)
            self.publishAt = try container.decodeNullableIfPresent(String.self, forKey: .publishAt)
            self.publishAtTimezone = try container.decodeNullableIfPresent(String.self, forKey: .publishAtTimezone)
            self.title = try container.decode(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.acceptedSubmissionsLimit, forKey: .acceptedSubmissionsLimit)
            try container.encodeNullableIfPresent(self.acceptedSubmissionsPerUserLimit, forKey: .acceptedSubmissionsPerUserLimit)
            try container.encodeNullableIfPresent(self.accountId, forKey: .accountId)
            try container.encodeNullableIfPresent(self.allowedCountryCodes, forKey: .allowedCountryCodes)
            try container.encodeIfPresent(self.businessGoalType, forKey: .businessGoalType)
            try container.encodeIfPresent(self.captureSpec, forKey: .captureSpec)
            try container.encode(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.experienceId, forKey: .experienceId)
            try container.encodeIfPresent(self.frequency, forKey: .frequency)
            try container.encode(self.grossRewardAmount, forKey: .grossRewardAmount)
            try container.encodeNullableIfPresent(self.publishAt, forKey: .publishAt)
            try container.encodeNullableIfPresent(self.publishAtTimezone, forKey: .publishAtTimezone)
            try container.encode(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case acceptedSubmissionsLimit = "accepted_submissions_limit"
            case acceptedSubmissionsPerUserLimit = "accepted_submissions_per_user_limit"
            case accountId = "account_id"
            case allowedCountryCodes = "allowed_country_codes"
            case businessGoalType = "business_goal_type"
            case captureSpec = "capture_spec"
            case description
            case experienceId = "experience_id"
            case frequency
            case grossRewardAmount = "gross_reward_amount"
            case publishAt = "publish_at"
            case publishAtTimezone = "publish_at_timezone"
            case title
        }
    }
}