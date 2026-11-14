import Foundation

public enum UpdateCardsResponseDigitalWalletsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case applePay = "apple_pay"
    case googlePay = "google_pay"
}