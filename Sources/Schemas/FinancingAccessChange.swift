import Foundation

public struct FinancingAccessChange: Codable, Hashable, Sendable {
    /// The merchant account whose financing access changed, prefixed biz_.
    public let accountId: String
    /// When the payment methods were disabled, as an ISO 8601 timestamp.
    public let disabledAt: String
    public let disabledPaymentMethods: [FinancingAccessChangeDisabledPaymentMethodsItem]
    /// The type of this object.
    public let object: FinancingAccessChangeObject
    /// The BNPL provider whose dispute rate triggered enforcement. Other payment methods may also lose access.
    public let provider: FinancingAccessChangeProvider
    /// Why financing access was removed.
    public let reason: FinancingAccessChangeReason
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        disabledAt: String,
        disabledPaymentMethods: [FinancingAccessChangeDisabledPaymentMethodsItem],
        object: FinancingAccessChangeObject,
        provider: FinancingAccessChangeProvider,
        reason: FinancingAccessChangeReason,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.disabledAt = disabledAt
        self.disabledPaymentMethods = disabledPaymentMethods
        self.object = object
        self.provider = provider
        self.reason = reason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.disabledAt = try container.decode(String.self, forKey: .disabledAt)
        self.disabledPaymentMethods = try container.decode([FinancingAccessChangeDisabledPaymentMethodsItem].self, forKey: .disabledPaymentMethods)
        self.object = try container.decode(FinancingAccessChangeObject.self, forKey: .object)
        self.provider = try container.decode(FinancingAccessChangeProvider.self, forKey: .provider)
        self.reason = try container.decode(FinancingAccessChangeReason.self, forKey: .reason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.disabledAt, forKey: .disabledAt)
        try container.encode(self.disabledPaymentMethods, forKey: .disabledPaymentMethods)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.reason, forKey: .reason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case disabledAt = "disabled_at"
        case disabledPaymentMethods = "disabled_payment_methods"
        case object
        case provider
        case reason
    }
}