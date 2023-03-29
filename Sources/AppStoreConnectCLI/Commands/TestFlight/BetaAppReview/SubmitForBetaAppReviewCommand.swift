// Copyright 2023 Itty Bitty Apps Pty Ltd

import ArgumentParser
import Combine
import Foundation

struct SubmitForBetaAppReviewCommand: CommonParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "submit",
        abstract: "Submit for Beta App Review")

    @OptionGroup()
    var common: CommonOptions

    @OptionGroup()
    var build: BuildArguments

    func run() throws {
        let service = try makeService()

        try service.submitBuildForBetaAppReview(
            bundleId: build.bundleId,
            version: build.preReleaseVersion,
            buildNumber: build.buildNumber
        )
    }
}

