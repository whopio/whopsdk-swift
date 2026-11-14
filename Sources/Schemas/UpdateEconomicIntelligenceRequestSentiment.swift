import Foundation

/// A signed-in user can rate a recommendation as `positive` or `negative`. Can be sent alone or together with status.
public enum UpdateEconomicIntelligenceRequestSentiment: String, Codable, Hashable, CaseIterable, Sendable {
    case positive
    case negative
}