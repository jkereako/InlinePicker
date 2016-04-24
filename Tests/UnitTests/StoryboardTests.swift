//
//  StoryboardTests.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/24/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import XCTest
@testable import InlinePicker

final class StoryboardTests: XCTestCase {
  func testStoryboardIsNotNil() {
    XCTAssertNotNil(UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()))
  }
}
