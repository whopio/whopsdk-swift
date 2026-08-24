import Foundation

public struct PaymentLastPaymentError: Codable, Hashable, Sendable {
    /// A machine-readable classification of the failure.
    public let code: Nullable<String>
    /// The reason the payment was declined.
    public let declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>
    /// A human-readable explanation of the failure.
    public let message: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: Nullable<String>,
        declineCode: Nullable<PaymentLastPaymentErrorDeclineCode>,
        message: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.declineCode = declineCode
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Nullable<String>.self, forKey: .code)
        self.declineCode = try container.decode(Nullable<PaymentLastPaymentErrorDeclineCode>.self, forKey: .declineCode)
        self.message = try container.decode(Nullable<String>.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.declineCode, forKey: .declineCode)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case declineCode = "decline_code"
        case message
    }
}