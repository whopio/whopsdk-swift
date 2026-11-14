import Foundation

public enum PostCardCanceledPayloadDataDigitalWalletsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case applePay = "apple_pay"
    case googlePay = "google_pay"
}