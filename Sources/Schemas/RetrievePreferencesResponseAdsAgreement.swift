import Foundation

/// The account's Whop Ads services and payment authorization agreement. While `pending_signature`, campaign launch is blocked; sign by answering `requested_information` via `PATCH /verifications/{id}`.
public struct RetrievePreferencesResponseAdsAgreement: Codable, Hashable, Sendable {
    /// When the agreement was signed, as an ISO 8601 timestamp. `null` until signed.
    public let acceptedAt: Nullable<String>
    /// The agreement version signed or awaiting signature, as an ISO date. `null` when no signature is required.
    public let agreementVersion: Nullable<String>
    /// The signer's printed full name. `null` until signed.
    public let printedName: Nullable<String>
    /// Where the account's ads services agreement stands.
    public let status: RetrievePreferencesResponseAdsAgreementStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        acceptedAt: Nullable<String>,
        agreementVersion: Nullable<String>,
        printedName: Nullable<String>,
        status: RetrievePreferencesResponseAdsAgreementStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.acceptedAt = acceptedAt
        self.agreementVersion = agreementVersion
        self.printedName = printedName
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.acceptedAt = try container.decode(Nullable<String>.self, forKey: .acceptedAt)
        self.agreementVersion = try container.decode(Nullable<String>.self, forKey: .agreementVersion)
        self.printedName = try container.decode(Nullable<String>.self, forKey: .printedName)
        self.status = try container.decode(RetrievePreferencesResponseAdsAgreementStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.acceptedAt, forKey: .acceptedAt)
        try container.encode(self.agreementVersion, forKey: .agreementVersion)
        try container.encode(self.printedName, forKey: .printedName)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case acceptedAt = "accepted_at"
        case agreementVersion = "agreement_version"
        case printedName = "printed_name"
        case status
    }
}