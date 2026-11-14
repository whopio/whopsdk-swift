import Foundation

public enum CreateSocialAccountsRequestBody: Codable, Hashable, Sendable {
    /// Connects the account's Aimerce shop with an API key and turns on the Aimerce tracking pixel. Requires the `company:manage_checkout` scope instead of `social_account:create`.
    case aimerce(CreateSocialAccountsRequestBodyAimerce)
    /// Whop no longer creates Facebook pages, so this returns a `facebook_page_provisioning_retired` error.
    case facebook(CreateSocialAccountsRequestBodyFacebook)
    /// Connects the account's existing Klaviyo account with a private API key.
    case klaviyo(CreateSocialAccountsRequestBodyKlaviyo)
    /// Provisions a Whop-managed TikTok account for the account. Requires the account's `logo`; configure it with [Update Account](/api-reference/accounts/update-account). The account is returned before TikTok has created it — its `id` is usable right away, and the rest of the profile fills in once provisioning finishes.
    case tiktok(CreateSocialAccountsRequestBodyTiktok)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .platform)
        switch discriminant {
        case "aimerce":
            self = .aimerce(try CreateSocialAccountsRequestBodyAimerce(from: decoder))
        case "facebook":
            self = .facebook(try CreateSocialAccountsRequestBodyFacebook(from: decoder))
        case "klaviyo":
            self = .klaviyo(try CreateSocialAccountsRequestBodyKlaviyo(from: decoder))
        case "tiktok":
            self = .tiktok(try CreateSocialAccountsRequestBodyTiktok(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .aimerce(let data):
            try container.encode("aimerce", forKey: .platform)
            try data.encode(to: encoder)
        case .facebook(let data):
            try container.encode("facebook", forKey: .platform)
            try data.encode(to: encoder)
        case .klaviyo(let data):
            try container.encode("klaviyo", forKey: .platform)
            try data.encode(to: encoder)
        case .tiktok(let data):
            try container.encode("tiktok", forKey: .platform)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case platform
    }
}