import Foundation

/// The substatus of a shipment
public enum ShipmentSubstatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case addressCorrection = "address_correction"
    case arrivedAtDestination = "arrived_at_destination"
    case arrivedAtFacility = "arrived_at_facility"
    case arrivedAtPickupLocation = "arrived_at_pickup_location"
    case awaitingInformation = "awaiting_information"
    case substatusCancelled = "substatus_cancelled"
    case damaged
    case delayed
    case deliveryException = "delivery_exception"
    case departedFacility = "departed_facility"
    case departedOriginFacility = "departed_origin_facility"
    case expired
    case substatusFailure = "substatus_failure"
    case held
    case substatusInTransit = "substatus_in_transit"
    case labelCreated = "label_created"
    case lost
    case missorted
    case substatusOutForDelivery = "substatus_out_for_delivery"
    case receivedAtDestinationFacility = "received_at_destination_facility"
    case receivedAtOriginFacility = "received_at_origin_facility"
    case refused
    case `return`
    case statusUpdate = "status_update"
    case transferredToDestinationCarrier = "transferred_to_destination_carrier"
    case transitException = "transit_exception"
    case substatusUnknown = "substatus_unknown"
    case weatherDelay = "weather_delay"
}