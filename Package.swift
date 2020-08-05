// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftB",
    products: [
        .library(name: "SwiftB", targets: ["SwiftB"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: "0.0.6"),
    ],
    targets: [
        .target(name: "SwiftB", dependencies: [
            .product(name: "Numerics", package: "swift-numerics")
        ]),
        .testTarget(name: "SwiftBTests", dependencies: ["SwiftB"]),
    ]
)
