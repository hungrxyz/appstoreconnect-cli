// Copyright 2020 Itty Bitty Apps Pty Ltd

import AppStoreConnect_Swift_SDK
import Combine

struct ListProfilesOperation: APIOperation {

    struct Options {
        let filterName: [String]
        let filterProfileState: ProfileState?
        let filterProfileType: [ProfileType]
        let sort: Profiles.Sort?
        let limit: Int?
    }

    private let options: Options

    init(options: Options) {
        self.options = options
    }

    func execute(with requestor: EndpointRequestor) throws -> AnyPublisher<[Profile], Error> {

        var filters = [Profiles.Filter]()

        filters += options.filterName.isEmpty ? [] : [.name(options.filterName)]

        filters += options.filterProfileType.isEmpty ? [] : [.profileType(options.filterProfileType)]

        filters += options.filterProfileState != nil ? [.profileState([options.filterProfileState!])] : []

        let limits: [Profiles.Limit] = options.limit != nil ? [.profiles(options.limit!)] : []

        let sort = [options.sort].compactMap { $0 }

        let endpoint = APIEndpoint.listProfiles(
            filter: filters,
            include: [.bundleId, .certificates, .devices],
            sort: sort,
            limit: limits
        )

        return requestor
            .request(endpoint)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
