import Foundation

/// The webhook event type
public enum PostShippingAddressChangedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case shippingAddressChanged = "shipping_address.changed"
}