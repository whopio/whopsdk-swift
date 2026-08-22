import Foundation

/// The perspective to filter support channels by.
public enum SupportChannelView: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case admin
    case customer
}