import Foundation

/// One entry per requested breakdown, keyed by the field it groups on. A field you did not ask for is absent.
public struct SummaryResolutionCenterCasesResponseGroups: Codable, Hashable, Sendable {
    /// How many of the matching cases ended each way. Every outcome is present, including those with a count of zero; open cases are counted in none of them.
    public let outcome: SummaryResolutionCenterCasesResponseGroupsOutcome?
    /// How many of the matching cases were opened for each reason. Every reason is present, including those with a count of zero.
    public let reason: SummaryResolutionCenterCasesResponseGroupsReason?
    /// How many of the matching cases are in each status. Every status is present, including those with a count of zero.
    public let status: SummaryResolutionCenterCasesResponseGroupsStatus?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        outcome: SummaryResolutionCenterCasesResponseGroupsOutcome? = nil,
        reason: SummaryResolutionCenterCasesResponseGroupsReason? = nil,
        status: SummaryResolutionCenterCasesResponseGroupsStatus? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.outcome = outcome
        self.reason = reason
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.outcome = try container.decodeIfPresent(SummaryResolutionCenterCasesResponseGroupsOutcome.self, forKey: .outcome)
        self.reason = try container.decodeIfPresent(SummaryResolutionCenterCasesResponseGroupsReason.self, forKey: .reason)
        self.status = try container.decodeIfPresent(SummaryResolutionCenterCasesResponseGroupsStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case outcome
        case reason
        case status
    }
}