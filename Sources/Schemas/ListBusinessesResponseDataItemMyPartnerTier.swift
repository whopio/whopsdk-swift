import Foundation

/// Which tier the caller earns on for this business: `first` (they referred the owner) or `second` (they referred the first-tier partner).
public enum ListBusinessesResponseDataItemMyPartnerTier: String, Codable, Hashable, CaseIterable, Sendable {
    case first
    case second
}