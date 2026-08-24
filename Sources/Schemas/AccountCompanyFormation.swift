import Foundation

public struct AccountCompanyFormation: Codable, Hashable, Sendable {
    public let documents: [AccountCompanyFormationDocument]?
    /// Whether the company's EIN has been issued by the IRS. Present once `status` leaves `draft`.
    public let einRegistered: Bool?
    /// Registered company name including the entity ending, for example `Acme, LLC`. Present once `status` leaves `draft`.
    public let legalName: Nullable<String>?
    /// IRS forms still awaiting a founder's signature, each with a hosted signing URL. Present once `status` leaves `draft`; empty when nothing needs signing.
    public let signatures: AccountCompanyFormationSignatures?
    /// Whether the state formation filing is complete. Present once `status` leaves `draft`.
    public let stateRegistered: Bool?
    public let status: AccountCompanyFormationStatus?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        documents: [AccountCompanyFormationDocument]? = nil,
        einRegistered: Bool? = nil,
        legalName: Nullable<String>? = nil,
        signatures: AccountCompanyFormationSignatures? = nil,
        stateRegistered: Bool? = nil,
        status: AccountCompanyFormationStatus? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.documents = documents
        self.einRegistered = einRegistered
        self.legalName = legalName
        self.signatures = signatures
        self.stateRegistered = stateRegistered
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.documents = try container.decodeIfPresent([AccountCompanyFormationDocument].self, forKey: .documents)
        self.einRegistered = try container.decodeIfPresent(Bool.self, forKey: .einRegistered)
        self.legalName = try container.decodeNullableIfPresent(String.self, forKey: .legalName)
        self.signatures = try container.decodeIfPresent(AccountCompanyFormationSignatures.self, forKey: .signatures)
        self.stateRegistered = try container.decodeIfPresent(Bool.self, forKey: .stateRegistered)
        self.status = try container.decodeIfPresent(AccountCompanyFormationStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.documents, forKey: .documents)
        try container.encodeIfPresent(self.einRegistered, forKey: .einRegistered)
        try container.encodeNullableIfPresent(self.legalName, forKey: .legalName)
        try container.encodeIfPresent(self.signatures, forKey: .signatures)
        try container.encodeIfPresent(self.stateRegistered, forKey: .stateRegistered)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case documents
        case einRegistered = "ein_registered"
        case legalName = "legal_name"
        case signatures
        case stateRegistered = "state_registered"
        case status
    }
}