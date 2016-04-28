//
//  TableViewControllerTestCase.swift
//  InlinePicker
//
//  Created by Jeffrey Kereakoglow on 4/28/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import XCTest
@testable import InlinePicker

class TableViewControllerTestCase: XCTestCase {
  var storyboard: UIStoryboard!
  var sut: TableViewController!
  let dataSource: [[CellModelType]] = [[
    SubtitleCellModel(rowIndex: 0, title: "Row 1", subTitle: "subtitle 1"),
    SubtitleCellModel(rowIndex: 1, title: "Row 2", subTitle: "subtitle 2"),
    PickerViewCellModel(rowIndex: 2),
    SubtitleCellModel(rowIndex: 3, title: "Row 4", subTitle: "subtitle 4"),
    SubtitleCellModel(rowIndex: 4, title: "Row 5", subTitle: "subtitle 5"),
    SubtitleCellModel(rowIndex: 5, title: "Row 5", subTitle: "subtitle 6")
  ]]

  enum Identifier: String {
    case Storyboard = "Main"
    case ViewController = "tableViewController"
  }

  override func setUp() {
    super.setUp()

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

    super.tearDown()
  }
}
