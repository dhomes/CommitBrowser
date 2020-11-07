//
//  NetworkServiceTests.swift
//  CommitBrowserTests
//
//  Created by dhomes on 11/6/20.
//

import XCTest
@testable import CommitBrowser

class NetworkServiceTests: XCTestCase {

    class NetworkProvider<T : NetworkService> {
        private var service : T
        private var request : APIRequest
        init(service : T, request : APIRequest) {
            self.service = service
            self.request = request
        }
        func fetchCommits(_ completion : ((Result<[T.Commit],Error>) -> ())?) {
            service.getCommits(with: request) { result in
                completion?(result)
            }
        }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkService() throws {
        typealias Commit = GitHubCommit
        let expectation = XCTestExpectation(description: "Testing Service")
        expectation.expectedFulfillmentCount = 1
        let request = GitHubRequest.getCommits("dhomes", "commitbrowser", 25)
        let provider = NetworkProvider(service: GitHubNetworkService(), request: request)
        provider.fetchCommits { result in
            switch result {
            case .failure(let error):
                print(error)
                XCTFail(error.localizedDescription)
            case .success(let commits):
                print(commits.count)
                XCTAssert(commits.count > 0)
                for (i, commit) in commits.enumerated() {
                    print("-------------- COMMIT \(i)--------------")
                    print(commit)
                }
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }


}
