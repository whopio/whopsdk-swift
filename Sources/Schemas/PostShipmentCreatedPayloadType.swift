import Foundation

/// The webhook event type
public enum PostShipmentCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case shipmentCreated = "shipment.created"
}