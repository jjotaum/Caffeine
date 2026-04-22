# Caffeine

Caffeine is a Swift Package for Apple platform developers who want sharper app foundations without rebuilding the same utilities in every project.

It bundles practical building blocks for SwiftUI presentation, network requests, persistence, caching, symbols, and convenience extensions so you can move faster across iOS, macOS, tvOS, watchOS, and visionOS.

## Why Caffeine

- Build on top of reusable SwiftUI primitives for alerts, adaptive layouts, symbols, and view helpers.
- Keep networking lightweight with endpoint-driven request construction and async, callback, or Combine-based loading.
- Simplify persistence with convenience wrappers for `UserDefaults`, Core Data, and CloudKit-backed containers.
- Share small but useful extensions and constants across apps instead of re-implementing them per target.
- Ship one package across Apple platforms with modern Swift tools.

## Platform Support

- iOS 16+
- macOS 13+
- tvOS 16+
- watchOS 9+
- visionOS 1+

## What's Included

- `Commons`: compatibility helpers and shared settings primitives.
- `Constants`: numeric and string conveniences used across UI code.
- `Extensions`: quality-of-life additions for arrays, images, and SF Symbols integration.
- `Network`: composable API, endpoint, request coordination, and remote service abstractions.
- `Persistence`: cache helpers and a Core Data + CloudKit-friendly data controller.
- `Presentation`: SwiftUI utilities for alerts, adaptive containers, symbols, sizing, and view model support.

## Installation

Add Caffeine to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/jotaum/Caffeine.git", from: "0.9.3")
]
```

Then include it in your target:

```swift
.target(
    name: "YourTarget",
    dependencies: ["Caffeine"]
)
```

## License

Caffeine is available under the MIT license. See [LICENSE](LICENSE) for details.

