// swift-tools-version:5.9
import PackageDescription

// The product keeps the adapter's name. The binary's module (BidmadGoogleAdMobAdapter) is what
// BidmadSDK looks up at runtime. BidmadGoogleAdMobAdapterLoader carries the dependencies a binary
// target cannot declare, plus generated class references that keep a static
// adapter's classes linked.
let package = Package(
  name: "BidmadGoogleAdMobAdapter",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "BidmadGoogleAdMobAdapter", targets: ["BidmadGoogleAdMobAdapterLoader"]),
  ],
  dependencies: [
    .package(url: "https://github.com/bidmad/BidmadSDK-SPM.git", .upToNextMinor(from: "7.2.0-dev.1")),
    .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.2.0"),
  ],
  targets: [
    .target(
      name: "BidmadGoogleAdMobAdapterLoader",
      dependencies: [
        "BidmadGoogleAdMobAdapter",
        .product(name: "BidmadSDK", package: "BidmadSDK-SPM"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ]
    ),
    .binaryTarget(
      name: "BidmadGoogleAdMobAdapter",
      url: "https://github.com/bidmad/BidmadGoogleAdMobAdapter-SPM/releases/download/13.2.01600-dev.1/BidmadGoogleAdMobAdapter.xcframework.zip",
      checksum: "75c5c24948eaaa604901982ce6b120a76566e93352d23a223a885d2250086336"
    ),
  ]
)
