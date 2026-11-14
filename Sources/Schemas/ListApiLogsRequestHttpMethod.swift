import Foundation

public enum ListApiLogsRequestHttpMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}