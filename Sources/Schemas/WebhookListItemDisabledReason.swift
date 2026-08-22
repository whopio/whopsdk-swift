import Foundation

/// Why Whop disabled this webhook. `delivery_failures` means every delivery failed for 3 days straight. `null` when `disabled_at` is `null`.
public enum WebhookListItemDisabledReason: String, Codable, Hashable, CaseIterable, Sendable {
    case deliveryFailures = "delivery_failures"
}