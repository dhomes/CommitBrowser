//
//  JsonParsinTests.swift
//  CommitBrowserTests
//
//  Created by dhomes on 11/6/20.
//

import XCTest
@testable import CommitBrowser

class JsonParsingTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
//        /XCUIApplication().launch()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserDecoding() throws {
        
        guard let url = Bundle.init(for: type(of: self)).url(forResource: "SampleUserJson", withExtension: "json") else {
            XCTFail("SampleJson not found")
            return
        }
        

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let user = try decoder.decode(GitHubUser.self, from: data)
            print(user)
            
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

}
