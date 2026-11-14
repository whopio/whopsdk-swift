import Foundation

/// `active` receives conversions. `errored` stopped because the ad platform rejected the access token; update the token to resume. `disabled` was turned off by Whop.
public enum AdPixelStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case errored
    case disabled
}