import Foundation

/// Re-authentication proof required to perform this sensitive action.
public struct CreateAuthorizedUsersRequestElevation: Codable, Hashable, Sendable {
    /// Ignored. Kept so existing API clients that send a passkey assertion keep working.
    public let authenticatorData: Nullable<String>?
    /// Ignored. Kept so existing API clients that send a passkey assertion keep working.
    public let clientDataJson: Nullable<String>?
    /// Ignored. Kept so existing API clients that send a passkey assertion keep working.
    public let credentialId: Nullable<String>?
    /// The 6-digit code emailed to the user.
    public let emailCode: Nullable<String>?
    /// Ignored. Kept so existing API clients that send a passkey assertion keep working.
    public let signature: Nullable<String>?
    /// The 6-digit code from the authenticator app or SMS.
    public let totpCode: Nullable<String>?
    /// Ignored. Kept so existing API clients that send it keep working.
    public let useFinanceSession: Nullable<Bool>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authenticatorData: Nullable<String>? = nil,
        clientDataJson: Nullable<String>? = nil,
        credentialId: Nullable<String>? = nil,
        emailCode: Nullable<String>? = nil,
        signature: Nullable<String>? = nil,
        totpCode: Nullable<String>? = nil,
        useFinanceSession: Nullable<Bool>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authenticatorData = authenticatorData
        self.clientDataJson = clientDataJson
        self.credentialId = credentialId
        self.emailCode = emailCode
        self.signature = signature
        self.totpCode = totpCode
        self.useFinanceSession = useFinanceSession
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authenticatorData = try container.decodeNullableIfPresent(String.self, forKey: .authenticatorData)
        self.clientDataJson = try container.decodeNullableIfPresent(String.self, forKey: .clientDataJson)
        self.credentialId = try container.decodeNullableIfPresent(String.self, forKey: .credentialId)
        self.emailCode = try container.decodeNullableIfPresent(String.self, forKey: .emailCode)
        self.signature = try container.decodeNullableIfPresent(String.self, forKey: .signature)
        self.totpCode = try container.decodeNullableIfPresent(String.self, forKey: .totpCode)
        self.useFinanceSession = try container.decodeNullableIfPresent(Bool.self, forKey: .useFinanceSession)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.authenticatorData, forKey: .authenticatorData)
        try container.encodeNullableIfPresent(self.clientDataJson, forKey: .clientDataJson)
        try container.encodeNullableIfPresent(self.credentialId, forKey: .credentialId)
        try container.encodeNullableIfPresent(self.emailCode, forKey: .emailCode)
        try container.encodeNullableIfPresent(self.signature, forKey: .signature)
        try container.encodeNullableIfPresent(self.totpCode, forKey: .totpCode)
        try container.encodeNullableIfPresent(self.useFinanceSession, forKey: .useFinanceSession)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authenticatorData = "authenticator_data"
        case clientDataJson = "client_data_json"
        case credentialId = "credential_id"
        case emailCode = "email_code"
        case signature
        case totpCode = "totp_code"
        case useFinanceSession = "use_finance_session"
    }
}