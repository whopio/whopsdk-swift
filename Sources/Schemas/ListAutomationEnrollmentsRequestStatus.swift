import Foundation

public enum ListAutomationEnrollmentsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case completed
    case canceled
}