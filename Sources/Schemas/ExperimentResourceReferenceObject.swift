import Foundation

public enum ExperimentResourceReferenceObject: String, Codable, Hashable, CaseIterable, Sendable {
    case app
    case appBuild = "app_build"
    case product
    case plan
}