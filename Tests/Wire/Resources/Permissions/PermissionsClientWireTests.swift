import Foundation
import Testing
import WhopSDK

@Suite("PermissionsClient Wire Tests") struct PermissionsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "action": "access_pass:basic:export",
                      "granted": false
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListPermissionsResponse(
            data: [
                ListPermissionsResponseDataItem(
                    action: PermissionAction.accessPassBasicExport,
                    granted: false
                )
            ]
        )
        let response = try await client.permissions.list(
            resourceId: "resource_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "action": "access_pass:basic:export",
                      "granted": true
                    },
                    {
                      "action": "access_pass:basic:export",
                      "granted": true
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListPermissionsResponse(
            data: [
                ListPermissionsResponseDataItem(
                    action: PermissionAction.accessPassBasicExport,
                    granted: true
                ),
                ListPermissionsResponseDataItem(
                    action: PermissionAction.accessPassBasicExport,
                    granted: true
                )
            ]
        )
        let response = try await client.permissions.list(
            resourceId: "resource_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}