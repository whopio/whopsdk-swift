import Foundation

/// The acquirer region `percentage` and `fixed` describe, for a fee that varies by where the money is processed. `null` for a fee that does not vary by region.
public enum AccountFeeRegion: String, Codable, Hashable, CaseIterable, Sendable {
    case usa
    case eu
    case ca
    case uk
    case au
    case co
    case mx
    case ke
    case cl
    case pe
    case ar
    case cr
    case gt
    case uy
    case br
    case ph
    case ng
    case my
    case `do`
    case sv
}