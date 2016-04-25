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
  private var storyboard: UIStoryboard!
  private var sut: TableViewController!
  private let dataSource: [CellModelType] = [
    SubtitleCellModel(rowIndex: 0, title: "Row 1", subTitle: "subtitle 1"),
    SubtitleCellModel(rowIndex: 1, title: "Row 2", subTitle: "subtitle 2"),
    PickerViewCellModel(rowIndex: 2),
    SubtitleCellModel(rowIndex: 3, title: "Row 4", subTitle: "subtitle 4"),
    SubtitleCellModel(rowIndex: 4, title: "Row 5", subTitle: "subtitle 5"),
    SubtitleCellModel(rowIndex: 5, title: "Row 5", subTitle: "subtitle 6")
  ]

  private enum Identifier: String {
    case Storyboard = "Main"
    case ViewController = "tableViewController"
  }

  override func setUp() {
    storyboard = UIStoryboard(name: Identifier.Storyboard.rawValue, bundle: NSBundle.mainBundle())
    sut = storyboard.instantiateViewControllerWithIdentifier(Identifier.ViewController.rawValue) as!
    TableViewController
    sut.setUpWithDataSource(TableViewDataSource(dataSource: dataSource))

    // This line gurantees that the initial view controller is the TableViewController
    UIApplication.sharedApplication().keyWindow!.rootViewController = sut
  }

  override func tearDown() {
    storyboard = nil
    sut = nil
    UIApplication.sharedApplication().keyWindow!.rootViewController = nil
  }

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
    XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 0), dataSource.count)
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

  /// A tap on the picker view cell ought to have no effect. This test simulates a tap on the picker
  /// view cell.
  func testSelectionOfSubtitleCellCreatesAPickerCellBelow() {
    let rowIndex = 3
    // This code is identical to the test above it. Uncertain if it's bad practice.
    let subtitleCellIndexPath = NSIndexPath(forRow: rowIndex, inSection: 0)
    let subtitleCell = sut.tableView(sut.tableView, cellForRowAtIndexPath: subtitleCellIndexPath)

    XCTAssertNotNil(subtitleCell)
    XCTAssertTrue(subtitleCell is SubtitleCell)

    sut.tableView(sut.tableView, didSelectRowAtIndexPath: subtitleCellIndexPath)

    let pickerCellIndexPath = NSIndexPath(forRow: rowIndex + 1, inSection: 0)

    let pickerCell = sut.tableView(sut.tableView, cellForRowAtIndexPath: pickerCellIndexPath)

    XCTAssertNotNil(pickerCell)
    XCTAssertTrue(pickerCell is PickerCell)
  }

  /// A tap on the picker view cell ought to have no effect. This test simulates a tap on the picker
  /// view cell.
  func testSelectionOfPickerCellDoesNothing() {
    // This code is identical to the test above it. Uncertain if it's bad practice.
    let indexPath = NSIndexPath(forRow: 2, inSection: 0)
    let pickerCell = sut.tableView(sut.tableView, cellForRowAtIndexPath: indexPath)

    XCTAssertNotNil(pickerCell)
    XCTAssertTrue(pickerCell is PickerCell)

    sut.tableView(sut.tableView, didSelectRowAtIndexPath: indexPath)

    let subtitleCell = sut.tableView(sut.tableView, cellForRowAtIndexPath: indexPath)

    XCTAssertNotNil(subtitleCell)
    XCTAssertTrue(subtitleCell is PickerCell)
  }
}
