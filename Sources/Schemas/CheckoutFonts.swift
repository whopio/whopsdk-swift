import Foundation

/// The different font families available for checkout pages.
public enum CheckoutFonts: String, Codable, Hashable, CaseIterable, Sendable {
    case system
    case roboto
    case openSans = "open_sans"
}