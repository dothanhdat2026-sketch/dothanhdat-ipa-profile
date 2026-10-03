// swift-tools-version: 5.9
import PackageDescription
let package = Package(
    name: "DoThanhDat",
    platforms: [.iOS(.v17)],
    products: [.library(name: "DoThanhDat", targets: ["DoThanhDat"])],
    targets: [.target(name: "DoThanhDat", path: "DoThanhDat/App")]
)
