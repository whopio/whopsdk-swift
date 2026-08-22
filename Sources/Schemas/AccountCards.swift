import Foundation

public struct AccountCards: Codable, Hashable, Sendable {
    /// Whether the card application verifies a business (`business`, KYB) or a person (`individual`, consumer identity). `null` when the application is not yet linked to a verification.
    public let kind: Nullable<AccountCardsKind>
    /// Where the card application stands. `approved` means cards can be issued. `needs_verification` means the applicant has not completed identity verification yet; `needs_information` means they did, but the documents were rejected for a fixable reason and must be resubmitted. `pending` and `manual_review` are in flight. `denied`, `locked`, and `canceled` are terminal.
    public let status: AccountCardsStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        kind: Nullable<AccountCardsKind>,
        status: AccountCardsStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.kind = kind
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decode(Nullable<AccountCardsKind>.self, forKey: .kind)
        self.status = try container.decode(AccountCardsStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.kind, forKey: .kind)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case kind
        case status
    }
}