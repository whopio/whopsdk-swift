import Foundation

/// Whether or not the tax is included in a plan's price (or if it hasn't been set up)
public enum TaxTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case inclusive
    case exclusive
    case unspecified
}