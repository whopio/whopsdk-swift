import Foundation

/// An identity verification session used to confirm a person or entity's identity for payout account eligibility.
public struct Verification: Codable, Hashable, Sendable {
    /// The numeric id of the verification record.
    public let id: String
    /// The most recent error code returned during verification. Null if no error has occurred.
    public let lastErrorCode: Nullable<VerificationErrorCodes>
    /// A human-readable explanation of the most recent verification error. Null if no error has occurred.
    public let lastErrorReason: Nullable<String>
    /// The current status of this verification session.
    public let status: VerificationStatuses
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        lastErrorCode: Nullable<VerificationErrorCodes>,
        lastErrorReason: Nullable<String>,
        status: VerificationStatuses,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.lastErrorCode = lastErrorCode
        self.lastErrorReason = lastErrorReason
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastErrorCode = try container.decode(Nullable<VerificationErrorCodes>.self, forKey: .lastErrorCode)
        self.lastErrorReason = try container.decode(Nullable<String>.self, forKey: .lastErrorReason)
        self.status = try container.decode(VerificationStatuses.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastErrorCode, forKey: .lastErrorCode)
        try container.encode(self.lastErrorReason, forKey: .lastErrorReason)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case lastErrorCode = "last_error_code"
        case lastErrorReason = "last_error_reason"
        case status
    }
}