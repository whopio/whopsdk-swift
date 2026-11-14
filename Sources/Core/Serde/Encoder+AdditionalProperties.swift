import Foundation

extension Swift.Encoder {
    func encodeAdditionalProperties<T: Swift.Encodable>(_ additionalProperties: [Swift.String: T])
        throws
    {
        var container = self.container(keyedBy: StringKey.self)
        for (key, value) in additionalProperties {
            try container.encode(value, forKey: .init(key))
        }
    }
}
