// Copyright 2023 Itty Bitty Apps Pty Ltd

import AppStoreConnect_Swift_SDK
import Combine
import Foundation

struct SubmitBuildForBetaAppReviewOperation: APIOperation {

    struct Options {
        let buildId: String
    }

    private let options: Options

    var endpoint: APIEndpoint<BetaAppReviewSubmissionResponse> {
        .submitAppForBetaReview(buildWithId: options.buildId)
    }

    init(options: Options) {
        self.options = options
    }

    func execute(with requestor: EndpointRequestor) -> AnyPublisher<Void, Error> {
        requestor
            .request(endpoint)
            .map { _ in () }
            .eraseToAnyPublisher()
    }
}
