//
//  IssueTrackerNetworkTests.swift
//  IssueTrackerNetworkTests
//
//  Created by 박성민 on 2020/11/03.
//

import XCTest

class IssueTrackerNetworkTests: XCTestCase {

    func testNet() {
        let net = NetworkManager()
        net.getJson()
        print("test")
    }

}
