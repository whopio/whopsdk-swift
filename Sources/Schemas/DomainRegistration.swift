import Foundation

public struct DomainRegistration: Codable, Hashable, Sendable {
    /// What the domain owes now. `null` when nothing is owed.
    public let amountDue: Nullable<Money>
    /// Whether Whop charges the saved payment method to renew the domain before it expires.
    public let autoRenew: Bool
    /// When the registration expires unless renewed, as an ISO 8601 timestamp. `null` until it's registered.
    public let expiresAt: Nullable<String>
    /// How the domain came to Whop: `registration` when it was bought through Whop, `transfer` when it was moved from another registrar.
    public let method: DomainRegistrationMethod
    /// ID of the saved card charged for the domain, prefixed `payt_`. `null` when none is set.
    public let paymentMethodId: Nullable<String>
    /// Where the registration is: awaiting payment, ordering at the registrar, transferring from another registrar, delegating DNS to Whop, held, expired, or releasing.
    public let phase: DomainRegistrationPhase
    /// Link to pay what the domain owes now: its registration or transfer, or a yearly renewal. `null` when nothing is owed.
    public let purchaseUrl: Nullable<String>
    /// What each yearly renewal costs at the registrar's current price. Set when the response is a single domain; `null` in lists, while the domain is being released, or when the price can't be read right now.
    public let renewalPrice: Nullable<Money>
    /// How far registering and keeping the domain has got.
    public let state: DomainRegistrationState
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amountDue: Nullable<Money>,
        autoRenew: Bool,
        expiresAt: Nullable<String>,
        method: DomainRegistrationMethod,
        paymentMethodId: Nullable<String>,
        phase: DomainRegistrationPhase,
        purchaseUrl: Nullable<String>,
        renewalPrice: Nullable<Money>,
        state: DomainRegistrationState,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amountDue = amountDue
        self.autoRenew = autoRenew
        self.expiresAt = expiresAt
        self.method = method
        self.paymentMethodId = paymentMethodId
        self.phase = phase
        self.purchaseUrl = purchaseUrl
        self.renewalPrice = renewalPrice
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountDue = try container.decode(Nullable<Money>.self, forKey: .amountDue)
        self.autoRenew = try container.decode(Bool.self, forKey: .autoRenew)
        self.expiresAt = try container.decode(Nullable<String>.self, forKey: .expiresAt)
        self.method = try container.decode(DomainRegistrationMethod.self, forKey: .method)
        self.paymentMethodId = try container.decode(Nullable<String>.self, forKey: .paymentMethodId)
        self.phase = try container.decode(DomainRegistrationPhase.self, forKey: .phase)
        self.purchaseUrl = try container.decode(Nullable<String>.self, forKey: .purchaseUrl)
        self.renewalPrice = try container.decode(Nullable<Money>.self, forKey: .renewalPrice)
        self.state = try container.decode(DomainRegistrationState.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amountDue, forKey: .amountDue)
        try container.encode(self.autoRenew, forKey: .autoRenew)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.method, forKey: .method)
        try container.encode(self.paymentMethodId, forKey: .paymentMethodId)
        try container.encode(self.phase, forKey: .phase)
        try container.encode(self.purchaseUrl, forKey: .purchaseUrl)
        try container.encode(self.renewalPrice, forKey: .renewalPrice)
        try container.encode(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amountDue = "amount_due"
        case autoRenew = "auto_renew"
        case expiresAt = "expires_at"
        case method
        case paymentMethodId = "payment_method_id"
        case phase
        case purchaseUrl = "purchase_url"
        case renewalPrice = "renewal_price"
        case state
    }
}