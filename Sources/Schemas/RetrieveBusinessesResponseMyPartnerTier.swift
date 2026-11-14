import Foundation

/// Which tier the caller earns on for this business: `first` (they referred the owner), `second` (they referred the first-tier partner), or `blueprint` (the business deployed a site from their blueprint).
public enum RetrieveBusinessesResponseMyPartnerTier: String, Codable, Hashable, CaseIterable, Sendable {
    case first
    case second
    case blueprint
}