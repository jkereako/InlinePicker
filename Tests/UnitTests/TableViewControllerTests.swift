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
  private let dataSource: [CellModelType] = [
    SubtitleCellModel(rowIndex: 0, title: "Row 1", subTitle: "subtitle 1"),
    SubtitleCellModel(rowIndex: 1, title: "Row 2", subTitle: "subtitle 2"),
    SubtitleCellModel(rowIndex: 2, title: "Row 3", subTitle: "subtitle 3"),
    SubtitleCellModel(rowIndex: 3, title: "Row 4", subTitle: "subtitle 4"),
    SubtitleCellModel(rowIndex: 4, title: "Row 5", subTitle: "subtitle 5")
  ]

  override func setUp() {
    viewController = TableViewController(style: .Plain, dataSource: dataSource)
  }

  override func tearDown() {
    viewController = nil
  }

  func testNumberOfSections() {
    XCTAssertEqual(viewController.numberOfSectionsInTableView(viewController.tableView), 1)
  }

  func testNumberOfRowsInSection() {
    let section = 0
    XCTAssertEqual(
      viewController.tableView(viewController.tableView, numberOfRowsInSection: section),
      dataSource.count
    )
  }

  func testTableViewRowDequeue() {
    viewController.tableView.registerClass(SubtitleCell.self, forCellReuseIdentifier: "subtitle")
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    let cell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: indexPath)

    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is SubtitleCell)
  }
}
