import Foundation

/// Which columns can be used to sort.
public enum EntriesSortableColumns: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case createdAt = "created_at"
}