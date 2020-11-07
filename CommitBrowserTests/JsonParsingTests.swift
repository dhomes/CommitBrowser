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

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCommitParsing() throws {
        
        guard let url = Bundle.init(for: type(of: self)).url(forResource: "Commit", withExtension: "json") else {
            XCTFail("Commit.json not found")
            return
        }
        

        do {
            let data = try Data(contentsOf: url)
            let json = try JSON(data: data)
            guard let commit = GitHubCommit(json: json) else {
                XCTFail("could not parse Commit.json")
                return
            }
            print(commit)
        } catch {
            print(error)
            XCTFail(error.localizedDescription)
        }
    }
    
}
