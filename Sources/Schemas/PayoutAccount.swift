import Foundation

/// An object representing an account used for payouts.
public struct PayoutAccount: Codable, Hashable, Sendable {
    /// The physical address associated with this payout account
    public let address: Nullable<PayoutAccountAddress>
    /// The company's legal name
    public let businessName: Nullable<String>
    /// The business representative for this payout account
    public let businessRepresentative: Nullable<PayoutAccountBusinessRepresentative>
    /// The email address of the representative
    public let email: Nullable<String>
    /// The unique identifier for the payout account.
    public let id: String
    /// The latest verification for the connected account.
    public let latestVerification: Nullable<PayoutAccountLatestVerification>
    /// The business representative's phone
    public let phone: Nullable<String>
    /// The granular calculated status of the payout account reflecting its current KYC and payout readiness state.
    public let status: Nullable<PayoutAccountCalculatedStatuses>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        address: Nullable<PayoutAccountAddress>,
        businessName: Nullable<String>,
        businessRepresentative: Nullable<PayoutAccountBusinessRepresentative>,
        email: Nullable<String>,
        id: String,
        latestVerification: Nullable<PayoutAccountLatestVerification>,
        phone: Nullable<String>,
        status: Nullable<PayoutAccountCalculatedStatuses>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.address = address
        self.businessName = businessName
        self.businessRepresentative = businessRepresentative
        self.email = email
        self.id = id
        self.latestVerification = latestVerification
        self.phone = phone
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(Nullable<PayoutAccountAddress>.self, forKey: .address)
        self.businessName = try container.decode(Nullable<String>.self, forKey: .businessName)
        self.businessRepresentative = try container.decode(Nullable<PayoutAccountBusinessRepresentative>.self, forKey: .businessRepresentative)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.latestVerification = try container.decode(Nullable<PayoutAccountLatestVerification>.self, forKey: .latestVerification)
        self.phone = try container.decode(Nullable<String>.self, forKey: .phone)
        self.status = try container.decode(Nullable<PayoutAccountCalculatedStatuses>.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.businessName, forKey: .businessName)
        try container.encode(self.businessRepresentative, forKey: .businessRepresentative)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.latestVerification, forKey: .latestVerification)
        try container.encode(self.phone, forKey: .phone)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case address
        case businessName = "business_name"
        case businessRepresentative = "business_representative"
        case email
        case id
        case latestVerification = "latest_verification"
        case phone
        case status
    }
}