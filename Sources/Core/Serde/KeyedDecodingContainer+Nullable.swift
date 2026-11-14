import Foundation

extension Swift.KeyedDecodingContainer {
    /// Decodes a Nullable<T>? value, properly handling missing vs null vs value
    /// Use this for `Optional<Nullable<T>>` fields
    public func decodeNullableIfPresent<T>(
        _ type: T.Type, forKey key: Swift.KeyedDecodingContainer<K>.Key
    ) throws -> Nullable<T>? where T: Swift.Decodable {
        if contains(key) {
            if try decodeNil(forKey: key) {
                return .null
            } else {
                let value = try decode(type, forKey: key)
                return .value(value)
            }
        } else {
            return nil
        }
    }

    /// Decodes a non-optional `Nullable<T>` response field, treating an absent key as
    /// `.null`.
    ///
    /// Generated models declare every nullable response field as `Nullable<T>` and read it
    /// with `container.decode(_:forKey:)`, which throws `keyNotFound` when the key is
    /// missing. A pinned older Api-Version-Date, a scope that redacts a field, or any
    /// payload the server legitimately downgrades therefore fails the WHOLE response
    /// rather than leaving one property unset. This overload is more specialized than the
    /// stdlib's generic `decode`, so it wins overload resolution at those call sites
    /// without any generated file changing.
    public func decode<T>(
        _ type: Nullable<T>.Type, forKey key: Swift.KeyedDecodingContainer<K>.Key
    ) throws -> Nullable<T> where T: Swift.Codable & Swift.Hashable & Swift.Sendable {
        guard contains(key) else { return .null }
        if try decodeNil(forKey: key) { return .null }
        return .value(try decode(T.self, forKey: key))
    }
}
