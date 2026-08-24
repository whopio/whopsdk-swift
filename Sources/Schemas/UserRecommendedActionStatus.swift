import Foundation

/// Always optional — never blocking
public enum UserRecommendedActionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case optional
}