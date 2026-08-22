import Foundation

public final class IdentityProfilesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of identity profiles. When company_id is provided, lists IPs currently linked to that company's ledger. When omitted, lists IPs linked to any ledger the actor can read (including child companies under a parent).
    ///
    /// Required permissions:
    ///  - `identity:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.identityProfiles.listIdentityProfile(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter companyId: The unique identifier of the company to filter to. When omitted, returns IPs across all ledgers the actor can read.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listIdentityProfile(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String? = nil, profileType: IdentityProfileKinds? = nil, status: IdentityProfileStatuses? = nil, requestOptions: RequestOptions? = nil) async throws -> ListIdentityProfileResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/identity_profiles",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": companyId.map { .string($0) }, 
                "profile_type": profileType.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListIdentityProfileResponse.self
        )
    }

    /// Retrieves the details of an existing identity profile.
    ///
    /// Required permissions:
    ///  - `identity:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.identityProfiles.retrieveIdentityProfile(id: "idpf_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the identity profile (idpf_xxx).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieveIdentityProfile(id: String, requestOptions: RequestOptions? = nil) async throws -> IdentityProfile {
        return try await httpClient.performRequest(
            method: .get,
            path: "/identity_profiles/\(id)",
            requestOptions: requestOptions,
            responseType: IdentityProfile.self
        )
    }

    /// Unlinks an IdentityProfile from a LedgerAccount (flips the matching link to is_current=false).
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.identityProfiles.unlinkIdentityProfile(
    ///         id: "idpf_xxxxxxxxxxxxx",
    ///         ledgerAccountId: "ldgr_xxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the IdentityProfile to unlink.
    /// - Parameter ledgerAccountId: The ID of the LedgerAccount to unlink the identity profile from.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unlinkIdentityProfile(id: String, ledgerAccountId: String, requestOptions: RequestOptions? = nil) async throws -> IdentityProfile {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/identity_profiles/\(id)",
            queryParams: [
                "ledger_account_id": .string(ledgerAccountId)
            ],
            requestOptions: requestOptions,
            responseType: IdentityProfile.self
        )
    }

    /// Returns a list of verifications attached to an identity profile, ordered by most recent first.
    ///
    /// Required permissions:
    ///  - `identity:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.identityProfiles.listVerificationsIdentityProfile(
    ///         id: "idpf_xxxxxxxxxxxxx",
    ///         first: 42,
    ///         last: 42
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the identity profile (idpf_xxx).
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listVerificationsIdentityProfile(id: String, after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListVerificationsIdentityProfileResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/identity_profiles/\(id)/verifications",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListVerificationsIdentityProfileResponse.self
        )
    }
}