import Foundation

public enum InvoiceTotalsStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case estimated
    case final
}