import Foundation

/// Which columns can be used to sort.
public enum InvoicesSortableColumns: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case createdAt = "created_at"
    case dueDate = "due_date"
}