import Foundation

public enum RetrieveVerificationsResponseKind: String, Codable, Hashable, CaseIterable, Sendable {
    case individual
    case business
}