import Foundation

/// The charge to a saved payment method. Null unless `payment_method_id` was passed.
public struct CreateDepositsResponseMethodsCard: Codable, Hashable, Sendable {
    /// The custom metadata attached to the payment the charge created. Null if none was passed.
    public let metadata: Nullable<[String: Nullable<String>]>
    /// The payment the charge created, prefixed `pay_`. Retrieve it, or listen for `payment.succeeded`, to confirm the funds landed.
    public let paymentId: String
    /// The saved payment method that was charged, prefixed `payt_`.
    public let paymentMethodId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        metadata: Nullable<[String: Nullable<String>]>,
        paymentId: String,
        paymentMethodId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.metadata = metadata
        self.paymentId = paymentId
        self.paymentMethodId = paymentMethodId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metadata = try container.decode(Nullable<[String: Nullable<String>]>.self, forKey: .metadata)
        self.paymentId = try container.decode(String.self, forKey: .paymentId)
        self.paymentMethodId = try container.decode(String.self, forKey: .paymentMethodId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.paymentId, forKey: .paymentId)
        try container.encode(self.paymentMethodId, forKey: .paymentMethodId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case metadata
        case paymentId = "payment_id"
        case paymentMethodId = "payment_method_id"
    }
}