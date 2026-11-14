import Foundation

public enum RetrieveBreakdownResponseItemsItemObject: String, Codable, Hashable, CaseIterable, Sendable {
    case user
    case account
    case merchant
    case payoutDestination = "payout_destination"
    case balance
    case withdrawalAdjustment = "withdrawal_adjustment"
    case adCampaign = "ad_campaign"
}