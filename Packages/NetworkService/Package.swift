// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "NetworkService",
    platforms: [.iOS(.v18)],
    products: [
        .library(name: "NetworkService",
                 targets: ["NetworkService"]),
    ],
    dependencies: [
        .package(path: "../NGFoundation")
    ],
    targets: [
        .target(name: "NetworkService",
                dependencies: [
                    .product(name: "NGFoundation", package: "NGFoundation")
                ]),
    ],
    swiftLanguageModes: [.v6]
)
