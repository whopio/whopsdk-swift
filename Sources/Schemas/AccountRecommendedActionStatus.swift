import Foundation

/// Always optional — never blocking
public enum AccountRecommendedActionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case optional
}