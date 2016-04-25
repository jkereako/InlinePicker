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
  private var sut: TableViewController!
  private let dataSource: [CellModelType] = [
    SubtitleCellModel(rowIndex: 0, title: "Row 1", subTitle: "subtitle 1"),
    SubtitleCellModel(rowIndex: 1, title: "Row 2", subTitle: "subtitle 2"),
    PickerViewCellModel(rowIndex: 2),
    SubtitleCellModel(rowIndex: 3, title: "Row 4", subTitle: "subtitle 4"),
    SubtitleCellModel(rowIndex: 4, title: "Row 5", subTitle: "subtitle 5")
  ]

  override func setUp() {
    sut = TableViewController(style: .Plain, dataSource: TableViewDataSource())
  }

  override func tearDown() {
    sut = nil
  }
  
  func testNumberOfSections() {
    XCTAssertEqual(sut.numberOfSectionsInTableView(sut.tableView), 1)
  }

  func testNumberOfRowsInSection() {
    let section = 0
    XCTAssertEqual(
      sut.tableView(sut.tableView, numberOfRowsInSection: section),
      dataSource.count
    )
  }

  func testTableViewDequeuesSubtitleRow() {
    sut.tableView.registerClass(SubtitleCell.self, forCellReuseIdentifier: "subtitle")
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    let cell = sut.tableView(sut.tableView, cellForRowAtIndexPath: indexPath)

    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is SubtitleCell)
  }
  /*
  // This crashes because there the picker view is an IBOutlet and it is nil.
  func testTableViewDequeuesPickerRow() {
    viewController.tableView.registerClass(PickerCell.self, forCellReuseIdentifier: "picker")
    let indexPath = NSIndexPath(forRow: 2, inSection: 0)
    let cell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: indexPath)

    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is PickerCell)
  }
  */
}
