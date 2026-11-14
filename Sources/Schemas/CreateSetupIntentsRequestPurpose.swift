import Foundation

/// What the saved payment method will pay for. Set to `ads_billing` when saving a card to pay for Whop Ads on `account_id`: the card is verified by Whop Ads, the merchant that charges it, which helps minimize security declines on ad payments, and it requires `ad_campaign:create` on `account_id`. Omit it for any other payment method.
public enum CreateSetupIntentsRequestPurpose: String, Codable, Hashable, CaseIterable, Sendable {
    case adsBilling = "ads_billing"
}