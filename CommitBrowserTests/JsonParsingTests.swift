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
        
        guard let url = Bundle.init(for: type(of: self)).url(forResource: "SampleUser", withExtension: "json") else {
            XCTFail("SampleUserJson not found")
            return
        }
        

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let user = try decoder.decode(CommitUser.self, from: data)
            print(user)
            
        } catch {
            print(error)
            XCTFail(error.localizedDescription)
        }
    }
    
    func testUserSummaryDecoding() throws {
        guard let url = Bundle.init(for: type(of: self)).url(forResource: "UserSummary", withExtension: "json") else {
            XCTFail("UserSummary not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let user = try decoder.decode(CommitUserSummary.self, from: data)
            print(user)
            
        } catch {
            print(error)
            XCTFail(error.localizedDescription)
        }
    }

    func testDecodingCommitData() throws {
        guard let url = Bundle.init(for: type(of: self)).url(forResource: "CommitData", withExtension: "json") else {
            XCTFail("CommitData not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let commitData = try decoder.decode(CommitDataSummary.self, from: data)
            print(commitData)
            
        } catch {
            print(error)
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodingCommit() throws {
        guard let url = Bundle.init(for: type(of: self)).url(forResource: "Commit", withExtension: "json") else {
            XCTFail("Commit Data not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let commitData = try decoder.decode(GitHubCommit.self, from: data)
            print(commitData)
            
        } catch {
            print(error)
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodeArray() throws {
        guard let url = Bundle.init(for: type(of: self)).url(forResource: "Commits", withExtension: "json") else {
            XCTFail("Commits Data not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let commitsData = try decoder.decode([GitHubCommit].self, from: data)
            print(commitsData)
            XCTAssert(commitsData.count > 0)
        } catch {
            print(error)
            XCTFail(error.localizedDescription)
        }
    }
}
