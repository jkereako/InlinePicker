//
//  TableViewDataSource.swift
//  InlinePicker
//
//  Created by Jeffrey Kereakoglow on 4/19/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

/// Helper object whose responsibility is to build the data source for the table view.
final class TableViewDataSource: NSObject {
  var dataSource: [[CellModelType]] = [[
    SubtitleCellModel(rowIndex: 0, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 1, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 2, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 3, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 4, title: "Title", subTitle: "subtitle")
    ]]

  private enum CellIdentifier: String {
    case Subtitle = "subtitle"
    case Picker = "picker"
  }

  private var pickerCellIndexPath: NSIndexPath?

  convenience init(dataSource: [[CellModelType]]) {
    self.init()

    self.dataSource = dataSource
  }
}

// MARK: - Data source
extension TableViewDataSource: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return dataSource.count
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource[section].count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
    UITableViewCell {

      let cellModel = dataSource[indexPath.section][indexPath.row]

      switch cellModel.state {
      case .Closed:
        let cell = tableView.dequeueReusableCellWithIdentifier(
          CellIdentifier.Subtitle.rawValue, forIndexPath: indexPath
          ) as! SubtitleCell

        cell.model = cellModel as? SubtitleCellModel

        return cell

      case .Open:
        let cell = tableView.dequeueReusableCellWithIdentifier(
          CellIdentifier.Picker.rawValue, forIndexPath: indexPath
          ) as! PickerCell

        cell.model = cellModel as? PickerViewCellModel
        return cell
      }
  }
}

// MARK: - Delegate
extension TableViewDataSource: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let cellModel = dataSource[indexPath.section][indexPath.row]
    var nextRowIndex = indexPath.row + 1

    switch cellModel.state {
    case .Closed:
      // If we have a picker view cell open, close it.
      if let pickerIndexPath = pickerCellIndexPath {

        // The removal of the picker cell only affects the row indexes of rows beneath it. This
        // check updates the value of `nextRowIndex` if the selected cell is beneath the picker cell.
        if indexPath.row > pickerIndexPath.row {
          nextRowIndex = indexPath.row
        }

        dataSource[pickerIndexPath.section].removeAtIndex(pickerIndexPath.row)

        tableView.deleteRowsAtIndexPaths([pickerIndexPath], withRowAnimation: .Top)

        pickerCellIndexPath = nil

        // Return early if the selected cell is the owner of the picker cell
        if pickerIndexPath.section == indexPath.section && pickerIndexPath.row == indexPath.row + 1 {
          return
        }
      }

      // Open a new picker view cell and save its location.
      let nextCellModel = PickerViewCellModel(rowIndex: nextRowIndex)

      dataSource[indexPath.section].insert(nextCellModel, atIndex: nextRowIndex)
      pickerCellIndexPath = NSIndexPath(forRow: nextRowIndex, inSection: indexPath.section)

      UIView.animateWithDuration(
        0.25,
        delay: 0,
        usingSpringWithDamping: 0.6,
        initialSpringVelocity: 0.3,
        options: .CurveEaseIn,
        animations: { [unowned self] in
          tableView.insertRowsAtIndexPaths([self.pickerCellIndexPath!], withRowAnimation: .Top)
        },
        completion: nil
      )

    case .Open:
      // Do not respond to a tap on an open row
      break
    }
  }
}
