import Foundation
import Testing
@testable import WhopSDK

struct EmptyObjectEncodingTests {
    @Test func everyGeneratedOpenEmptyObjectEncodesAsAnObject() throws {
        let inputs: [any Encodable] = [
            Requests.AcceptChannelsRequest(),
            Requests.HideChannelsRequest(),
            Requests.MarkUnreadChannelsRequest(),
            Requests.ReopenChannelsRequest(),
            Requests.ResolveChannelsRequest(),
            CreateDomainsRequestApplePay(),
            CreateDomainsRequestEmail(),
            CreateDomainsRequestPixel(),
            CreateDomainsRequestSubdomain(),
            CreateDomainsRequestVerification(),
            UpdateDomainsRequestApplePay(),
            UpdateDomainsRequestEmail(),
            UpdateDomainsRequestPixel(),
            UpdateDomainsRequestSubdomain(),
            UpdateDomainsRequestVerification(),
        ]
        for input in inputs {
            let body = try Serde.jsonEncoder.encode(value: EncodableValue(input))
            #expect(String(data: body, encoding: .utf8) == "{}")
        }
    }

    @Test func knownPropertiesAndAdditionalPropertiesRemainInTheSameObject() throws {
        let additionalObjects: [[String: JSONValue]] = [[:], ["zeta": 1]]
        for additional in additionalObjects {
            let request = Requests.CreateAccountLinksRequest(
                accountId: "biz_audit",
                refreshUrl: "refresh",
                returnUrl: "return",
                useCase: .accountOnboarding,
                additionalProperties: additional
            )
            let body = try Serde.jsonEncoder.encode(request)
            let object = try JSONDecoder().decode([String: JSONValue].self, from: body)
            var expected: [String: JSONValue] = [
                "account_id": "biz_audit",
                "refresh_url": "refresh",
                "return_url": "return",
                "use_case": "account_onboarding",
            ]
            expected.merge(additional) { _, additional in additional }
            #expect(object == expected)
        }
    }

    @Test func emptyChannelBodiesReachTheTransport() async throws {
        let inputs: [any Encodable] = [
            Requests.AcceptChannelsRequest(),
            Requests.HideChannelsRequest(),
            Requests.MarkUnreadChannelsRequest(),
            Requests.ReopenChannelsRequest(),
            Requests.ResolveChannelsRequest(),
        ]
        for input in inputs {
            let stub = HTTPStub()
            stub.setResponse(body: Data())
            let client = HTTPClient(config: ClientConfig(baseURL: "https://sandbox.example/api/v1", headers: stub.headers, urlSession: stub.urlSession))
            try await client.performRequest(method: .post, path: "/channels/audit", body: input)
            let body = try #require(stub.takeLastRequest()?.httpBody)
            #expect(String(data: body, encoding: .utf8) == "{}")
        }
    }

    @Test func openEmptyObjectsKeepExplicitAndRequestAdditionalProperties() async throws {
        let stub = HTTPStub()
        stub.setResponse(body: Data())
        let client = HTTPClient(config: ClientConfig(baseURL: "https://sandbox.example/api/v1", headers: stub.headers, urlSession: stub.urlSession))
        try await client.performRequest(
            method: .post,
            path: "/channels/audit",
            body: Requests.AcceptChannelsRequest(additionalProperties: ["zeta": 1]),
            requestOptions: RequestOptions(additionalBodyProperties: ["alpha": true])
        )
        let body = try #require(stub.takeLastRequest()?.httpBody)
        #expect(String(data: body, encoding: .utf8) == #"{"alpha":true,"zeta":1}"#)
    }
}
