import Foundation

/// The card region this fee applies to.
public enum AccountProcessingOfferRegionalRateRegion: String, Codable, Hashable, CaseIterable, Sendable {
    case usAndCanada = "us_and_canada"
    case europeUkAndAustralia = "europe_uk_and_australia"
    case latinAmerica = "latin_america"
    case peru
    case brazil
}