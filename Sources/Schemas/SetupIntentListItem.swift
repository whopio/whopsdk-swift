import Foundation

/// A setup intent allows a user to save a payment method for future use without making an immediate purchase.
public struct SetupIntentListItem: Codable, Hashable, Sendable {
    /// The checkout session configuration associated with this setup intent. Null if no checkout session was used.
    public let checkoutConfiguration: Nullable<SetupIntentListItemCheckoutConfiguration>
    /// The company that initiated this setup intent. Null if the company has been deleted.
    public let company: Nullable<SetupIntentListItemCompany>
    /// The datetime the setup intent was created.
    public let createdAt: Date
    /// A human-readable error message explaining why the setup intent failed. Null if no error occurred.
    public let errorMessage: Nullable<String>
    /// The unique identifier for the setup intent.
    public let id: String
    /// The company member associated with this setup intent. Null if the user is not a member.
    public let member: Nullable<SetupIntentListItemMember>
    /// Custom key-value pairs attached to this setup intent. Null if no metadata was provided.
    public let metadata: Nullable<[String: JSONValue]>
    /// The saved payment method created by this setup intent. Null if the setup has not completed successfully.
    public let paymentMethod: Nullable<SetupIntentListItemPaymentMethod>
    /// The current status of the setup intent.
    public let status: SetupIntentStatuses
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        checkoutConfiguration: Nullable<SetupIntentListItemCheckoutConfiguration>,
        company: Nullable<SetupIntentListItemCompany>,
        createdAt: Date,
        errorMessage: Nullable<String>,
        id: String,
        member: Nullable<SetupIntentListItemMember>,
        metadata: Nullable<[String: JSONValue]>,
        paymentMethod: Nullable<SetupIntentListItemPaymentMethod>,
        status: SetupIntentStatuses,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.checkoutConfiguration = checkoutConfiguration
        self.company = company
        self.createdAt = createdAt
        self.errorMessage = errorMessage
        self.id = id
        self.member = member
        self.metadata = metadata
        self.paymentMethod = paymentMethod
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.checkoutConfiguration = try container.decode(Nullable<SetupIntentListItemCheckoutConfiguration>.self, forKey: .checkoutConfiguration)
        self.company = try container.decode(Nullable<SetupIntentListItemCompany>.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.errorMessage = try container.decode(Nullable<String>.self, forKey: .errorMessage)
        self.id = try container.decode(String.self, forKey: .id)
        self.member = try container.decode(Nullable<SetupIntentListItemMember>.self, forKey: .member)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.paymentMethod = try container.decode(Nullable<SetupIntentListItemPaymentMethod>.self, forKey: .paymentMethod)
        self.status = try container.decode(SetupIntentStatuses.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.checkoutConfiguration, forKey: .checkoutConfiguration)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.errorMessage, forKey: .errorMessage)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.member, forKey: .member)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.paymentMethod, forKey: .paymentMethod)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case checkoutConfiguration = "checkout_configuration"
        case company
        case createdAt = "created_at"
        case errorMessage = "error_message"
        case id
        case member
        case metadata
        case paymentMethod = "payment_method"
        case status
    }
}