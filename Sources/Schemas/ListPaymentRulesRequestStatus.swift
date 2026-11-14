import Foundation

public enum ListPaymentRulesRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case deleted
}