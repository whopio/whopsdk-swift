import Foundation

public struct AccountCompanyFormationSignatures: Codable, Hashable, Sendable {
    /// Signature state for IRS Form 8821, the tax information authorization. Present only while the form still needs the founder's action.
    public let form8821: AccountCompanyFormationSignatureRequest?
    /// Signature state for IRS Form SS-4, the EIN application. Present only while the form still needs the founder's action.
    public let ss4: AccountCompanyFormationSignatureRequest?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        form8821: AccountCompanyFormationSignatureRequest? = nil,
        ss4: AccountCompanyFormationSignatureRequest? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.form8821 = form8821
        self.ss4 = ss4
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.form8821 = try container.decodeIfPresent(AccountCompanyFormationSignatureRequest.self, forKey: .form8821)
        self.ss4 = try container.decodeIfPresent(AccountCompanyFormationSignatureRequest.self, forKey: .ss4)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.form8821, forKey: .form8821)
        try container.encodeIfPresent(self.ss4, forKey: .ss4)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case form8821
        case ss4
    }
}