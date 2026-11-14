import Foundation

/// How the user rated this recommendation, or `null` if they have not rated it
public enum EconomicIntelligenceSentiment: String, Codable, Hashable, CaseIterable, Sendable {
    case positive
    case negative
}