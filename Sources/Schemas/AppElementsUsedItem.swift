import Foundation

/// Whop Elements the app's production web build mounts, as `<namespace>.<element>` keys (sub-controller children take a third segment, e.g. `payments.cardFields.cardNumber`). A bare namespace means the build reaches that namespace but the individual elements could not be resolved. Empty when the build mounts none, when it has not been scanned yet, or when the app has no production web build.
public enum AppElementsUsedItem: String, Codable, Hashable, CaseIterable, Sendable {
    case ads
    case adsBillingSetup = "ads.billing-setup"
    case adsCampaignCreator = "ads.campaign-creator"
    case adsReporting = "ads.reporting"
    case adsReportingChart = "ads.reporting.chart"
    case adsReportingTable = "ads.reporting.table"
    case checkout
    case checkoutCheckout = "checkout.checkout"
    case checkoutExpressCheckout = "checkout.expressCheckout"
    case payments
    case paymentsAddress = "payments.address"
    case paymentsBranding = "payments.branding"
    case paymentsCard = "payments.card"
    case paymentsCardFields = "payments.cardFields"
    case paymentsCardFieldsCardCvc = "payments.cardFields.cardCvc"
    case paymentsCardFieldsCardExpiry = "payments.cardFields.cardExpiry"
    case paymentsCardFieldsCardNumber = "payments.cardFields.cardNumber"
    case paymentsEmail = "payments.email"
    case paymentsPayment = "payments.payment"
    case paymentsTaxId = "payments.taxId"
    case tracking
    case trackingEvents = "tracking.events"
    case trackingPeople = "tracking.people"
    case wallet
    case walletActivity = "wallet.activity"
    case walletBalances = "wallet.balances"
    case walletBalancesBalance = "wallet.balances.balance"
    case walletBalancesList = "wallet.balances.list"
    case walletCards = "wallet.cards"
    case walletDeposit = "wallet.deposit"
    case walletSend = "wallet.send"
    case walletWithdraw = "wallet.withdraw"
    case websites
    case websitesPixelSetup = "websites.pixel-setup"
    case websitesWebsites = "websites.websites"
}