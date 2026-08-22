import Foundation

/// Balance top-ups by charging a stored payment method
public enum AccountCapabilitiesCardDeposit: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}