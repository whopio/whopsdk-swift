import Foundation

extension Requests {
    public struct UpdateBountiesRequest: Codable, Hashable, Sendable {
        /// Scheduled drafts only. Number of submissions that can be accepted (winner slots).
        public let acceptedSubmissionsLimit: Nullable<Int>?
        /// How many winner slots one worker can win. Defaults to `1`. Wins plus proofs awaiting review never exceed this number, and a worker runs one attempt at a time. Cannot exceed `accepted_submissions_limit`. Editable while the bounty is still open with nothing under review.
        public let acceptedSubmissionsPerUserLimit: Nullable<Int>?
        /// Replace the countries whose residents can work the bounty, as ISO 3166 alpha-2 codes. Empty means worldwide.
        public let allowedCountryCodes: Nullable<[String]>?
        /// What the poster wants the work to achieve, declared once here.
        public let businessGoalType: UpdateBountiesRequestBusinessGoalType?
        /// New full task instructions.
        public let description: String?
        /// Scheduled drafts only. How often the schedule creates a new bounty.
        public let frequency: UpdateBountiesRequestFrequency?
        /// Scheduled drafts only. Gross bounty-pool amount (USD) escrowed per accepted submission. The escrowed total (this times accepted_submissions_limit) must stay at least $5.
        public let grossRewardAmount: Nullable<Double>?
        /// Scheduled drafts only. New ISO 8601 time to publish the draft. Must be in the future.
        public let publishAt: Nullable<String>?
        /// Scheduled drafts only. IANA timezone for recurring occurrences.
        public let publishAtTimezone: Nullable<String>?
        /// New short name of the task.
        public let title: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            acceptedSubmissionsLimit: Nullable<Int>? = nil,
            acceptedSubmissionsPerUserLimit: Nullable<Int>? = nil,
            allowedCountryCodes: Nullable<[String]>? = nil,
            businessGoalType: UpdateBountiesRequestBusinessGoalType? = nil,
            description: String? = nil,
            frequency: UpdateBountiesRequestFrequency? = nil,
            grossRewardAmount: Nullable<Double>? = nil,
            publishAt: Nullable<String>? = nil,
            publishAtTimezone: Nullable<String>? = nil,
            title: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.acceptedSubmissionsLimit = acceptedSubmissionsLimit
            self.acceptedSubmissionsPerUserLimit = acceptedSubmissionsPerUserLimit
            self.allowedCountryCodes = allowedCountryCodes
            self.businessGoalType = businessGoalType
            self.description = description
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
            self.allowedCountryCodes = try container.decodeNullableIfPresent([String].self, forKey: .allowedCountryCodes)
            self.businessGoalType = try container.decodeIfPresent(UpdateBountiesRequestBusinessGoalType.self, forKey: .businessGoalType)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.frequency = try container.decodeIfPresent(UpdateBountiesRequestFrequency.self, forKey: .frequency)
            self.grossRewardAmount = try container.decodeNullableIfPresent(Double.self, forKey: .grossRewardAmount)
            self.publishAt = try container.decodeNullableIfPresent(String.self, forKey: .publishAt)
            self.publishAtTimezone = try container.decodeNullableIfPresent(String.self, forKey: .publishAtTimezone)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.acceptedSubmissionsLimit, forKey: .acceptedSubmissionsLimit)
            try container.encodeNullableIfPresent(self.acceptedSubmissionsPerUserLimit, forKey: .acceptedSubmissionsPerUserLimit)
            try container.encodeNullableIfPresent(self.allowedCountryCodes, forKey: .allowedCountryCodes)
            try container.encodeIfPresent(self.businessGoalType, forKey: .businessGoalType)
            try container.encodeIfPresent(self.description, forKey: .description)
            try container.encodeIfPresent(self.frequency, forKey: .frequency)
            try container.encodeNullableIfPresent(self.grossRewardAmount, forKey: .grossRewardAmount)
            try container.encodeNullableIfPresent(self.publishAt, forKey: .publishAt)
            try container.encodeNullableIfPresent(self.publishAtTimezone, forKey: .publishAtTimezone)
            try container.encodeIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case acceptedSubmissionsLimit = "accepted_submissions_limit"
            case acceptedSubmissionsPerUserLimit = "accepted_submissions_per_user_limit"
            case allowedCountryCodes = "allowed_country_codes"
            case businessGoalType = "business_goal_type"
            case description
            case frequency
            case grossRewardAmount = "gross_reward_amount"
            case publishAt = "publish_at"
            case publishAtTimezone = "publish_at_timezone"
            case title
        }
    }
}