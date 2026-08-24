import Foundation

public enum UpdateVerificationsRequestBody: Codable, Hashable, Sendable {
    /// Fields that can be updated on an individual (KYC) verification. At least one field is required.
    case updateVerificationsRequestBodyPersonalAddress(UpdateVerificationsRequestBodyPersonalAddress)
    /// Fields that can be updated on a business entity (KYB) verification. At least one field is required.
    case updateVerificationsRequestBodyBusinessAddress(UpdateVerificationsRequestBodyBusinessAddress)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(UpdateVerificationsRequestBodyPersonalAddress.self) {
            self = .updateVerificationsRequestBodyPersonalAddress(value)
        } else if let value = try? container.decode(UpdateVerificationsRequestBodyBusinessAddress.self) {
            self = .updateVerificationsRequestBodyBusinessAddress(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .updateVerificationsRequestBodyPersonalAddress(let value):
            try container.encode(value)
        case .updateVerificationsRequestBodyBusinessAddress(let value):
            try container.encode(value)
        }
    }
}