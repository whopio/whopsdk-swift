import Foundation

/// A resolution center case is a dispute or support case between a user and a company, tracking the issue, status, and outcome.
public struct PaymentResolutionsItem: Codable, Hashable, Sendable {
    /// Whether the customer has filed an appeal after the initial resolution decision.
    public let customerAppealed: Bool
    /// The list of actions currently available to the customer.
    public let customerResponseActions: [ResolutionCenterCaseCustomerResponses]
    /// The deadline by which the next response is required. Null if no deadline is currently active. As a Unix timestamp.
    public let dueDate: Nullable<Date>
    /// The unique identifier for the resolution.
    public let id: String
    /// The category of the dispute.
    public let issue: ResolutionCenterCaseIssueTypes
    /// Whether the merchant has filed an appeal after the initial resolution decision.
    public let merchantAppealed: Bool
    /// The list of actions currently available to the merchant.
    public let merchantResponseActions: [ResolutionCenterCaseMerchantResponses]
    /// The list of actions currently available to the Whop platform for moderating this resolution.
    public let platformResponseActions: [ResolutionCenterCasePlatformResponses]
    /// The current status of the resolution case, indicating which party needs to respond or if the case is closed.
    public let status: ResolutionCenterCaseStatuses
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        customerAppealed: Bool,
        customerResponseActions: [ResolutionCenterCaseCustomerResponses],
        dueDate: Nullable<Date>,
        id: String,
        issue: ResolutionCenterCaseIssueTypes,
        merchantAppealed: Bool,
        merchantResponseActions: [ResolutionCenterCaseMerchantResponses],
        platformResponseActions: [ResolutionCenterCasePlatformResponses],
        status: ResolutionCenterCaseStatuses,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.customerAppealed = customerAppealed
        self.customerResponseActions = customerResponseActions
        self.dueDate = dueDate
        self.id = id
        self.issue = issue
        self.merchantAppealed = merchantAppealed
        self.merchantResponseActions = merchantResponseActions
        self.platformResponseActions = platformResponseActions
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.customerAppealed = try container.decode(Bool.self, forKey: .customerAppealed)
        self.customerResponseActions = try container.decode([ResolutionCenterCaseCustomerResponses].self, forKey: .customerResponseActions)
        self.dueDate = try container.decode(Nullable<Date>.self, forKey: .dueDate)
        self.id = try container.decode(String.self, forKey: .id)
        self.issue = try container.decode(ResolutionCenterCaseIssueTypes.self, forKey: .issue)
        self.merchantAppealed = try container.decode(Bool.self, forKey: .merchantAppealed)
        self.merchantResponseActions = try container.decode([ResolutionCenterCaseMerchantResponses].self, forKey: .merchantResponseActions)
        self.platformResponseActions = try container.decode([ResolutionCenterCasePlatformResponses].self, forKey: .platformResponseActions)
        self.status = try container.decode(ResolutionCenterCaseStatuses.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.customerAppealed, forKey: .customerAppealed)
        try container.encode(self.customerResponseActions, forKey: .customerResponseActions)
        try container.encode(self.dueDate, forKey: .dueDate)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issue, forKey: .issue)
        try container.encode(self.merchantAppealed, forKey: .merchantAppealed)
        try container.encode(self.merchantResponseActions, forKey: .merchantResponseActions)
        try container.encode(self.platformResponseActions, forKey: .platformResponseActions)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case customerAppealed = "customer_appealed"
        case customerResponseActions = "customer_response_actions"
        case dueDate = "due_date"
        case id
        case issue
        case merchantAppealed = "merchant_appealed"
        case merchantResponseActions = "merchant_response_actions"
        case platformResponseActions = "platform_response_actions"
        case status
    }
}