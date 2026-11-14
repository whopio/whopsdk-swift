import Foundation

public enum RetrieveCardsResponseDigitalWalletsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case applePay = "apple_pay"
    case googlePay = "google_pay"
}