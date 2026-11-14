import Foundation

public struct EconomicIntelligence: Codable, Hashable, Sendable {
    /// ID of the account this recommendation is for, prefixed `biz_`, or null for personal onboarding.
    public let accountId: Nullable<String>
    /// When the executed run was first marked as seen, as an ISO 8601 timestamp, or `null` if it has not been.
    public let acknowledgedAt: Nullable<String>
    /// Type of action recommended, or `null` when no type is assigned. New values may be added; handle unknown types gracefully.
    public let actionType: Nullable<String>
    /// The chat that ran the recommendation, shown only to the user who ran it, or `null` otherwise.
    public let aiChatId: Nullable<String>
    /// When the recommendation was created, as an ISO 8601 timestamp, or null for an unsaved recommendation.
    public let createdAt: Nullable<String>
    /// When the recommendation was carried out, as an ISO 8601 timestamp, or `null` if it has not been.
    public let executedAt: Nullable<String>
    public let expectedToolCalls: Nullable<[EconomicIntelligenceOperation]>
    /// Recommendation ID, prefixed `reca_`, or `create_business` for an unsaved setup recommendation. Authenticate and list again before executing an unsaved recommendation.
    public let id: String
    /// What you requested, in your own words, or `null` for recommendations generated without your input.
    public let input: Nullable<String>
    public let inputs: [EconomicIntelligenceInput]
    /// Step-by-step instructions for Whop AI, or `null` when no instructions are available.
    public let prompt: Nullable<String>
    /// Evidence and metrics supporting the recommendation, or `null` when no reasoning was provided.
    public let reasoning: Nullable<String>
    /// Where to view what the run produced, such as the published website or created product, or `null` when the result is only in the chat.
    public let resultUrl: Nullable<String>
    /// The user who started the run, prefixed `user_`, or `null` if it has not run or was started without a user, such as with an API key.
    public let runByUserId: Nullable<String>
    /// When the run ended, whether executed or incomplete, as an ISO 8601 timestamp, or `null` if it has not ended.
    public let runEndedAt: Nullable<String>
    /// When the run started, by Whop AI or the recommendation's API calls, as an ISO 8601 timestamp, or `null` if it has not run.
    public let runStartedAt: Nullable<String>
    /// How the user rated this recommendation, or `null` if they have not rated it
    public let sentiment: Nullable<EconomicIntelligenceSentiment>
    /// `queued` when awaiting generation; `pending` while generating or preparing its work; `ready` when available to run; `running` while Whop AI or the recommendation's API calls carry it out; `executed` when carried out; `incomplete` when the run ended without carrying it out; `superseded` when rejected or replaced.
    public let status: EconomicIntelligenceStatus
    /// When the recommendation was rejected or replaced, as an ISO 8601 timestamp, or `null` if neither has occurred.
    public let supersededAt: Nullable<String>
    /// Website URL selected for pixel setup, or `null` when no website was captured for this recommendation.
    public let targetUrl: Nullable<String>?
    /// Recommended action and its expected benefit, or `null` until generated.
    public let title: Nullable<String>
    /// The user's written feedback, or `null` if they have not provided any.
    public let userFeedback: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        acknowledgedAt: Nullable<String>,
        actionType: Nullable<String>,
        aiChatId: Nullable<String>,
        createdAt: Nullable<String>,
        executedAt: Nullable<String>,
        expectedToolCalls: Nullable<[EconomicIntelligenceOperation]>,
        id: String,
        input: Nullable<String>,
        inputs: [EconomicIntelligenceInput],
        prompt: Nullable<String>,
        reasoning: Nullable<String>,
        resultUrl: Nullable<String>,
        runByUserId: Nullable<String>,
        runEndedAt: Nullable<String>,
        runStartedAt: Nullable<String>,
        sentiment: Nullable<EconomicIntelligenceSentiment>,
        status: EconomicIntelligenceStatus,
        supersededAt: Nullable<String>,
        targetUrl: Nullable<String>? = nil,
        title: Nullable<String>,
        userFeedback: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.acknowledgedAt = acknowledgedAt
        self.actionType = actionType
        self.aiChatId = aiChatId
        self.createdAt = createdAt
        self.executedAt = executedAt
        self.expectedToolCalls = expectedToolCalls
        self.id = id
        self.input = input
        self.inputs = inputs
        self.prompt = prompt
        self.reasoning = reasoning
        self.resultUrl = resultUrl
        self.runByUserId = runByUserId
        self.runEndedAt = runEndedAt
        self.runStartedAt = runStartedAt
        self.sentiment = sentiment
        self.status = status
        self.supersededAt = supersededAt
        self.targetUrl = targetUrl
        self.title = title
        self.userFeedback = userFeedback
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.acknowledgedAt = try container.decode(Nullable<String>.self, forKey: .acknowledgedAt)
        self.actionType = try container.decode(Nullable<String>.self, forKey: .actionType)
        self.aiChatId = try container.decode(Nullable<String>.self, forKey: .aiChatId)
        self.createdAt = try container.decode(Nullable<String>.self, forKey: .createdAt)
        self.executedAt = try container.decode(Nullable<String>.self, forKey: .executedAt)
        self.expectedToolCalls = try container.decode(Nullable<[EconomicIntelligenceOperation]>.self, forKey: .expectedToolCalls)
        self.id = try container.decode(String.self, forKey: .id)
        self.input = try container.decode(Nullable<String>.self, forKey: .input)
        self.inputs = try container.decode([EconomicIntelligenceInput].self, forKey: .inputs)
        self.prompt = try container.decode(Nullable<String>.self, forKey: .prompt)
        self.reasoning = try container.decode(Nullable<String>.self, forKey: .reasoning)
        self.resultUrl = try container.decode(Nullable<String>.self, forKey: .resultUrl)
        self.runByUserId = try container.decode(Nullable<String>.self, forKey: .runByUserId)
        self.runEndedAt = try container.decode(Nullable<String>.self, forKey: .runEndedAt)
        self.runStartedAt = try container.decode(Nullable<String>.self, forKey: .runStartedAt)
        self.sentiment = try container.decode(Nullable<EconomicIntelligenceSentiment>.self, forKey: .sentiment)
        self.status = try container.decode(EconomicIntelligenceStatus.self, forKey: .status)
        self.supersededAt = try container.decode(Nullable<String>.self, forKey: .supersededAt)
        self.targetUrl = try container.decodeNullableIfPresent(String.self, forKey: .targetUrl)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.userFeedback = try container.decode(Nullable<String>.self, forKey: .userFeedback)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.acknowledgedAt, forKey: .acknowledgedAt)
        try container.encode(self.actionType, forKey: .actionType)
        try container.encode(self.aiChatId, forKey: .aiChatId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.executedAt, forKey: .executedAt)
        try container.encode(self.expectedToolCalls, forKey: .expectedToolCalls)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.input, forKey: .input)
        try container.encode(self.inputs, forKey: .inputs)
        try container.encode(self.prompt, forKey: .prompt)
        try container.encode(self.reasoning, forKey: .reasoning)
        try container.encode(self.resultUrl, forKey: .resultUrl)
        try container.encode(self.runByUserId, forKey: .runByUserId)
        try container.encode(self.runEndedAt, forKey: .runEndedAt)
        try container.encode(self.runStartedAt, forKey: .runStartedAt)
        try container.encode(self.sentiment, forKey: .sentiment)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.supersededAt, forKey: .supersededAt)
        try container.encodeNullableIfPresent(self.targetUrl, forKey: .targetUrl)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.userFeedback, forKey: .userFeedback)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case acknowledgedAt = "acknowledged_at"
        case actionType = "action_type"
        case aiChatId = "ai_chat_id"
        case createdAt = "created_at"
        case executedAt = "executed_at"
        case expectedToolCalls = "expected_tool_calls"
        case id
        case input
        case inputs
        case prompt
        case reasoning
        case resultUrl = "result_url"
        case runByUserId = "run_by_user_id"
        case runEndedAt = "run_ended_at"
        case runStartedAt = "run_started_at"
        case sentiment
        case status
        case supersededAt = "superseded_at"
        case targetUrl = "target_url"
        case title
        case userFeedback = "user_feedback"
    }
}