import Foundation

/// Where the step currently stands
public enum RecommendedActionExecutionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case redirected
    case running
    case succeeded
    case failed
}