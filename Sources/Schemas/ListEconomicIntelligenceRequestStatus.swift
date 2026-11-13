import Foundation

public enum ListEconomicIntelligenceRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case pending
    case ready
    case running
    case executed
    case incomplete
    case superseded
}