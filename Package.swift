// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftDSA",
	products: [
		.library(name: "DSATopics", targets: ["DSATopics"])
	],
    targets: [
        .executableTarget(
            name: "SwiftDSA",
			dependencies: ["DSATopics"]
        ),
		.target(name: "DSATopics")
    ]
)

