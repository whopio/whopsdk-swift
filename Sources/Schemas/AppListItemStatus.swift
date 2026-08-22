import Foundation

/// Visibility on the Whop app store: `live` is publicly discoverable, `unlisted` is accessible only via direct link, `hidden` is not visible anywhere.
public enum AppListItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case live
    case unlisted
    case hidden
}