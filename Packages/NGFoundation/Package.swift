// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "NGFoundation",
    products: [
        .library(name: "NGFoundation",
                 targets: ["NGFoundation"]),
    ],
    targets: [
        .target(name: "NGFoundation"),
    ],
    swiftLanguageModes: [.v6]
)
