import Foundation

public struct SetupIntent: Codable, Hashable, Sendable {
    /// The account the payment method is saved for, prefixed `biz_`.
    public let accountId: Nullable<String>
    /// The checkout configuration this setup was created through, prefixed `ch_`. Null for a setup created through this API rather than a hosted checkout.
    public let checkoutConfigurationId: Nullable<String>
    /// The credential a buyer's surface presents to poll this setup and set its return URL — hand it to the elements' `handleNextAction`. Only on setups created through this API, and always null in list responses — retrieve the setup intent for it.
    public let clientSecret: Nullable<String>
    /// When the setup intent was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Setup intent ID, prefixed `sint_`.
    public let id: String
    /// Why the setup ended where it did, or `null` when nothing has failed. Present on `canceled` — a buyer who abandoned carries no code, one refused by the provider does. Dropped once the setup succeeds.
    public let lastSetupError: Nullable<SetupLastSetupError>
    /// The buyer's member record on the account, prefixed `mber_`. Null without the member:basic:read permission, unless the caller is the buyer.
    public let memberId: Nullable<String>
    /// Your own key-value data attached when the setup intent was created.
    public let metadata: Nullable<[String: JSONValue]>
    /// The method behind this setup shaped for display: a buyer-facing name, the standard icon set, and the card's brand, last four, issuer identification number, expiry, and network transaction id when it was a card. Null until a method was collected.
    public let paymentInstrument: Nullable<PaymentInstrument>
    /// The saved payment method, prefixed `payt_`, ready to charge with Create Payment. Null until the setup has `succeeded`.
    public let paymentMethodId: Nullable<String>
    /// The kind of instrument being saved, for example `card` or `us_bank_account`.
    public let paymentMethodType: Nullable<PaymentMethodTypes>
    /// Where the buyer lands after completing an off-site step, or `null` to leave them where they are.
    public let returnUrl: Nullable<String>
    /// How far the setup has got. **A 201 or 200 means we answered, not that the method was saved — always branch on this.** `requires_action` — the buyer has a step outstanding; hand `client_secret` to the elements or poll Retrieve setup status. `processing` — the processor is deciding. `succeeded` — the method is saved, and only this one means saved. `canceled` — abandoned or refused; see `last_setup_error`.
    public let status: SetupIntentStatus
    /// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. The setting requested for this setup, or `null` when unset.
    public let threeDsLevel: Nullable<SetupIntentThreeDsLevel>
    /// True when the buyer completed 3D Secure while saving this payment method.
    public let threeDsVerified: Bool
    /// When the setup intent was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The user saving the payment method. Null when the buyer is a company rather than a user.
    public let user: Nullable<UserSummary>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        checkoutConfigurationId: Nullable<String>,
        clientSecret: Nullable<String>,
        createdAt: String,
        id: String,
        lastSetupError: Nullable<SetupLastSetupError>,
        memberId: Nullable<String>,
        metadata: Nullable<[String: JSONValue]>,
        paymentInstrument: Nullable<PaymentInstrument>,
        paymentMethodId: Nullable<String>,
        paymentMethodType: Nullable<PaymentMethodTypes>,
        returnUrl: Nullable<String>,
        status: SetupIntentStatus,
        threeDsLevel: Nullable<SetupIntentThreeDsLevel>,
        threeDsVerified: Bool,
        updatedAt: String,
        user: Nullable<UserSummary>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.checkoutConfigurationId = checkoutConfigurationId
        self.clientSecret = clientSecret
        self.createdAt = createdAt
        self.id = id
        self.lastSetupError = lastSetupError
        self.memberId = memberId
        self.metadata = metadata
        self.paymentInstrument = paymentInstrument
        self.paymentMethodId = paymentMethodId
        self.paymentMethodType = paymentMethodType
        self.returnUrl = returnUrl
        self.status = status
        self.threeDsLevel = threeDsLevel
        self.threeDsVerified = threeDsVerified
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.checkoutConfigurationId = try container.decode(Nullable<String>.self, forKey: .checkoutConfigurationId)
        self.clientSecret = try container.decode(Nullable<String>.self, forKey: .clientSecret)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastSetupError = try container.decode(Nullable<SetupLastSetupError>.self, forKey: .lastSetupError)
        self.memberId = try container.decode(Nullable<String>.self, forKey: .memberId)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.paymentInstrument = try container.decode(Nullable<PaymentInstrument>.self, forKey: .paymentInstrument)
        self.paymentMethodId = try container.decode(Nullable<String>.self, forKey: .paymentMethodId)
        self.paymentMethodType = try container.decode(Nullable<PaymentMethodTypes>.self, forKey: .paymentMethodType)
        self.returnUrl = try container.decode(Nullable<String>.self, forKey: .returnUrl)
        self.status = try container.decode(SetupIntentStatus.self, forKey: .status)
        self.threeDsLevel = try container.decode(Nullable<SetupIntentThreeDsLevel>.self, forKey: .threeDsLevel)
        self.threeDsVerified = try container.decode(Bool.self, forKey: .threeDsVerified)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.user = try container.decode(Nullable<UserSummary>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.checkoutConfigurationId, forKey: .checkoutConfigurationId)
        try container.encode(self.clientSecret, forKey: .clientSecret)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastSetupError, forKey: .lastSetupError)
        try container.encode(self.memberId, forKey: .memberId)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.paymentInstrument, forKey: .paymentInstrument)
        try container.encode(self.paymentMethodId, forKey: .paymentMethodId)
        try container.encode(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encode(self.returnUrl, forKey: .returnUrl)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.threeDsLevel, forKey: .threeDsLevel)
        try container.encode(self.threeDsVerified, forKey: .threeDsVerified)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case checkoutConfigurationId = "checkout_configuration_id"
        case clientSecret = "client_secret"
        case createdAt = "created_at"
        case id
        case lastSetupError = "last_setup_error"
        case memberId = "member_id"
        case metadata
        case paymentInstrument = "payment_instrument"
        case paymentMethodId = "payment_method_id"
        case paymentMethodType = "payment_method_type"
        case returnUrl = "return_url"
        case status
        case threeDsLevel = "three_ds_level"
        case threeDsVerified = "three_ds_verified"
        case updatedAt = "updated_at"
        case user
    }
}