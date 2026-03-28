// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftDSA",
	products: [
		.library(name: "DSATopics", targets: ["DSATopics"]),
		.library(name: "DSAProblems", targets: ["DSAProblems"])
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
	],
    targets: [
        .executableTarget(
            name: "SwiftDSA",
			dependencies: ["DSATopics", "DSAProblems"]
        ),
		.target(name: "DSATopics"),
		.target(name: "DSAProblems")
    ]
)
