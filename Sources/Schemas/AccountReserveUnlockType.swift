import Foundation

public struct AccountReserveUnlockType: Codable, Hashable, Sendable {
    /// Amount unlocking that day for this reason, in native units, as a decimal string.
    public let amount: String
    /// Why this part of the day's unlock is held, matching `type` on the reserve's `by_type`.
    public let type: AccountReserveUnlockTypeType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        type: AccountReserveUnlockTypeType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.type = try container.decode(AccountReserveUnlockTypeType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case type
    }
}