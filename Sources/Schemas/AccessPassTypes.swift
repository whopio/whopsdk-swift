import Foundation

/// The different types an product can be. Only use 'regular'. The rest are for internal use
public enum AccessPassTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case regular
    case app
    case experienceUpsell = "experience_upsell"
    case apiOnly = "api_only"
}