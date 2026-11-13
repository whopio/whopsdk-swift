import Foundation

extension Requests {
    public struct UpdateExperimentsRequest: Codable, Hashable, Sendable {
        public let control: UpdateExperimentsRequestControl?
        /// Omit to leave unchanged. Send an empty string to clear it. Not accepted on feature flags. When setting it, structure it as "If we [change] for [cohort], then [measurable behavior] will [increase/decrease], resulting in [business outcome], because [evidence]. Created by [name]." same as on create.
        public let hypothesis: Nullable<String>?
        /// Resource owned by the account that this experiment is bound to, such as an app or product. `null` when unbound. Fixed once the experiment first activates.
        public let relatedResource: ExperimentResourceReference?
        /// Replace the targeting rules with this set. Omit to leave unchanged.
        public let targetingRules: [UpdateExperimentsRequestTargetingRulesItem]?
        /// Grow treatment allocation. Pass every existing treatment with an equal-or-higher weight; append new names to add arms. Weights never decrease and arms are never removed. Omit to leave unchanged.
        public let variants: [UpdateExperimentsRequestVariantsItem]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            control: UpdateExperimentsRequestControl? = nil,
            hypothesis: Nullable<String>? = nil,
            relatedResource: ExperimentResourceReference? = nil,
            targetingRules: [UpdateExperimentsRequestTargetingRulesItem]? = nil,
            variants: [UpdateExperimentsRequestVariantsItem]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.control = control
            self.hypothesis = hypothesis
            self.relatedResource = relatedResource
            self.targetingRules = targetingRules
            self.variants = variants
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.control = try container.decodeIfPresent(UpdateExperimentsRequestControl.self, forKey: .control)
            self.hypothesis = try container.decodeNullableIfPresent(String.self, forKey: .hypothesis)
            self.relatedResource = try container.decodeIfPresent(ExperimentResourceReference.self, forKey: .relatedResource)
            self.targetingRules = try container.decodeIfPresent([UpdateExperimentsRequestTargetingRulesItem].self, forKey: .targetingRules)
            self.variants = try container.decodeIfPresent([UpdateExperimentsRequestVariantsItem].self, forKey: .variants)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.control, forKey: .control)
            try container.encodeNullableIfPresent(self.hypothesis, forKey: .hypothesis)
            try container.encodeIfPresent(self.relatedResource, forKey: .relatedResource)
            try container.encodeIfPresent(self.targetingRules, forKey: .targetingRules)
            try container.encodeIfPresent(self.variants, forKey: .variants)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case control
            case hypothesis
            case relatedResource = "related_resource"
            case targetingRules = "targeting_rules"
            case variants
        }
    }
}