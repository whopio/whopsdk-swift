import Foundation

/// Where this step can be presented: `inline` inside your own page, `full_page` as a top-level navigation. Pick whichever listed mode suits your surface.
public enum PaymentNextActionDisplayInstructionsRenderItem: String, Codable, Hashable, CaseIterable, Sendable {
    case inline
    case fullPage = "full_page"
}