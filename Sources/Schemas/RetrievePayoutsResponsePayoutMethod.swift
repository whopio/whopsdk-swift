import Foundation

/// Payout method display details. The nickname requires payout:destination:read on the owning ledger; otherwise it is null.
public struct RetrievePayoutsResponsePayoutMethod: Codable, Hashable, Sendable {
    /// Saved payout method nickname.
    public let nickname: Nullable<String>
    /// Supported payout method display details.
    public let supportedPayoutMethod: Nullable<RetrievePayoutsResponsePayoutMethodSupportedPayoutMethod>
    /// The kind of payout method the payout used. `external` sent funds out of Whop. `whop_card` moved funds onto the account's own Whop Card.
    public let type: RetrievePayoutsResponsePayoutMethodType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        nickname: Nullable<String>,
        supportedPayoutMethod: Nullable<RetrievePayoutsResponsePayoutMethodSupportedPayoutMethod>,
        type: RetrievePayoutsResponsePayoutMethodType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.nickname = nickname
        self.supportedPayoutMethod = supportedPayoutMethod
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nickname = try container.decode(Nullable<String>.self, forKey: .nickname)
        self.supportedPayoutMethod = try container.decode(Nullable<RetrievePayoutsResponsePayoutMethodSupportedPayoutMethod>.self, forKey: .supportedPayoutMethod)
        self.type = try container.decode(RetrievePayoutsResponsePayoutMethodType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.nickname, forKey: .nickname)
        try container.encode(self.supportedPayoutMethod, forKey: .supportedPayoutMethod)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case nickname
        case supportedPayoutMethod = "supported_payout_method"
        case type
    }
}