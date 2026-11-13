import Foundation

public final class ExperimentsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the experiments and feature flags owned by an account. Requires `experiment:read` on the account.
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
    ///     _ = try await client.experiments.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Owning account ID.
    /// - Parameter relatedResource: Filter by related resource; requires account_id.
    /// - Parameter status: Only experiments with this status.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: The field to sort experiments by.
    /// - Parameter direction: Sort direction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, relatedResource: ExperimentResourceReference? = nil, status: ListExperimentsRequestStatus? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListExperimentsRequestOrder? = nil, direction: ListExperimentsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListExperimentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/experiments",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "related_resource": relatedResource.map { .unknown($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListExperimentsResponse.self
        )
    }

    /// Creates an experiment or feature flag in `draft` status for an account. Nothing is served until you activate it with `POST /experiments/:id/activate`, which needs Economic Intelligence on for the account. Requires `experiment:manage` on the account.
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
    ///     _ = try await client.experiments.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         flagKey: "checkout_redesign_v2"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateExperimentsRequest, requestOptions: RequestOptions? = nil) async throws -> Experiment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/experiments",
            body: request,
            requestOptions: requestOptions,
            responseType: Experiment.self
        )
    }

    /// Evaluates experiments and feature flags for a subject and records an exposure. Pass `flag_key` to evaluate one flag, or omit it to evaluate every active flag in the account and related resource scope. Requires no authentication; when a credential resolves, its authentication method, API key ID, and signed-in user ID are recorded on the exposure event.
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
    ///     _ = try await client.experiments.exposures()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter subject: Bucketing subject: the user, account, or anonymous ID the experiment's `bucket_by` assigns on. Only the identity matching `bucket_by` is used; when it is missing, evaluating a single flag fails and a batch omits that experiment. Subjects outside every treatment range receive `control`. `subject[account_id]` also enables account-level targeting rules. Experiment ownership comes from the top-level `account_id`.
    /// - Parameter relatedResource: Restricts batch evaluation to this related resource; omitted batches contain only unbound experiments.
    /// - Parameter flagKey: Flag or experiment to evaluate — the flag_key handle or the `expt_` id. Omit to return all flags the caller qualifies for.
    /// - Parameter accountId: Owning account ID. Required when evaluating by flag_key or in a batch; optional for an expt_ ID.
    /// - Parameter properties: JSON-encoded scalar values that property targeting conditions match against. Numeric and boolean strings are coerced. Nested query keys such as properties[variant]=pro remain accepted for existing callers.
    /// - Parameter logExposure: Set `false` to read an assignment without recording an exposure, such as when a client caches assignments up front and records the exposure when the arm is rendered. Omitted records the exposure.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func exposures(subject: ExposuresExperimentsRequestSubject? = nil, relatedResource: ExperimentResourceReference? = nil, flagKey: String? = nil, accountId: String? = nil, properties: String? = nil, logExposure: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ExposuresExperimentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/experiments/exposures",
            queryParams: [
                "subject": subject.map { .unknown($0) }, 
                "related_resource": relatedResource.map { .unknown($0) }, 
                "flag_key": flagKey.map { .string($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "properties": properties.map { .string($0) }, 
                "log_exposure": logExposure.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ExposuresExperimentsResponse.self
        )
    }

    /// Retrieves an experiment or feature flag by its `expt_` ID or `flag_key` handle. Requires `experiment:read` on the owning account.
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
    ///     _ = try await client.experiments.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The experiment identifier — the `expt_` id or the flag_key handle.
    /// - Parameter accountId: Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> Experiment {
        return try await httpClient.performRequest(
            method: .get,
            path: "/experiments/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: Experiment.self
        )
    }

    /// Updates the targeting rules, treatment allocation, or hypothesis of an existing experiment or feature flag. To change its lifecycle, use the `activate`, `pause`, and `end` endpoints instead. Requires `experiment:manage` on the owning account.
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
    ///     _ = try await client.experiments.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The experiment identifier — the `expt_` id or the flag_key handle.
    /// - Parameter accountId: Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, accountId: String? = nil, request: Requests.UpdateExperimentsRequest, requestOptions: RequestOptions? = nil) async throws -> Experiment {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/experiments/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: Experiment.self
        )
    }

    /// Starts (or resumes) an experiment or feature flag so evaluation begins serving it. Activating a draft stamps `started_at`; resuming a paused experiment keeps the original start. Only drafts and paused experiments can be activated. Requires `experiment:manage` on the owning account. Activating needs Economic Intelligence on for the owning account: while the account's `economic_intelligence` is `false`, this returns a `403` and the experiment keeps its status. Turn it on with `PATCH /accounts/:account_id/preferences`. Creating, editing, pausing and ending an experiment don't need it.
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
    ///     _ = try await client.experiments.activate(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The experiment identifier — the `expt_` id or the flag_key handle.
    /// - Parameter accountId: Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func activate(id: String, accountId: String? = nil, request: Requests.ActivateExperimentsRequest, requestOptions: RequestOptions? = nil) async throws -> Experiment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/experiments/\(id)/activate",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: Experiment.self
        )
    }

    /// Concludes the experiment and records required `findings`. Pass `winning_arm` to serve the winning treatment to everyone; omit it when control won. Ended experiments cannot restart, but may be ended again to correct the winner. Requires `experiment:manage` on the owning account.
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
    ///     _ = try await client.experiments.end(
    ///         id: "id",
    ///         request: .init(findings: "Treatment lifted signups 12%, shipping it to everyone.")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The experiment identifier — the `expt_` id or the flag_key handle.
    /// - Parameter accountId: Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func end(id: String, accountId: String? = nil, request: Requests.EndExperimentsRequest, requestOptions: RequestOptions? = nil) async throws -> Experiment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/experiments/\(id)/end",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: Experiment.self
        )
    }

    /// Pauses an active experiment or feature flag: evaluation stops serving it and exposures stop flowing. Assignments are keyed on stable identity, so users return to their original arm when the experiment resumes. Requires `experiment:manage` on the owning account.
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
    ///     _ = try await client.experiments.pause(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The experiment identifier — the `expt_` id or the flag_key handle.
    /// - Parameter accountId: Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pause(id: String, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> Experiment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/experiments/\(id)/pause",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: Experiment.self
        )
    }
}