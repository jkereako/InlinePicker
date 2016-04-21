//
//  TableViewDataSourceTests.swift
//  InlinePicker
//
//  Created by Jeffrey Kereakoglow on 4/21/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import XCTest
@testable import InlinePicker

final class TableViewDataSourceTests: XCTestCase {
  func testDataSourceIsNotNil() {
    XCTAssertNotNil(TableViewDataSource.dataSource)
  }

  func testDataSourceValues() {
    for i in 0..<TableViewDataSource.dataSource.count {
      XCTAssertTrue(TableViewDataSource.dataSource[i] is SubtitleCellModel)
      XCTAssertEqual(TableViewDataSource.dataSource[i].rowIndex, i)
    }
  }
}
