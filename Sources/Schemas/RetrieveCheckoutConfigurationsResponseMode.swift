import Foundation

/// Controls whether checkout charges the buyer immediately or saves payment details for later.
public enum RetrieveCheckoutConfigurationsResponseMode: String, Codable, Hashable, CaseIterable, Sendable {
    case payment
    case setup
}