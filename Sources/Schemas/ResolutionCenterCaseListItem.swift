import Foundation

/// A resolution center case is a dispute or support case between a user and a company, tracking the issue, status, and outcome.
public struct ResolutionCenterCaseListItem: Codable, Hashable, Sendable {
    /// The company involved in this resolution case. Null if the company no longer exists.
    public let company: Nullable<ResolutionCenterCaseListItemCompany>
    /// The datetime the resolution was created.
    public let createdAt: Date
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
    /// The payment record that is the subject of this resolution case.
    public let payment: ResolutionCenterCaseListItemPayment
    /// The current status of the resolution case, indicating which party needs to respond or if the case is closed.
    public let status: ResolutionCenterCaseStatuses
    /// The datetime the resolution was last updated.
    public let updatedAt: Date
    /// The customer (buyer) who filed this resolution case.
    public let user: ResolutionCenterCaseListItemUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        company: Nullable<ResolutionCenterCaseListItemCompany>,
        createdAt: Date,
        customerAppealed: Bool,
        customerResponseActions: [ResolutionCenterCaseCustomerResponses],
        dueDate: Nullable<Date>,
        id: String,
        issue: ResolutionCenterCaseIssueTypes,
        merchantAppealed: Bool,
        merchantResponseActions: [ResolutionCenterCaseMerchantResponses],
        payment: ResolutionCenterCaseListItemPayment,
        status: ResolutionCenterCaseStatuses,
        updatedAt: Date,
        user: ResolutionCenterCaseListItemUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.company = company
        self.createdAt = createdAt
        self.customerAppealed = customerAppealed
        self.customerResponseActions = customerResponseActions
        self.dueDate = dueDate
        self.id = id
        self.issue = issue
        self.merchantAppealed = merchantAppealed
        self.merchantResponseActions = merchantResponseActions
        self.payment = payment
        self.status = status
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.company = try container.decode(Nullable<ResolutionCenterCaseListItemCompany>.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.customerAppealed = try container.decode(Bool.self, forKey: .customerAppealed)
        self.customerResponseActions = try container.decode([ResolutionCenterCaseCustomerResponses].self, forKey: .customerResponseActions)
        self.dueDate = try container.decode(Nullable<Date>.self, forKey: .dueDate)
        self.id = try container.decode(String.self, forKey: .id)
        self.issue = try container.decode(ResolutionCenterCaseIssueTypes.self, forKey: .issue)
        self.merchantAppealed = try container.decode(Bool.self, forKey: .merchantAppealed)
        self.merchantResponseActions = try container.decode([ResolutionCenterCaseMerchantResponses].self, forKey: .merchantResponseActions)
        self.payment = try container.decode(ResolutionCenterCaseListItemPayment.self, forKey: .payment)
        self.status = try container.decode(ResolutionCenterCaseStatuses.self, forKey: .status)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.user = try container.decode(ResolutionCenterCaseListItemUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customerAppealed, forKey: .customerAppealed)
        try container.encode(self.customerResponseActions, forKey: .customerResponseActions)
        try container.encode(self.dueDate, forKey: .dueDate)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issue, forKey: .issue)
        try container.encode(self.merchantAppealed, forKey: .merchantAppealed)
        try container.encode(self.merchantResponseActions, forKey: .merchantResponseActions)
        try container.encode(self.payment, forKey: .payment)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case company
        case createdAt = "created_at"
        case customerAppealed = "customer_appealed"
        case customerResponseActions = "customer_response_actions"
        case dueDate = "due_date"
        case id
        case issue
        case merchantAppealed = "merchant_appealed"
        case merchantResponseActions = "merchant_response_actions"
        case payment
        case status
        case updatedAt = "updated_at"
        case user
    }
}