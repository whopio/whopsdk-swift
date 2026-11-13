import Foundation

/// How fast the funds should arrive.
public enum CreateQuotePayoutsRequestSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}