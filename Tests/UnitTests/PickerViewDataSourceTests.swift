//
//  PickerViewDataSourceTests.swift
//  InlinePicker
//
//  Created by Jeffrey Kereakoglow on 4/21/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import XCTest
@testable import InlinePicker

final class PickerViewDataSourceTests: XCTestCase {
  func testDataSourceIsNotNil() {
    XCTAssertNotNil(PickerViewDataSource.dataSource)
  }
}
