import Foundation

/// A resolution event is a message or action within a resolution case, such as a response, escalation, or status change.
public struct ResolutionCenterCaseLegacyResolutionEventsItem: Codable, Hashable, Sendable {
    /// The type of action recorded in this event.
    public let action: ResolutionCenterCaseActions
    /// The datetime the resolution event was created.
    public let createdAt: Date
    /// The message body or additional context provided with this resolution event. Null if no details were included.
    public let details: Nullable<String>
    /// The unique identifier for the resolution event.
    public let id: String
    /// The party who performed this action.
    public let reporterType: ResolutionCenterCaseReporters
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: ResolutionCenterCaseActions,
        createdAt: Date,
        details: Nullable<String>,
        id: String,
        reporterType: ResolutionCenterCaseReporters,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.createdAt = createdAt
        self.details = details
        self.id = id
        self.reporterType = reporterType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(ResolutionCenterCaseActions.self, forKey: .action)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.details = try container.decode(Nullable<String>.self, forKey: .details)
        self.id = try container.decode(String.self, forKey: .id)
        self.reporterType = try container.decode(ResolutionCenterCaseReporters.self, forKey: .reporterType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.details, forKey: .details)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.reporterType, forKey: .reporterType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case createdAt = "created_at"
        case details
        case id
        case reporterType = "reporter_type"
    }
}