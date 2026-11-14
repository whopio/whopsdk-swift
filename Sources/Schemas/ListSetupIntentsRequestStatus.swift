import Foundation

public enum ListSetupIntentsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case succeeded
    case canceled
    case requiresAction = "requires_action"
}