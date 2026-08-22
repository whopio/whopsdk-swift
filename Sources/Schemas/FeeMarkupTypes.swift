import Foundation

/// The types of fee markups that can be configured
public enum FeeMarkupTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case cryptoWithdrawalMarkup = "crypto_withdrawal_markup"
    case rtpWithdrawalMarkup = "rtp_withdrawal_markup"
    case nextDayBankWithdrawalMarkup = "next_day_bank_withdrawal_markup"
    case bankWireWithdrawalMarkup = "bank_wire_withdrawal_markup"
    case digitalWalletWithdrawalMarkup = "digital_wallet_withdrawal_markup"
}