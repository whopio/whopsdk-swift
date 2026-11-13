import Foundation

public struct ConfirmationToken: Codable, Hashable, Sendable {
    /// The collected billing address, including the name on the address. Null when not collected or without bearer authentication with payment:basic:read on the token’s account.
    public let billingAddress: Nullable<PaymentAddress>
    /// Billing preview supplied at collection: email, name, country and postal code.
    public let billingDetails: Nullable<PaymentBillingDetailsPreview>
    /// When the token was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// When the token expires, as an ISO 8601 timestamp. Tokens are single-use and short-lived.
    public let expiresAt: String
    public let id: String
    /// Always `confirmation_token`.
    public let object: String
    /// Display-only preview of the collected method — never the underlying token.
    public let paymentMethodPreview: PaymentMethodDisplay
    /// Save-consent state the element displayed at collection: `off_session`, `on_session`, or `null`. Confirm may vault only if attested here.
    public let setupFutureUsage: Nullable<String>
    /// `pending` until it is used, then `consumed`; `expired` once its short lifetime elapses. Only a `pending` token can be charged.
    public let status: ConfirmationTokenStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        billingAddress: Nullable<PaymentAddress>,
        billingDetails: Nullable<PaymentBillingDetailsPreview>,
        createdAt: String,
        expiresAt: String,
        id: String,
        object: String,
        paymentMethodPreview: PaymentMethodDisplay,
        setupFutureUsage: Nullable<String>,
        status: ConfirmationTokenStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.billingAddress = billingAddress
        self.billingDetails = billingDetails
        self.createdAt = createdAt
        self.expiresAt = expiresAt
        self.id = id
        self.object = object
        self.paymentMethodPreview = paymentMethodPreview
        self.setupFutureUsage = setupFutureUsage
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.billingAddress = try container.decode(Nullable<PaymentAddress>.self, forKey: .billingAddress)
        self.billingDetails = try container.decode(Nullable<PaymentBillingDetailsPreview>.self, forKey: .billingDetails)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.expiresAt = try container.decode(String.self, forKey: .expiresAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(String.self, forKey: .object)
        self.paymentMethodPreview = try container.decode(PaymentMethodDisplay.self, forKey: .paymentMethodPreview)
        self.setupFutureUsage = try container.decode(Nullable<String>.self, forKey: .setupFutureUsage)
        self.status = try container.decode(ConfirmationTokenStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.billingAddress, forKey: .billingAddress)
        try container.encode(self.billingDetails, forKey: .billingDetails)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.paymentMethodPreview, forKey: .paymentMethodPreview)
        try container.encode(self.setupFutureUsage, forKey: .setupFutureUsage)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case billingAddress = "billing_address"
        case billingDetails = "billing_details"
        case createdAt = "created_at"
        case expiresAt = "expires_at"
        case id
        case object
        case paymentMethodPreview = "payment_method_preview"
        case setupFutureUsage = "setup_future_usage"
        case status
    }
}