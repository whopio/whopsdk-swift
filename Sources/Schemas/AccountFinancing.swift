import Foundation

public struct AccountFinancing: Codable, Hashable, Sendable {
    /// The ID of the account's most recent financing application, starting with inrq_. Retrieve it for requirements and review feedback.
    public let applicationId: String
    /// The most recent financing application's review state: `requires_collection` (waiting on the merchant, including after a request for more information), `awaiting_review`, `approved`, `denied`, or `completed`. Whether financing payment methods are enabled is `capabilities.accept_bnpl_payments`.
    public let status: AccountFinancingStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        applicationId: String,
        status: AccountFinancingStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.applicationId = applicationId
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.applicationId = try container.decode(String.self, forKey: .applicationId)
        self.status = try container.decode(AccountFinancingStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.applicationId, forKey: .applicationId)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case applicationId = "application_id"
        case status
    }
}