import Foundation

/// How far proving verification has got.
public enum DomainVerificationState: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case ready
    case actionRequired = "action_required"
    case releasing
}