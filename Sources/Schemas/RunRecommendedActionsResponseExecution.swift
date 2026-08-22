import Foundation

public enum RunRecommendedActionsResponseExecution: String, Codable, Hashable, CaseIterable, Sendable {
    case redirect
    case executed
}