//
//  CommitsViewModelTests.swift
//  CommitBrowserTests
//
//  Created by dhomes on 11/8/20.
//

import XCTest
@testable import CommitBrowser

class CommitsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModelFetch() {
        
        let networkService = MockNetworkService()
        let repo = Repository.defaultRepository
        let viewModel = GitHubCommitsRootViewModel(networkService, repository: repo, pageSize: 3)
        
        let expectation = XCTestExpectation(description: "Testing ViewModel")
        expectation.expectedFulfillmentCount = 1
        viewModel.fetch(from: .top) { (error) in
            XCTAssert(error == nil)
            XCTAssert(viewModel.numberOfRows == 3)
            XCTAssert(viewModel.hasMore)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        
        while viewModel.hasMore {
            let newExpectation = XCTestExpectation(description: "new expectation")
            viewModel.fetch(from: .bottom) { error in
                XCTAssert(error == nil)
                newExpectation.fulfill()
            }
            wait(for: [newExpectation], timeout: 5)
        }
        
        XCTAssert(viewModel.numberOfRows == 20)
        let commits = viewModel.commits.value
        commits.forEach {
            print($0.date.description(with: Locale.current))
        }
        for i in 1..<commits.count {
            let previous = commits[i-1]
            let this = commits[i]
            XCTAssert(previous.date > this.date)
        }
        
    }

}
