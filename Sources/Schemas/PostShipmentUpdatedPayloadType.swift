import Foundation

/// The webhook event type
public enum PostShipmentUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case shipmentUpdated = "shipment.updated"
}