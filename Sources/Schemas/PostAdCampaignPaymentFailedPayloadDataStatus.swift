import Foundation

/// The configured lifecycle status of the ad campaign. Billing failures preserve active or paused here and set delivery_status to payment_failed.
public enum PostAdCampaignPaymentFailedPayloadDataStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case paused
    case inactive
    case paymentFailed = "payment_failed"
    case draft
    case duplicating
}