import Foundation

public enum ListAdCampaignsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case active
    case paused
    case paymentFailed = "payment_failed"
}