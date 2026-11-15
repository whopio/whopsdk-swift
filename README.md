# Whop Swift SDK

Call the Whop API from Swift.
Use Swift 5.7 or later and iOS 15 or later.

## Install

In Xcode, add `https://github.com/whopio/whopsdk-swift` as a package.
Select version `1.0.11`.

For SwiftPM, add this entry to `dependencies` in `Package.swift`:

```swift
.package(url: "https://github.com/whopio/whopsdk-swift", from: "1.0.11")
```

Add `.product(name: "WhopSDK", package: "whopsdk-swift")` to your target dependencies.

## Read products

This example reads public products from the test environment.
Call `readProducts(token:)` with a sandbox API key.

```swift
import WhopSDK

func readProducts(token: String) async throws {
    let client = Whop(
        baseURL: "https://sandbox-api.whop.com/api/v1",
        token: token
    )
    let products = try await client.products.list(first: 1)
    print(products.data.count)
}
```

Pass your API key as `token` to create products.
Keep business API keys on your server.

[API reference](reference.md) · [API guide](https://docs.whop.com/developer/quickstart)
