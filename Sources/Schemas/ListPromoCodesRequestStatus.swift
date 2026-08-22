import Foundation

public enum ListPromoCodesRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case archived
    case expired
}