//
//  RowSelectionTests.swift
//  InlinePicker
//
//  Created by Jeffrey Kereakoglow on 4/28/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import XCTest
@testable import InlinePicker

final class RowSelectionTests: TableViewControllerTestCase {
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
  func testSelectionOfSubtitleCellWithPickerCellBelowRemovesPickerCell() {
    let rowIndex = 1

    // First, assert that we have a subtitle cell and a picker cell below it.
    let subtitleCellIndexPath = NSIndexPath(forRow: rowIndex, inSection: 0)
    let subtitleCell1 = sut.tableView(sut.tableView, cellForRowAtIndexPath: subtitleCellIndexPath)

    XCTAssertNotNil(subtitleCell1)
    XCTAssertTrue(subtitleCell1 is SubtitleCell)

    let pickerCellIndexPath = NSIndexPath(forRow: rowIndex + 1, inSection: 0)

    let pickerCell = sut.tableView(sut.tableView, cellForRowAtIndexPath: pickerCellIndexPath)

    XCTAssertNotNil(pickerCell)
    XCTAssertTrue(pickerCell is PickerCell)

    sut.tableView(sut.tableView, didSelectRowAtIndexPath: subtitleCellIndexPath)

    // Assert that the subtitle row did not change after selection
    let subtitleCell2 = sut.tableView(sut.tableView, cellForRowAtIndexPath: subtitleCellIndexPath)

    XCTAssertNotNil(subtitleCell2)
    XCTAssertTrue(subtitleCell2 is SubtitleCell)
    XCTAssertEqual(subtitleCell1.textLabel?.text, subtitleCell2.textLabel?.text)

    // Assert that the pickerview did change
    let subtitleCell3 = sut.tableView(sut.tableView, cellForRowAtIndexPath: pickerCellIndexPath)

    XCTAssertNotNil(subtitleCell3)
    XCTAssertTrue(subtitleCell3 is SubtitleCell)
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
