import Foundation

/// The membership attached to this payment.
public struct PaymentMembership: Codable, Hashable, Sendable {
    /// The unique identifier for the membership.
    public let id: String
    /// The phone number associated with this membership.
    public let phoneNumber: Nullable<String>
    /// The state of the membership.
    public let status: MembershipStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        phoneNumber: Nullable<String>,
        status: MembershipStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.phoneNumber = phoneNumber
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.phoneNumber = try container.decode(Nullable<String>.self, forKey: .phoneNumber)
        self.status = try container.decode(MembershipStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case phoneNumber = "phone_number"
        case status
    }
}