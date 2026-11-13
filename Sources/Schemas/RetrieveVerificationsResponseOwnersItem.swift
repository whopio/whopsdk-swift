import Foundation

public struct RetrieveVerificationsResponseOwnersItem: Codable, Hashable, Sendable {
    /// The owner's date of birth on file, formatted as `YYYY-MM-DD`.
    public let dateOfBirth: Nullable<String>
    public let firstName: Nullable<String>
    /// Owner ID, prefixed `own_`. Send it in Update Verification's `owners` to change or remove the owner, including one added in the hosted session.
    public let id: String
    public let lastName: Nullable<String>
    /// Share of the business the person owns, from 0 to 100.
    public let ownershipPercentage: Nullable<Double>
    /// What the provider rejected when the owner's verification was sent back: `details` (their name, date of birth, or other details don't match their ID), `identity_document`, or `selfie`. Fix only these with Update Verification. Empty otherwise.
    public let rejectedChecks: [RetrieveVerificationsResponseOwnersItemRejectedChecksItem]
    /// The owner's documents and their progress. Empty for an owner added with `verification_id`.
    public let requiredDocuments: [RetrieveVerificationsResponseOwnersItemRequiredDocumentsItem]
    /// What the person is to the business.
    public let roles: [RetrieveVerificationsResponseOwnersItemRolesItem]
    /// Where the owner's own verification stands, in the same states as `status`. `action_required` when their documents need sending again.
    public let status: RetrieveVerificationsResponseOwnersItemStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        dateOfBirth: Nullable<String>,
        firstName: Nullable<String>,
        id: String,
        lastName: Nullable<String>,
        ownershipPercentage: Nullable<Double>,
        rejectedChecks: [RetrieveVerificationsResponseOwnersItemRejectedChecksItem],
        requiredDocuments: [RetrieveVerificationsResponseOwnersItemRequiredDocumentsItem],
        roles: [RetrieveVerificationsResponseOwnersItemRolesItem],
        status: RetrieveVerificationsResponseOwnersItemStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.dateOfBirth = dateOfBirth
        self.firstName = firstName
        self.id = id
        self.lastName = lastName
        self.ownershipPercentage = ownershipPercentage
        self.rejectedChecks = rejectedChecks
        self.requiredDocuments = requiredDocuments
        self.roles = roles
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dateOfBirth = try container.decode(Nullable<String>.self, forKey: .dateOfBirth)
        self.firstName = try container.decode(Nullable<String>.self, forKey: .firstName)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastName = try container.decode(Nullable<String>.self, forKey: .lastName)
        self.ownershipPercentage = try container.decode(Nullable<Double>.self, forKey: .ownershipPercentage)
        self.rejectedChecks = try container.decode([RetrieveVerificationsResponseOwnersItemRejectedChecksItem].self, forKey: .rejectedChecks)
        self.requiredDocuments = try container.decode([RetrieveVerificationsResponseOwnersItemRequiredDocumentsItem].self, forKey: .requiredDocuments)
        self.roles = try container.decode([RetrieveVerificationsResponseOwnersItemRolesItem].self, forKey: .roles)
        self.status = try container.decode(RetrieveVerificationsResponseOwnersItemStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encode(self.ownershipPercentage, forKey: .ownershipPercentage)
        try container.encode(self.rejectedChecks, forKey: .rejectedChecks)
        try container.encode(self.requiredDocuments, forKey: .requiredDocuments)
        try container.encode(self.roles, forKey: .roles)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case dateOfBirth = "date_of_birth"
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case ownershipPercentage = "ownership_percentage"
        case rejectedChecks = "rejected_checks"
        case requiredDocuments = "required_documents"
        case roles
        case status
    }
}