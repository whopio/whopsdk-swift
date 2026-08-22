import Foundation

public struct ResolutionEvent: Codable, Hashable, Sendable {
    /// The action recorded in this event.
    public let action: ResolutionEventAction
    public let attachments: [ResolutionAttachment]
    /// When the event occurred, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The message body or additional context provided with the event.
    public let details: Nullable<String>
    /// Unique identifier for the event, prefixed `revt_`.
    public let id: String
    /// The party that performed the action.
    public let reporterType: ResolutionEventReporterType
    /// Whether the customer can see this event in the timeline.
    public let viewableByCustomer: Bool
    /// Whether the merchant can see this event in the timeline.
    public let viewableByMerchant: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: ResolutionEventAction,
        attachments: [ResolutionAttachment],
        createdAt: String,
        details: Nullable<String>,
        id: String,
        reporterType: ResolutionEventReporterType,
        viewableByCustomer: Bool,
        viewableByMerchant: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.attachments = attachments
        self.createdAt = createdAt
        self.details = details
        self.id = id
        self.reporterType = reporterType
        self.viewableByCustomer = viewableByCustomer
        self.viewableByMerchant = viewableByMerchant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(ResolutionEventAction.self, forKey: .action)
        self.attachments = try container.decode([ResolutionAttachment].self, forKey: .attachments)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.details = try container.decode(Nullable<String>.self, forKey: .details)
        self.id = try container.decode(String.self, forKey: .id)
        self.reporterType = try container.decode(ResolutionEventReporterType.self, forKey: .reporterType)
        self.viewableByCustomer = try container.decode(Bool.self, forKey: .viewableByCustomer)
        self.viewableByMerchant = try container.decode(Bool.self, forKey: .viewableByMerchant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.attachments, forKey: .attachments)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.details, forKey: .details)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.reporterType, forKey: .reporterType)
        try container.encode(self.viewableByCustomer, forKey: .viewableByCustomer)
        try container.encode(self.viewableByMerchant, forKey: .viewableByMerchant)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case attachments
        case createdAt = "created_at"
        case details
        case id
        case reporterType = "reporter_type"
        case viewableByCustomer = "viewable_by_customer"
        case viewableByMerchant = "viewable_by_merchant"
    }
}