import Foundation

public enum ListCategoriesRequestAppType: String, Codable, Hashable, CaseIterable, Sendable {
    case b2BApp = "b2b_app"
    case b2CApp = "b2c_app"
}