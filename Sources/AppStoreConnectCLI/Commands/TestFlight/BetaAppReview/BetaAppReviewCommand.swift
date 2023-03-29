// Copyright 2023 Itty Bitty Apps Pty Ltd

import ArgumentParser
import Foundation

public struct TestFlightBetaAppReviewCommand: ParsableCommand {
    public static var configuration = CommandConfiguration(
        commandName: "betaappreview",
        abstract: "Information about beta app reviews.",
        subcommands: [
            SubmitForBetaAppReviewCommand.self
        ]
    )

    public init() {
    }
}
