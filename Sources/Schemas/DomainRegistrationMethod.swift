import Foundation

/// How the domain came to Whop: `registration` when it was bought through Whop, `transfer` when it was moved from another registrar.
public enum DomainRegistrationMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case registration
    case transfer
}