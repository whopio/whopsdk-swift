import Foundation

public enum AccountCompanyFormationStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case processing
    case filed
    case rejected
    case completed
}