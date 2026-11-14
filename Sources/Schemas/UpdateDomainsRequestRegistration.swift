import Foundation

/// Buy the domain through Whop, or transfer in a domain you own elsewhere with `auth_code`, then renew it every year and let Whop run its DNS. Pass `null` to release an unpaid or failed purchase, or to cancel a transfer while its current registrar can still stop it.
public struct UpdateDomainsRequestRegistration: Codable, Hashable, Sendable {
    /// Transfer the domain to Whop instead of buying it. This is the transfer authorization code (also called an EPP code) from the domain's current registrar, which you usually find in its domain settings after unlocking the domain. Whop becomes the domain's registrant, and the domain moves to Whop DNS once the transfer completes, so its current DNS records, including email, stop working. After the transfer, the registry may lock the domain against another transfer for 60 days. While it's `transferring`, pass the same or a new code again to resubmit. Whop never returns the code. To take a domain from another Whop account instead, pass the `whop_dt_` code from its `transfer`: the domain moves without a payment, keeps its expiry and Whop DNS, and can't be cancelled once entered.
    public let authCode: String?
    /// Whether Whop charges the saved card to renew the domain before it expires.
    public let autoRenew: Bool?
    /// Saved card to charge, prefixed `payt_`. It must belong to the signed-in user. Pass `null` to remove it.
    public let paymentMethodId: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authCode: String? = nil,
        autoRenew: Bool? = nil,
        paymentMethodId: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authCode = authCode
        self.autoRenew = autoRenew
        self.paymentMethodId = paymentMethodId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authCode = try container.decodeIfPresent(String.self, forKey: .authCode)
        self.autoRenew = try container.decodeIfPresent(Bool.self, forKey: .autoRenew)
        self.paymentMethodId = try container.decodeNullableIfPresent(String.self, forKey: .paymentMethodId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.authCode, forKey: .authCode)
        try container.encodeIfPresent(self.autoRenew, forKey: .autoRenew)
        try container.encodeNullableIfPresent(self.paymentMethodId, forKey: .paymentMethodId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authCode = "auth_code"
        case autoRenew = "auto_renew"
        case paymentMethodId = "payment_method_id"
    }
}