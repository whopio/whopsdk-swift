import Foundation

enum QueryParameter {
    case string(Swift.String)
    case bool(Swift.Bool)
    case int(Swift.Int)
    case uint(Swift.UInt)
    case uint64(Swift.UInt64)
    case int64(Swift.Int64)
    case float(Swift.Float)
    case double(Swift.Double)
    case date(Foundation.Date)
    case calendarDate(CalendarDate)
    case stringArray([Swift.String])
    case uuid(Foundation.UUID)
    case unknown(Any)

    func queryItems(name: Swift.String) throws -> [Foundation.URLQueryItem] {
        if case .unknown(let value) = self {
            guard let encodable = value as? any Swift.Encodable else {
                throw WhopSDKError.encodingError(
                    Swift.EncodingError.invalidValue(
                        value,
                        Swift.EncodingError.Context(codingPath: [], debugDescription: "Query parameter \(name) must be Encodable")
                    )
                )
            }
            do {
                let data = try Serde.jsonEncoder.encode(value: EncodableValue(encodable))
                let object = try Foundation.JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
                return try Self.queryItems(value: object, name: name, nested: false)
            } catch {
                throw WhopSDKError.encodingError(error)
            }
        }
        if case .stringArray(let values) = self {
            return values.filter { !$0.isEmpty }.map { Foundation.URLQueryItem(name: name, value: $0) }
        }
        let value = try scalarString()
        return value.isEmpty ? [] : [Foundation.URLQueryItem(name: name, value: value)]
    }

    private func scalarString() throws -> Swift.String {
        switch self {
        case .string(let value):
            return value
        case .bool(let value):
            return value ? "true" : "false"
        case .int(let value):
            return Swift.String(value)
        case .uint(let value):
            return Swift.String(value)
        case .uint64(let value):
            return Swift.String(value)
        case .int64(let value):
            return Swift.String(value)
        case .float(let value):
            return Swift.String(value)
        case .double(let value):
            return Swift.String(value)
        case .date(let value):
            return value.ISO8601Format()
        case .calendarDate(let value):
            return value.description
        case .uuid(let value):
            return value.uuidString
        case .stringArray, .unknown:
            throw WhopSDKError.encodingError(
                Swift.EncodingError.invalidValue(
                    self,
                    Swift.EncodingError.Context(codingPath: [], debugDescription: "Query value requires structured encoding")
                )
            )
        }
    }

    private static func queryItems(value: Any, name: Swift.String, nested: Swift.Bool) throws -> [Foundation.URLQueryItem] {
        if value is Foundation.NSNull {
            return []
        }
        if let object = value as? [Swift.String: Any] {
            return try object.sorted { $0.key < $1.key }.flatMap { key, value in
                try queryItems(value: value, name: "\(name)[\(key)]", nested: true)
            }
        }
        if let array = value as? [Any] {
            return try array.flatMap { element in
                let childName = nested || element is [Swift.String: Any] || element is [Any] ? "\(name)[]" : name
                return try queryItems(value: element, name: childName, nested: true)
            }
        }
        if let string = value as? Swift.String {
            return string.isEmpty ? [] : [Foundation.URLQueryItem(name: name, value: string)]
        }
        let data = try Foundation.JSONSerialization.data(withJSONObject: value, options: [.fragmentsAllowed, .sortedKeys])
        let scalar = Swift.String(decoding: data, as: UTF8.self)
        return [Foundation.URLQueryItem(name: name, value: scalar)]
    }
}
