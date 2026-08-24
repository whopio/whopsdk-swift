import Foundation

/// Issuing Whop cards; requires card application approval
public enum AccountCapabilitiesCardIssuing: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}