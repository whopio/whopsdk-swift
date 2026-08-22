import Foundation

/// Buy-now-pay-later payins; requires approval
public enum AccountCapabilitiesAcceptBnplPayments: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}