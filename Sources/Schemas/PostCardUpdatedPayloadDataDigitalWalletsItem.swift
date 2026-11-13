import Foundation

public enum PostCardUpdatedPayloadDataDigitalWalletsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case applePay = "apple_pay"
    case googlePay = "google_pay"
}