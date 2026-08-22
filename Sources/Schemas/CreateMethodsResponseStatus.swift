import Foundation

/// Always `created` on create — no payout has used the method yet.
public enum CreateMethodsResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case created
    case active
    case broken
}