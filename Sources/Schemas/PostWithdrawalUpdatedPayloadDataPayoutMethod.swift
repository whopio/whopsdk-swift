import Foundation

/// The saved payout method used. Requires payout:destination:read; null without it.
public struct PostWithdrawalUpdatedPayloadDataPayoutMethod: Codable, Hashable, Sendable {
    /// Saved payout method nickname.
    public let nickname: Nullable<String>
    /// Supported payout method display details.
    public let supportedPayoutMethod: Nullable<PostWithdrawalUpdatedPayloadDataPayoutMethodSupportedPayoutMethod>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        nickname: Nullable<String>,
        supportedPayoutMethod: Nullable<PostWithdrawalUpdatedPayloadDataPayoutMethodSupportedPayoutMethod>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.nickname = nickname
        self.supportedPayoutMethod = supportedPayoutMethod
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nickname = try container.decode(Nullable<String>.self, forKey: .nickname)
        self.supportedPayoutMethod = try container.decode(Nullable<PostWithdrawalUpdatedPayloadDataPayoutMethodSupportedPayoutMethod>.self, forKey: .supportedPayoutMethod)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.nickname, forKey: .nickname)
        try container.encode(self.supportedPayoutMethod, forKey: .supportedPayoutMethod)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case nickname
        case supportedPayoutMethod = "supported_payout_method"
    }
}