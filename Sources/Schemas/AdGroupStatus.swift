import Foundation

/// Whether the ad group is enabled. `active` and `paused` are set by you; `rejected` means it failed ad review; `duplicating` is a copy still being filled in.
public enum AdGroupStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case paused
    case rejected
    case duplicating
}