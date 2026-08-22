import Foundation

public enum ListBountiesRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case grossPaidOutAmount = "gross_paid_out_amount"
    case grossRewardAmount = "gross_reward_amount"
}