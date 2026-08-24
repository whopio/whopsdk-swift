import Foundation

/// The platform to create the social account on. `facebook` requires the account's `banner_image`, `logo`, and `description`; configure them with [Update Account](/api-reference/beta/accounts/update-account).
public enum CreateSocialAccountsRequestPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case facebook
}