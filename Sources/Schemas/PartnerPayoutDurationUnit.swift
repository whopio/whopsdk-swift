import Foundation

/// Unit of the earning window. Month means a calendar month; day means a day.
public enum PartnerPayoutDurationUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case day
    case month
}