import Foundation

public struct PaymentNextActionCollectCardPresentData: Codable, Hashable, Sendable {
    /// The Stripe PaymentIntent client secret the Terminal SDK retrieves, collects and confirms this payment with. Treat it as a credential: together with a card-present connection token it is what a device needs to take the payment.
    public let clientSecret: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        clientSecret: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.clientSecret = clientSecret
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.clientSecret, forKey: .clientSecret)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case clientSecret = "client_secret"
    }
}