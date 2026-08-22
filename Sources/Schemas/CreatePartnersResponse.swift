import Foundation

public struct CreatePartnersResponse: Codable, Hashable, Sendable {
    /// The caller's referral link — businesses that sign up through it are attributed to the caller.
    public let referralLink: String
    /// When the caller became a Whop partner.
    public let whopPartnerEnabledAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        referralLink: String,
        whopPartnerEnabledAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.referralLink = referralLink
        self.whopPartnerEnabledAt = whopPartnerEnabledAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.referralLink = try container.decode(String.self, forKey: .referralLink)
        self.whopPartnerEnabledAt = try container.decode(Date.self, forKey: .whopPartnerEnabledAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.referralLink, forKey: .referralLink)
        try container.encode(self.whopPartnerEnabledAt, forKey: .whopPartnerEnabledAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case referralLink = "referral_link"
        case whopPartnerEnabledAt = "whop_partner_enabled_at"
    }
}