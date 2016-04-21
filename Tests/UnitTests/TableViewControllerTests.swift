//
//  TableViewControllerTests.swift
//  InlinePicker
//
//  Created by Jeffrey Kereakoglow on 4/21/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import XCTest
@testable import InlinePicker

final class TableViewControllerTests: XCTestCase {
  private var tableVC: TableViewController!

  override func setUp() {
    tableVC = TableViewController(style: .Plain, dataSource: TableViewDataSource.dataSource)
  }

  override func tearDown() {
    tableVC = nil
  }

  func testDataSource() {
    XCTAssertNotNil(TableViewDataSource.dataSource)
  }
}
