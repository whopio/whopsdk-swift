import Foundation

/// Why the payout ended without paying, or why it reversed after settlement. Present on failed, canceled, denied, and reversed payouts; `null` otherwise.
public struct ListPayoutsResponseDataItemFailure: Codable, Hashable, Sendable {
    /// Classified failure code from the maintained error catalog.
    public let code: Nullable<String>
    /// The effective time of the reversal that put the funds back in the balance — `null` if they never left it or have not returned yet. Set only once the return is confirmed in the ledger; the ledger posting itself can land moments after this time.
    public let fundsReturnedAt: Nullable<Date>
    /// Human-readable explanation of the failure. Callers holding `payout:destination:read` may receive text personalized to the destination; other callers get the generic catalog message.
    public let message: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: Nullable<String>,
        fundsReturnedAt: Nullable<Date>,
        message: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.fundsReturnedAt = fundsReturnedAt
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Nullable<String>.self, forKey: .code)
        self.fundsReturnedAt = try container.decode(Nullable<Date>.self, forKey: .fundsReturnedAt)
        self.message = try container.decode(Nullable<String>.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.fundsReturnedAt, forKey: .fundsReturnedAt)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case fundsReturnedAt = "funds_returned_at"
        case message
    }
}