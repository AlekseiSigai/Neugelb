// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "NeugelbUI",
    platforms: [.iOS(.v18)],
    products: [
        .library(name: "NeugelbUI",
            targets: ["NeugelbUI"]),
    ],
    targets: [
        .target(name: "NeugelbUI"),
    ],
    swiftLanguageModes: [.v6]
)
