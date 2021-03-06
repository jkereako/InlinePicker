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
  private var dataSource: TableViewDataSource!

  override func setUp() {
    dataSource = TableViewDataSource()
  }

  override func tearDown() {
    dataSource = nil
  }

  func testDataSourceIsNotNil() {
    XCTAssertNotNil(dataSource.dataSource)
  }

  func testDataSourceValues() {
    for i in 0..<dataSource.dataSource.count {
      for j in 0..<dataSource.dataSource[i].count {
        XCTAssertTrue(dataSource.dataSource[i][j] is SubtitleCellModel)
        XCTAssertEqual(dataSource.dataSource[i][j].rowIndex, j)
      }
    }
  }
}
