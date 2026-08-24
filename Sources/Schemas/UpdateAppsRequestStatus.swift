import Foundation

/// Controls whether the app is published on Whop discovery or accessible only through its direct link. Publishing requires a name, icon, and description.
public enum UpdateAppsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case live
    case unlisted
    case hidden
}