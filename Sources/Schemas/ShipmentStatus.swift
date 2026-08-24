import Foundation

/// The current delivery status of this shipment.
public enum ShipmentStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case unknown
    case preTransit = "pre_transit"
    case inTransit = "in_transit"
    case outForDelivery = "out_for_delivery"
    case delivered
    case availableForPickup = "available_for_pickup"
    case returnToSender = "return_to_sender"
    case failure
    case cancelled
    case error
}