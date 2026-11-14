import Foundation

/// How funds are delivered.
public enum CreateMethodsResponseSupportedPayoutMethodDeliveryType: String, Codable, Hashable, CaseIterable, Sendable {
    case cashPickup = "cash_pickup"
    case bankDeposit = "bank_deposit"
    case homeDelivery = "home_delivery"
    case mobileWallet = "mobile_wallet"
    case card
    case check
    case bill
    case cryptocurrency
    case unknown
}