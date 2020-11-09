//
//  CommitDetailsViewModelTests.swift
//  CommitBrowserTests
//
//  Created by dhomes on 11/9/20.
//

import XCTest
@testable import CommitBrowser

class CommitDetailsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCommitDetailViewModel() throws {
        let networkService = MockNetworkService()
        let expectation = XCTestExpectation(description: "Testing ViewModel")
        expectation.expectedFulfillmentCount = 1
        let viewModel = GitHubCommitDetailsViewModel(networkService, commit: MockCommit())
        viewModel.fetch { (error) in
            XCTAssert(error == nil)
            XCTAssert(viewModel.hasFiles == true)
            XCTAssert(viewModel.files.value.count > 0)
            XCTAssert(viewModel.files.value.count == 10)
            expectation.fulfill()
        }
        let waiterResult = XCTWaiter.wait(for: [expectation], timeout: 5)
        XCTAssertEqual(waiterResult, .completed)
    }


}
