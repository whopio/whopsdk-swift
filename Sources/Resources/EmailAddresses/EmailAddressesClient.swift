import Foundation

public final class EmailAddressesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the email addresses of the accounts you can read, and the mailboxes you own. A password is included only for mailboxes you can use.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.emailAddresses.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only addresses belonging to this account, prefixed biz_.
    /// - Parameter order: Field to sort by.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, order: ListEmailAddressesRequestOrder? = nil, direction: ListEmailAddressesRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListEmailAddressesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/email_addresses",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListEmailAddressesResponse.self
        )
    }

    /// Creates a mailbox on one of the account's domains. The domain needs the `email` capability turned on. The address can be created and signed in to while email is still setting up, and it can send once email is `ready`. Give it to a team member with `user_id`, or leave it out to share the mailbox with the account. Creating an address this account deleted brings the mailbox back, with its mail and a new password.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.emailAddresses.create(request: .init(address: "marcus@shinetime.example"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateEmailAddressesRequest, requestOptions: RequestOptions? = nil) async throws -> EmailAddress {
        return try await httpClient.performRequest(
            method: .post,
            path: "/email_addresses",
            body: request,
            requestOptions: requestOptions,
            responseType: EmailAddress.self
        )
    }

    /// Retrieves an email address. Its owner can always retrieve it; anyone else needs `email:read`. The password is included only if you can use the mailbox.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.emailAddresses.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Email address ID, prefixed `emaddr_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> EmailAddress {
        return try await httpClient.performRequest(
            method: .get,
            path: "/email_addresses/\(id)",
            requestOptions: requestOptions,
            responseType: EmailAddress.self
        )
    }

    /// Deletes the address. Mail apps signed in to it lose access, and mail sent to it is no longer received. Its mail is kept, and creating the address again in this account brings the mailbox back.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.emailAddresses.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Email address ID, prefixed `emaddr_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> EmailAddress {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/email_addresses/\(id)",
            requestOptions: requestOptions,
            responseType: EmailAddress.self
        )
    }

    /// Gives the mailbox to a team member, or shares it with the account, under a new password. A mailbox that had an owner starts empty, because its earlier mail is private to that owner; mail apps sync it again from the start.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.emailAddresses.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Email address ID, prefixed `emaddr_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateEmailAddressesRequest, requestOptions: RequestOptions? = nil) async throws -> EmailAddress {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/email_addresses/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: EmailAddress.self
        )
    }

    /// Downloads an Apple configuration profile that adds the mailbox to Mail on a Mac, iPhone or iPad, signed in and ready to send. Only the owner can download it for an owned mailbox; a shared one needs `email:read` and `email:send`.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.emailAddresses.mobileconfig(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Email address ID, prefixed `emaddr_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func mobileconfig(id: String, requestOptions: RequestOptions? = nil) async throws -> Data {
        return try await httpClient.performRequest(
            method: .get,
            path: "/email_addresses/\(id)/mobileconfig",
            requestOptions: requestOptions,
            responseType: Data.self
        )
    }

    /// Gives the mailbox a new password. Every mail app signed in with the old one loses access. Only the owner can reset an owned mailbox; a shared one needs `email:read` and `email:send`.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.emailAddresses.resetPassword(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Email address ID, prefixed `emaddr_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resetPassword(id: String, requestOptions: RequestOptions? = nil) async throws -> EmailAddress {
        return try await httpClient.performRequest(
            method: .post,
            path: "/email_addresses/\(id)/reset_password",
            requestOptions: requestOptions,
            responseType: EmailAddress.self
        )
    }
}