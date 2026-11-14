import Foundation

extension Requests {
    public struct CreateExperimentsRequest: Codable, Hashable, Sendable {
        /// Owning account ID. Required; ownership cannot change.
        public let accountId: String
        /// Randomization unit, and the only identity the assignment is keyed on — evaluation fails rather than falling back to another. `user` (default) uses `subject[user_id]`; `account` uses `subject[account_id]`, so every user of an account gets the same arm; `anonymous` uses the anonymous id and survives sign-in. Fixed after creation.
        public let bucketBy: CreateExperimentsRequestBucketBy?
        public let control: CreateExperimentsRequestControl?
        /// When `true`, creates a binary feature flag rather than a full experiment. Feature flags expose the same evaluation API but do not collect metric results. Defaults to `false`.
        public let featureFlagOnly: Bool?
        /// Developer-chosen handle referenced from code, used in evaluation and results calls. Interchangeable with the returned `expt_` id anywhere the API takes an experiment identifier.
        public let flagKey: String
        /// Required for full experiments; rejected on feature flags. Structure it as "If we [change] for [cohort], then [measurable behavior] will [increase/decrease], resulting in [business outcome], because [evidence]. Created by [name]." Evidence should be something real — a baseline number, a funnel breakdown — not a guess, and [name] is you, not something to leave blank.
        public let hypothesis: Nullable<String>?
        /// Up to 20 key-value pairs you can attach to the experiment for your own use, such as which pages it changes. Keys are at most 40 characters and values at most 500.
        public let metadata: [String: String]?
        /// Human-readable display name. Defaults to `flag_key` when omitted.
        public let name: String?
        /// Resource owned by the account that this experiment is bound to, such as an app or product. `null` when unbound. Fixed once the experiment first activates.
        public let relatedResource: ExperimentResourceReference?
        /// Rules that determine which subjects qualify for the experiment.
        public let targetingRules: [CreateExperimentsRequestTargetingRulesItem]?
        /// Treatment arms to create. Users outside every arm form the implicit `control` group. Required unless `feature_flag_only` is `true`.
        public let variants: [CreateExperimentsRequestVariantsItem]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            bucketBy: CreateExperimentsRequestBucketBy? = nil,
            control: CreateExperimentsRequestControl? = nil,
            featureFlagOnly: Bool? = nil,
            flagKey: String,
            hypothesis: Nullable<String>? = nil,
            metadata: [String: String]? = nil,
            name: String? = nil,
            relatedResource: ExperimentResourceReference? = nil,
            targetingRules: [CreateExperimentsRequestTargetingRulesItem]? = nil,
            variants: [CreateExperimentsRequestVariantsItem]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.bucketBy = bucketBy
            self.control = control
            self.featureFlagOnly = featureFlagOnly
            self.flagKey = flagKey
            self.hypothesis = hypothesis
            self.metadata = metadata
            self.name = name
            self.relatedResource = relatedResource
            self.targetingRules = targetingRules
            self.variants = variants
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.bucketBy = try container.decodeIfPresent(CreateExperimentsRequestBucketBy.self, forKey: .bucketBy)
            self.control = try container.decodeIfPresent(CreateExperimentsRequestControl.self, forKey: .control)
            self.featureFlagOnly = try container.decodeIfPresent(Bool.self, forKey: .featureFlagOnly)
            self.flagKey = try container.decode(String.self, forKey: .flagKey)
            self.hypothesis = try container.decodeNullableIfPresent(String.self, forKey: .hypothesis)
            self.metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.relatedResource = try container.decodeIfPresent(ExperimentResourceReference.self, forKey: .relatedResource)
            self.targetingRules = try container.decodeIfPresent([CreateExperimentsRequestTargetingRulesItem].self, forKey: .targetingRules)
            self.variants = try container.decodeIfPresent([CreateExperimentsRequestVariantsItem].self, forKey: .variants)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.bucketBy, forKey: .bucketBy)
            try container.encodeIfPresent(self.control, forKey: .control)
            try container.encodeIfPresent(self.featureFlagOnly, forKey: .featureFlagOnly)
            try container.encode(self.flagKey, forKey: .flagKey)
            try container.encodeNullableIfPresent(self.hypothesis, forKey: .hypothesis)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.relatedResource, forKey: .relatedResource)
            try container.encodeIfPresent(self.targetingRules, forKey: .targetingRules)
            try container.encodeIfPresent(self.variants, forKey: .variants)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case bucketBy = "bucket_by"
            case control
            case featureFlagOnly = "feature_flag_only"
            case flagKey = "flag_key"
            case hypothesis
            case metadata
            case name
            case relatedResource = "related_resource"
            case targetingRules = "targeting_rules"
            case variants
        }
    }
}