import Foundation

/// Card payins, including Apple Pay and Google Pay
public enum AccountCapabilitiesAcceptCardPayments: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}