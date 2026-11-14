import Foundation

/// The capability the issue is about.
public enum DomainIssueCapability: String, Codable, Hashable, CaseIterable, Sendable {
    case verification
    case registration
    case platform
    case subdomain
    case website
    case applePay = "apple_pay"
    case pixel
    case email
    case transfer
}