import Foundation

/// Card region the processing fee was charged in, which sets `processing_rate_percentage`. `null` unless `status` is `rebated`.
public enum PaymentLevelsRebateRegion: String, Codable, Hashable, CaseIterable, Sendable {
    case usAndCanada = "us_and_canada"
    case europeUkAndAustralia = "europe_uk_and_australia"
    case latinAmerica = "latin_america"
    case peru
    case brazil
}