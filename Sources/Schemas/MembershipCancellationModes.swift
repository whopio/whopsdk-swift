import Foundation

/// The mode of cancellation for a membership
public enum MembershipCancellationModes: String, Codable, Hashable, CaseIterable, Sendable {
    case atPeriodEnd = "at_period_end"
    case immediate
}