import Foundation

/// Optional second method charged if the primary fails. Any pairing is allowed (two cards, card+balance, balance+card); omit it to run on a single method. Must differ from the primary.
public struct UpdatePreferencesRequestAdsPaymentMethodsBackup: Codable, Hashable, Sendable {
    /// The funding source ID: a Whop balance (`ldgr_`) for `platform_balance`, or a payment method (`payt_`) for `card`. Optional for `platform_balance` — defaults to the account's default Whop balance. Required for `card`.
    public let id: String?
    /// The funding source kind.
    public let type: UpdatePreferencesRequestAdsPaymentMethodsBackupType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        type: UpdatePreferencesRequestAdsPaymentMethodsBackupType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.type = try container.decode(UpdatePreferencesRequestAdsPaymentMethodsBackupType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case type
    }
}