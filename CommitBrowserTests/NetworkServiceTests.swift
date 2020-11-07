//
//  NetworkServiceTests.swift
//  CommitBrowserTests
//
//  Created by dhomes on 11/6/20.
//

import XCTest
@testable import CommitBrowser

class NetworkServiceTests: XCTestCase {


    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkService() {
        let expectation = XCTestExpectation(description: "Testing Service")
        expectation.expectedFulfillmentCount = 1
        let repo = Repository.defaultRepository
        let query = Query.defaultQuery
        let request = GitHubRequest.getCommits(repo, query)
        let network = GitHubNetworkService()
        
        network.getCommits(with: request) { result in
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
    
    func testFetchWithDate() {
        let past = Date.distantPast
        let expectation = XCTestExpectation(description: "Testing Zero results")
        expectation.expectedFulfillmentCount = 1
        let repo = Repository.defaultRepository
        let query = Query(pageSize: nil, below: past)
        let request = GitHubRequest.getCommits(repo,query)
        let network = GitHubNetworkService()
        
        network.getCommits(with: request) { result in
            
            switch result {
            case .failure(let error):
                print(error)
                XCTFail(error.localizedDescription)
            case .success(let commits):
                print(commits.count)
                print(commits)
                XCTAssertTrue(commits.count == 0, "More than zero returns")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }


}
