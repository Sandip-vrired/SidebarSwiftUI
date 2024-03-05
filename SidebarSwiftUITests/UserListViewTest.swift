//
//  UserListViewTest.swift
//  SidebarSwiftUITests
//
//  Created by Sandip on 05/03/24.
//

import XCTest
@testable import SidebarSwiftUI

final class UserListViewTest: XCTestCase {
    private var filename:String?
    
    override func setUpWithError() throws {
        filename = "data"
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        filename = ""
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDataNotEmptyFromJson() throws {
        let exp = self.expectation(description: "userdata")
        let sut = makeSUT()
        let result = sut.fetchUserData(fileName: filename ?? "")
        switch result{
        case.success(let model):
            if model.count > 0{
                exp.fulfill()
                XCTAssertTrue(true)
            }else {
                XCTAssertTrue(false)
            }
        case.failure(let failure):
            XCTAssertThrowsError(failure)
        
        }
        waitForExpectations(timeout: 10)
    }
    
    private func makeSUT(
        userService: UserService = UserServiceImpl()) -> UserListUseCaseImpl {
        let sut = UserListUseCaseImpl(service: userService)
        return sut
    }
}
