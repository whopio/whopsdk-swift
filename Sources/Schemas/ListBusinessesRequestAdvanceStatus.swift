import Foundation

public enum ListBusinessesRequestAdvanceStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case projected
    case available
    case accepted
    case funded
    case clawedBack = "clawed_back"
    case completed
    case expired
    case withdrawn
    case offered
}