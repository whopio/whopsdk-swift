import Foundation

public enum PostShippingAddressChangedResponse: Codable, Hashable, Sendable {
    case shippingAddressChangedWebhookReply(ShippingAddressChangedWebhookReply)
    case postShippingAddressChangedResponseDecline(PostShippingAddressChangedResponseDecline)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ShippingAddressChangedWebhookReply.self) {
            self = .shippingAddressChangedWebhookReply(value)
        } else if let value = try? container.decode(PostShippingAddressChangedResponseDecline.self) {
            self = .postShippingAddressChangedResponseDecline(value)
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
        case .shippingAddressChangedWebhookReply(let value):
            try container.encode(value)
        case .postShippingAddressChangedResponseDecline(let value):
            try container.encode(value)
        }
    }
}