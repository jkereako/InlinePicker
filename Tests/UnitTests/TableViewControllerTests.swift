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
  private var viewController: TableViewController!

  override func setUp() {
    viewController = TableViewController(style: .Plain, dataSource: TableViewDataSource.dataSource)
  }

  override func tearDown() {
    viewController = nil
  }

  func testNumberOfSections() {
    XCTAssertEqual(viewController.numberOfSectionsInTableView(viewController.tableView), 1)
  }

  func testNumberOfRowsInSection() {
    XCTAssertEqual(
      viewController.tableView(viewController.tableView, numberOfRowsInSection: 0),
      TableViewDataSource.dataSource.count
    )
  }
}
