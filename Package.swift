// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Caffeine",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Caffeine",
            targets: ["Caffeine"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Caffeine",
            dependencies: []),
        .testTarget(
            name: "CaffeineTests",
            dependencies: ["Caffeine"]),
    ]
)
