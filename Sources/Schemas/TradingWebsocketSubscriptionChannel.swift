import Foundation

/// The live update stream this subscription opens.
public enum TradingWebsocketSubscriptionChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case clearinghouseState = "clearinghouse_state"
    case openOrders = "open_orders"
    case orderUpdates = "order_updates"
    case userFills = "user_fills"
    case userEvents = "user_events"
}