//
//  TableViewControllerTests.swift
//  InlinePicker
//
//  Created by Jeffrey Kereakoglow on 4/21/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import XCTest
@testable import InlinePicker

final class TableViewControllerTests: TableViewControllerTestCase {
  func testStoryboardIsNotNil() {
    XCTAssertNotNil(
      UIStoryboard(name: Identifier.Storyboard.rawValue, bundle: NSBundle.mainBundle())
    )
  }

  func testViewControllerIsNotNil() {
    let storyboard = UIStoryboard(
      name: Identifier.Storyboard.rawValue, bundle: NSBundle.mainBundle()
    )
    let viewController = storyboard.instantiateViewControllerWithIdentifier(
      Identifier.ViewController.rawValue
      ) as! TableViewController

    XCTAssertNotNil(viewController)
  }

  func testDataSourceIsNotNil() {
    XCTAssertNotNil(sut.dataSource)
    XCTAssertNotNil(sut.dataSource.dataSource)
  }

  func testDataSourceCount() {
    XCTAssertEqual(sut.dataSource.dataSource.count, dataSource.count)
  }

  func testNumberOfSections() {
    XCTAssertEqual(sut.numberOfSectionsInTableView(sut.tableView), 1)
  }

  func testNumberOfRowsInSection() {
    let section = 0
    XCTAssertEqual(
      sut.tableView(sut.tableView, numberOfRowsInSection: section), dataSource[section].count
    )
  }

  func testTableViewDequeuesSubtitleRow() {
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    let cell = sut.tableView(sut.tableView, cellForRowAtIndexPath: indexPath)

    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is SubtitleCell)
  }

  func testTableViewDequeuesPickerRow() {
    let indexPath = NSIndexPath(forRow: 2, inSection: 0)
    let cell = sut.tableView(sut.tableView, cellForRowAtIndexPath: indexPath)

    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is PickerCell)
  }
}
