// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Router",
    platforms: [.iOS(.v18)],
    products: [
        .library(name: "Router",
                 targets: ["Router"]),
    ],
    targets: [
        .target(name: "Router"),
    ],
    swiftLanguageModes: [.v6]
)
