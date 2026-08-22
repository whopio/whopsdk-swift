import Foundation

/// Where the run step currently stands, or `null` when the chain has not been run
public enum AccountRecommendedActionChainStepStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case redirected
    case running
    case succeeded
    case failed
}