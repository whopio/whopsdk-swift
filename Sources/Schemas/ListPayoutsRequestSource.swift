import Foundation

public enum ListPayoutsRequestSource: String, Codable, Hashable, CaseIterable, Sendable {
    case api
    case dashboard
    case automatic
}