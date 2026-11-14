import Foundation

public struct SubmitFinancingApplicationsRequestMerchantAcceptance: Codable, Hashable, Sendable {
    /// Affirmation that the merchant accepted the presented terms.
    public let accepted: Bool
    /// Exact `terms.version` returned by the application and presented to the merchant. A stale version is rejected.
    public let termsVersion: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accepted: Bool,
        termsVersion: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accepted = accepted
        self.termsVersion = termsVersion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accepted = try container.decode(Bool.self, forKey: .accepted)
        self.termsVersion = try container.decode(String.self, forKey: .termsVersion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accepted, forKey: .accepted)
        try container.encode(self.termsVersion, forKey: .termsVersion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accepted
        case termsVersion = "terms_version"
    }
}