import Foundation

/// The type of end-user the app is built for. Cannot be changed on an app whose type is already `website`.
public enum UpdateAppsRequestAppType: String, Codable, Hashable, CaseIterable, Sendable {
    case b2BApp = "b2b_app"
    case b2CApp = "b2c_app"
    case companyApp = "company_app"
    case component
    case website
}