import Foundation

/// Controls whether checkout charges the buyer immediately or saves payment details for later. Defaults to `payment`.
public enum CreateCheckoutConfigurationsRequestMode: String, Codable, Hashable, CaseIterable, Sendable {
    case payment
    case setup
}