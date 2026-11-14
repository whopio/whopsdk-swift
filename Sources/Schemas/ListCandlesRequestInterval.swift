import Foundation

public enum ListCandlesRequestInterval: String, Codable, Hashable, CaseIterable, Sendable {
    case oneH = "1h"
    case twoH = "2h"
    case fourH = "4h"
    case sixH = "6h"
    case twelveH = "12h"
    case oneD = "1d"
    case oneW = "1w"
}