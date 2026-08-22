import Foundation

/// The reason why a specific payment was billed
public enum BillingReasons: String, Codable, Hashable, CaseIterable, Sendable {
    case subscriptionCreate = "subscription_create"
    case subscriptionCycle = "subscription_cycle"
    case subscriptionUpdate = "subscription_update"
    case oneTime = "one_time"
    case manual
    case subscription
}