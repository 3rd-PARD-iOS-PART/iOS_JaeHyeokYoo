//
//  __1st_hw_YooJaeHyeokUITestsLaunchTests.swift
//  3.1st_hw_YooJaeHyeokUITests
//
//  Created by 유재혁 on 4/4/24.
//

import XCTest

final class __1st_hw_YooJaeHyeokUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
