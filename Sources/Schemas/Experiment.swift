import Foundation

public struct Experiment: Codable, Hashable, Sendable {
    /// Owning account ID.
    public let accountId: String
    /// Assignment hashes UTF-8 seed + subject ID with CRC32 modulo 100 and selects the stored end-exclusive range.
    public let assignmentSeed: String
    /// Randomization unit — `user` buckets each user independently, `account` buckets whole accounts (every user of an account gets the same arm). `null` for feature flags.
    public let bucketBy: Nullable<ExperimentBucketBy>?
    /// Revision of the serving configuration. Increments on every configuration change, so a cached definition with a lower revision is stale. Does not change the assignment seed.
    public let configurationRevision: Int
    public let control: ExperimentControl
    /// When the experiment was created, as an ISO 8601 timestamp.
    public let createdAt: Nullable<String>?
    /// ID of the user who created the experiment, prefixed `user_`. `null` for experiments created before creators were recorded.
    public let createdBy: Nullable<String>?
    /// When the experiment stopped collecting data, as an ISO 8601 timestamp. `null` while still running.
    public let endedAt: Nullable<String>?
    /// `true` when this was created as a feature flag rather than a full experiment. Feature flags share the same evaluation API but do not collect metric results.
    public let featureFlagOnly: Nullable<Bool>?
    /// What was learned and why this outcome, recorded when the experiment was ended. `null` until then.
    public let findings: Nullable<String>?
    /// Developer-chosen handle referenced from code. Anywhere the API takes an experiment identifier, the `expt_` id and the flag_key are interchangeable.
    public let flagKey: String
    /// Hypothesis for this experiment. `null` when none is set, and always `null` for feature flags.
    public let hypothesis: Nullable<String>?
    /// Unique identifier for the experiment, prefixed `expt_`.
    public let id: String
    /// Key-value pairs attached when the experiment was created. Empty when none were set.
    public let metadata: [String: String]?
    /// Human-readable display name.
    public let name: String
    /// Resource owned by the account that this experiment is bound to, such as an app or product. `null` when unbound. Fixed once the experiment first activates.
    public let relatedResource: ExperimentResourceReference
    /// When the experiment began collecting data, as an ISO 8601 timestamp. `null` for drafts.
    public let startedAt: Nullable<String>?
    /// Lifecycle state. `draft` — not yet live; `active` — currently running; `paused` — traffic paused; `ended` — concluded.
    public let status: ExperimentStatus
    /// Rules gating who is in the experiment at all. Conditions within a rule are AND-ed, rules are OR-ed, and `exclude` rules always win. Empty means everyone qualifies.
    public let targetingRules: [ExperimentTargetingRulesItem]
    public let updatedAt: Nullable<String>
    /// Treatment arms. Users outside every arm's allocation form the implicit `control` group. Weights only ever grow and arms are never removed, so a user moves from control into a treatment at most once.
    public let variants: [ExperimentVariantsItem]
    /// The treatment that won, set when the experiment was ended. Once set, every evaluation returns this arm to every caller regardless of targeting or allocation, and no further exposures are recorded. `null` means control won — an ended experiment with no winning arm evaluates to `control` for everyone. Always `null` for feature flags, which simply evaluate to disabled once ended.
    public let winningArm: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        assignmentSeed: String,
        bucketBy: Nullable<ExperimentBucketBy>? = nil,
        configurationRevision: Int,
        control: ExperimentControl,
        createdAt: Nullable<String>? = nil,
        createdBy: Nullable<String>? = nil,
        endedAt: Nullable<String>? = nil,
        featureFlagOnly: Nullable<Bool>? = nil,
        findings: Nullable<String>? = nil,
        flagKey: String,
        hypothesis: Nullable<String>? = nil,
        id: String,
        metadata: [String: String]? = nil,
        name: String,
        relatedResource: ExperimentResourceReference,
        startedAt: Nullable<String>? = nil,
        status: ExperimentStatus,
        targetingRules: [ExperimentTargetingRulesItem],
        updatedAt: Nullable<String>,
        variants: [ExperimentVariantsItem],
        winningArm: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.assignmentSeed = assignmentSeed
        self.bucketBy = bucketBy
        self.configurationRevision = configurationRevision
        self.control = control
        self.createdAt = createdAt
        self.createdBy = createdBy
        self.endedAt = endedAt
        self.featureFlagOnly = featureFlagOnly
        self.findings = findings
        self.flagKey = flagKey
        self.hypothesis = hypothesis
        self.id = id
        self.metadata = metadata
        self.name = name
        self.relatedResource = relatedResource
        self.startedAt = startedAt
        self.status = status
        self.targetingRules = targetingRules
        self.updatedAt = updatedAt
        self.variants = variants
        self.winningArm = winningArm
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.assignmentSeed = try container.decode(String.self, forKey: .assignmentSeed)
        self.bucketBy = try container.decodeNullableIfPresent(ExperimentBucketBy.self, forKey: .bucketBy)
        self.configurationRevision = try container.decode(Int.self, forKey: .configurationRevision)
        self.control = try container.decode(ExperimentControl.self, forKey: .control)
        self.createdAt = try container.decodeNullableIfPresent(String.self, forKey: .createdAt)
        self.createdBy = try container.decodeNullableIfPresent(String.self, forKey: .createdBy)
        self.endedAt = try container.decodeNullableIfPresent(String.self, forKey: .endedAt)
        self.featureFlagOnly = try container.decodeNullableIfPresent(Bool.self, forKey: .featureFlagOnly)
        self.findings = try container.decodeNullableIfPresent(String.self, forKey: .findings)
        self.flagKey = try container.decode(String.self, forKey: .flagKey)
        self.hypothesis = try container.decodeNullableIfPresent(String.self, forKey: .hypothesis)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
        self.name = try container.decode(String.self, forKey: .name)
        self.relatedResource = try container.decode(ExperimentResourceReference.self, forKey: .relatedResource)
        self.startedAt = try container.decodeNullableIfPresent(String.self, forKey: .startedAt)
        self.status = try container.decode(ExperimentStatus.self, forKey: .status)
        self.targetingRules = try container.decode([ExperimentTargetingRulesItem].self, forKey: .targetingRules)
        self.updatedAt = try container.decode(Nullable<String>.self, forKey: .updatedAt)
        self.variants = try container.decode([ExperimentVariantsItem].self, forKey: .variants)
        self.winningArm = try container.decodeNullableIfPresent(String.self, forKey: .winningArm)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.assignmentSeed, forKey: .assignmentSeed)
        try container.encodeNullableIfPresent(self.bucketBy, forKey: .bucketBy)
        try container.encode(self.configurationRevision, forKey: .configurationRevision)
        try container.encode(self.control, forKey: .control)
        try container.encodeNullableIfPresent(self.createdAt, forKey: .createdAt)
        try container.encodeNullableIfPresent(self.createdBy, forKey: .createdBy)
        try container.encodeNullableIfPresent(self.endedAt, forKey: .endedAt)
        try container.encodeNullableIfPresent(self.featureFlagOnly, forKey: .featureFlagOnly)
        try container.encodeNullableIfPresent(self.findings, forKey: .findings)
        try container.encode(self.flagKey, forKey: .flagKey)
        try container.encodeNullableIfPresent(self.hypothesis, forKey: .hypothesis)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.relatedResource, forKey: .relatedResource)
        try container.encodeNullableIfPresent(self.startedAt, forKey: .startedAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.targetingRules, forKey: .targetingRules)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.variants, forKey: .variants)
        try container.encodeNullableIfPresent(self.winningArm, forKey: .winningArm)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case assignmentSeed = "assignment_seed"
        case bucketBy = "bucket_by"
        case configurationRevision = "configuration_revision"
        case control
        case createdAt = "created_at"
        case createdBy = "created_by"
        case endedAt = "ended_at"
        case featureFlagOnly = "feature_flag_only"
        case findings
        case flagKey = "flag_key"
        case hypothesis
        case id
        case metadata
        case name
        case relatedResource = "related_resource"
        case startedAt = "started_at"
        case status
        case targetingRules = "targeting_rules"
        case updatedAt = "updated_at"
        case variants
        case winningArm = "winning_arm"
    }
}