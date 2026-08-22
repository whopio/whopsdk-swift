import Foundation

/// The type of end-user the app is built for.
public enum AppAppType: String, Codable, Hashable, CaseIterable, Sendable {
    case b2BApp = "b2b_app"
    case b2CApp = "b2c_app"
    case companyApp = "company_app"
    case component
    case website
}