import Foundation

extension Requests {
    public struct UpdateFeesRequest: Codable, Hashable, Sendable {
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let achDispute: UpdateFeesRequestAchDispute?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let achReturn: UpdateFeesRequestAchReturn?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let bankDeposit: UpdateFeesRequestBankDeposit?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let billing: UpdateFeesRequestBilling?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let buyer: UpdateFeesRequestBuyer?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let cardProcessing: UpdateFeesRequestCardProcessing?
        /// Default markups for subaccounts. Available on accounts without a parent, even before any accounts connect.
        public let childMarkups: UpdateFeesRequestChildMarkups?
        /// Changes to the payout fees this account covers for subaccounts. Send either all or individual category keys. Omitted categories stay unchanged; category changes have no effect while all is true.
        public let coveredPayoutFees: UpdateFeesRequestCoveredPayoutFees?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let crossBorder: UpdateFeesRequestCrossBorder?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let dispute: UpdateFeesRequestDispute?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let disputeAlert: UpdateFeesRequestDisputeAlert?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let disputeAlertCdrn: UpdateFeesRequestDisputeAlertCdrn?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let disputeAlertEthoca: UpdateFeesRequestDisputeAlertEthoca?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let disputeAlertRdr: UpdateFeesRequestDisputeAlertRdr?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let disputeRepresentment: UpdateFeesRequestDisputeRepresentment?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let foreignExchange: UpdateFeesRequestForeignExchange?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let fraudScreening: UpdateFeesRequestFraudScreening?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let highRisk: UpdateFeesRequestHighRisk?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let marketplace: UpdateFeesRequestMarketplace?
        /// Markups on this subaccount, set by the platform it is connected to.
        public let markups: UpdateFeesRequestMarkups?
        /// Why the fees are changing, recorded with the change. Required when a Whop Verified Partner edits the fee schedule; ignored for markups.
        public let notes: String?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let orchestration: UpdateFeesRequestOrchestration?
        /// Changes to non-card payment method fees, keyed by payment method type.
        public let paymentMethods: [String: UpdateFeesRequestPaymentMethodsValue]?
        /// Changes to withdrawal fees, keyed by payout method.
        public let payouts: [String: UpdateFeesRequestPayoutsValue]?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let pendingAutoTopup: UpdateFeesRequestPendingAutoTopup?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let platformProcessing: UpdateFeesRequestPlatformProcessing?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let poolPayout: UpdateFeesRequestPoolPayout?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let revshare: UpdateFeesRequestRevshare?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let sepaDispute: UpdateFeesRequestSepaDispute?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let sepaReturn: UpdateFeesRequestSepaReturn?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let taxCalculation: UpdateFeesRequestTaxCalculation?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let taxService: UpdateFeesRequestTaxService?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let threeDs: UpdateFeesRequestThreeDs?
        /// The fields of a fee the caller may change. Only the keys sent are replaced.
        public let transfers: UpdateFeesRequestTransfers?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            achDispute: UpdateFeesRequestAchDispute? = nil,
            achReturn: UpdateFeesRequestAchReturn? = nil,
            bankDeposit: UpdateFeesRequestBankDeposit? = nil,
            billing: UpdateFeesRequestBilling? = nil,
            buyer: UpdateFeesRequestBuyer? = nil,
            cardProcessing: UpdateFeesRequestCardProcessing? = nil,
            childMarkups: UpdateFeesRequestChildMarkups? = nil,
            coveredPayoutFees: UpdateFeesRequestCoveredPayoutFees? = nil,
            crossBorder: UpdateFeesRequestCrossBorder? = nil,
            dispute: UpdateFeesRequestDispute? = nil,
            disputeAlert: UpdateFeesRequestDisputeAlert? = nil,
            disputeAlertCdrn: UpdateFeesRequestDisputeAlertCdrn? = nil,
            disputeAlertEthoca: UpdateFeesRequestDisputeAlertEthoca? = nil,
            disputeAlertRdr: UpdateFeesRequestDisputeAlertRdr? = nil,
            disputeRepresentment: UpdateFeesRequestDisputeRepresentment? = nil,
            foreignExchange: UpdateFeesRequestForeignExchange? = nil,
            fraudScreening: UpdateFeesRequestFraudScreening? = nil,
            highRisk: UpdateFeesRequestHighRisk? = nil,
            marketplace: UpdateFeesRequestMarketplace? = nil,
            markups: UpdateFeesRequestMarkups? = nil,
            notes: String? = nil,
            orchestration: UpdateFeesRequestOrchestration? = nil,
            paymentMethods: [String: UpdateFeesRequestPaymentMethodsValue]? = nil,
            payouts: [String: UpdateFeesRequestPayoutsValue]? = nil,
            pendingAutoTopup: UpdateFeesRequestPendingAutoTopup? = nil,
            platformProcessing: UpdateFeesRequestPlatformProcessing? = nil,
            poolPayout: UpdateFeesRequestPoolPayout? = nil,
            revshare: UpdateFeesRequestRevshare? = nil,
            sepaDispute: UpdateFeesRequestSepaDispute? = nil,
            sepaReturn: UpdateFeesRequestSepaReturn? = nil,
            taxCalculation: UpdateFeesRequestTaxCalculation? = nil,
            taxService: UpdateFeesRequestTaxService? = nil,
            threeDs: UpdateFeesRequestThreeDs? = nil,
            transfers: UpdateFeesRequestTransfers? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.achDispute = achDispute
            self.achReturn = achReturn
            self.bankDeposit = bankDeposit
            self.billing = billing
            self.buyer = buyer
            self.cardProcessing = cardProcessing
            self.childMarkups = childMarkups
            self.coveredPayoutFees = coveredPayoutFees
            self.crossBorder = crossBorder
            self.dispute = dispute
            self.disputeAlert = disputeAlert
            self.disputeAlertCdrn = disputeAlertCdrn
            self.disputeAlertEthoca = disputeAlertEthoca
            self.disputeAlertRdr = disputeAlertRdr
            self.disputeRepresentment = disputeRepresentment
            self.foreignExchange = foreignExchange
            self.fraudScreening = fraudScreening
            self.highRisk = highRisk
            self.marketplace = marketplace
            self.markups = markups
            self.notes = notes
            self.orchestration = orchestration
            self.paymentMethods = paymentMethods
            self.payouts = payouts
            self.pendingAutoTopup = pendingAutoTopup
            self.platformProcessing = platformProcessing
            self.poolPayout = poolPayout
            self.revshare = revshare
            self.sepaDispute = sepaDispute
            self.sepaReturn = sepaReturn
            self.taxCalculation = taxCalculation
            self.taxService = taxService
            self.threeDs = threeDs
            self.transfers = transfers
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.achDispute = try container.decodeIfPresent(UpdateFeesRequestAchDispute.self, forKey: .achDispute)
            self.achReturn = try container.decodeIfPresent(UpdateFeesRequestAchReturn.self, forKey: .achReturn)
            self.bankDeposit = try container.decodeIfPresent(UpdateFeesRequestBankDeposit.self, forKey: .bankDeposit)
            self.billing = try container.decodeIfPresent(UpdateFeesRequestBilling.self, forKey: .billing)
            self.buyer = try container.decodeIfPresent(UpdateFeesRequestBuyer.self, forKey: .buyer)
            self.cardProcessing = try container.decodeIfPresent(UpdateFeesRequestCardProcessing.self, forKey: .cardProcessing)
            self.childMarkups = try container.decodeIfPresent(UpdateFeesRequestChildMarkups.self, forKey: .childMarkups)
            self.coveredPayoutFees = try container.decodeIfPresent(UpdateFeesRequestCoveredPayoutFees.self, forKey: .coveredPayoutFees)
            self.crossBorder = try container.decodeIfPresent(UpdateFeesRequestCrossBorder.self, forKey: .crossBorder)
            self.dispute = try container.decodeIfPresent(UpdateFeesRequestDispute.self, forKey: .dispute)
            self.disputeAlert = try container.decodeIfPresent(UpdateFeesRequestDisputeAlert.self, forKey: .disputeAlert)
            self.disputeAlertCdrn = try container.decodeIfPresent(UpdateFeesRequestDisputeAlertCdrn.self, forKey: .disputeAlertCdrn)
            self.disputeAlertEthoca = try container.decodeIfPresent(UpdateFeesRequestDisputeAlertEthoca.self, forKey: .disputeAlertEthoca)
            self.disputeAlertRdr = try container.decodeIfPresent(UpdateFeesRequestDisputeAlertRdr.self, forKey: .disputeAlertRdr)
            self.disputeRepresentment = try container.decodeIfPresent(UpdateFeesRequestDisputeRepresentment.self, forKey: .disputeRepresentment)
            self.foreignExchange = try container.decodeIfPresent(UpdateFeesRequestForeignExchange.self, forKey: .foreignExchange)
            self.fraudScreening = try container.decodeIfPresent(UpdateFeesRequestFraudScreening.self, forKey: .fraudScreening)
            self.highRisk = try container.decodeIfPresent(UpdateFeesRequestHighRisk.self, forKey: .highRisk)
            self.marketplace = try container.decodeIfPresent(UpdateFeesRequestMarketplace.self, forKey: .marketplace)
            self.markups = try container.decodeIfPresent(UpdateFeesRequestMarkups.self, forKey: .markups)
            self.notes = try container.decodeIfPresent(String.self, forKey: .notes)
            self.orchestration = try container.decodeIfPresent(UpdateFeesRequestOrchestration.self, forKey: .orchestration)
            self.paymentMethods = try container.decodeIfPresent([String: UpdateFeesRequestPaymentMethodsValue].self, forKey: .paymentMethods)
            self.payouts = try container.decodeIfPresent([String: UpdateFeesRequestPayoutsValue].self, forKey: .payouts)
            self.pendingAutoTopup = try container.decodeIfPresent(UpdateFeesRequestPendingAutoTopup.self, forKey: .pendingAutoTopup)
            self.platformProcessing = try container.decodeIfPresent(UpdateFeesRequestPlatformProcessing.self, forKey: .platformProcessing)
            self.poolPayout = try container.decodeIfPresent(UpdateFeesRequestPoolPayout.self, forKey: .poolPayout)
            self.revshare = try container.decodeIfPresent(UpdateFeesRequestRevshare.self, forKey: .revshare)
            self.sepaDispute = try container.decodeIfPresent(UpdateFeesRequestSepaDispute.self, forKey: .sepaDispute)
            self.sepaReturn = try container.decodeIfPresent(UpdateFeesRequestSepaReturn.self, forKey: .sepaReturn)
            self.taxCalculation = try container.decodeIfPresent(UpdateFeesRequestTaxCalculation.self, forKey: .taxCalculation)
            self.taxService = try container.decodeIfPresent(UpdateFeesRequestTaxService.self, forKey: .taxService)
            self.threeDs = try container.decodeIfPresent(UpdateFeesRequestThreeDs.self, forKey: .threeDs)
            self.transfers = try container.decodeIfPresent(UpdateFeesRequestTransfers.self, forKey: .transfers)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.achDispute, forKey: .achDispute)
            try container.encodeIfPresent(self.achReturn, forKey: .achReturn)
            try container.encodeIfPresent(self.bankDeposit, forKey: .bankDeposit)
            try container.encodeIfPresent(self.billing, forKey: .billing)
            try container.encodeIfPresent(self.buyer, forKey: .buyer)
            try container.encodeIfPresent(self.cardProcessing, forKey: .cardProcessing)
            try container.encodeIfPresent(self.childMarkups, forKey: .childMarkups)
            try container.encodeIfPresent(self.coveredPayoutFees, forKey: .coveredPayoutFees)
            try container.encodeIfPresent(self.crossBorder, forKey: .crossBorder)
            try container.encodeIfPresent(self.dispute, forKey: .dispute)
            try container.encodeIfPresent(self.disputeAlert, forKey: .disputeAlert)
            try container.encodeIfPresent(self.disputeAlertCdrn, forKey: .disputeAlertCdrn)
            try container.encodeIfPresent(self.disputeAlertEthoca, forKey: .disputeAlertEthoca)
            try container.encodeIfPresent(self.disputeAlertRdr, forKey: .disputeAlertRdr)
            try container.encodeIfPresent(self.disputeRepresentment, forKey: .disputeRepresentment)
            try container.encodeIfPresent(self.foreignExchange, forKey: .foreignExchange)
            try container.encodeIfPresent(self.fraudScreening, forKey: .fraudScreening)
            try container.encodeIfPresent(self.highRisk, forKey: .highRisk)
            try container.encodeIfPresent(self.marketplace, forKey: .marketplace)
            try container.encodeIfPresent(self.markups, forKey: .markups)
            try container.encodeIfPresent(self.notes, forKey: .notes)
            try container.encodeIfPresent(self.orchestration, forKey: .orchestration)
            try container.encodeIfPresent(self.paymentMethods, forKey: .paymentMethods)
            try container.encodeIfPresent(self.payouts, forKey: .payouts)
            try container.encodeIfPresent(self.pendingAutoTopup, forKey: .pendingAutoTopup)
            try container.encodeIfPresent(self.platformProcessing, forKey: .platformProcessing)
            try container.encodeIfPresent(self.poolPayout, forKey: .poolPayout)
            try container.encodeIfPresent(self.revshare, forKey: .revshare)
            try container.encodeIfPresent(self.sepaDispute, forKey: .sepaDispute)
            try container.encodeIfPresent(self.sepaReturn, forKey: .sepaReturn)
            try container.encodeIfPresent(self.taxCalculation, forKey: .taxCalculation)
            try container.encodeIfPresent(self.taxService, forKey: .taxService)
            try container.encodeIfPresent(self.threeDs, forKey: .threeDs)
            try container.encodeIfPresent(self.transfers, forKey: .transfers)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case achDispute = "ach_dispute"
            case achReturn = "ach_return"
            case bankDeposit = "bank_deposit"
            case billing
            case buyer
            case cardProcessing = "card_processing"
            case childMarkups = "child_markups"
            case coveredPayoutFees = "covered_payout_fees"
            case crossBorder = "cross_border"
            case dispute
            case disputeAlert = "dispute_alert"
            case disputeAlertCdrn = "dispute_alert_cdrn"
            case disputeAlertEthoca = "dispute_alert_ethoca"
            case disputeAlertRdr = "dispute_alert_rdr"
            case disputeRepresentment = "dispute_representment"
            case foreignExchange = "foreign_exchange"
            case fraudScreening = "fraud_screening"
            case highRisk = "high_risk"
            case marketplace
            case markups
            case notes
            case orchestration
            case paymentMethods = "payment_methods"
            case payouts
            case pendingAutoTopup = "pending_auto_topup"
            case platformProcessing = "platform_processing"
            case poolPayout = "pool_payout"
            case revshare
            case sepaDispute = "sepa_dispute"
            case sepaReturn = "sepa_return"
            case taxCalculation = "tax_calculation"
            case taxService = "tax_service"
            case threeDs = "three_ds"
            case transfers
        }
    }
}