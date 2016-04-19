//
//  TableViewController.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  private enum CellIdentifier: String {
    case Subtitle = "subtitle"
    case Picker = "picker"
  }

  private var dataSource: [CellModelType] = [
    SubtitleCellModel(rowIndex: 0, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 1, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 2, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 3, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 4, title: "Title", subTitle: "subtitle")
    ] {
    didSet {
      tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 44
  }

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
    UITableViewCell {

      let cellModel = dataSource[indexPath.row]

      switch cellModel.state {
      case .Closed:
        guard let cell = tableView.dequeueReusableCellWithIdentifier(
          CellIdentifier.Subtitle.rawValue, forIndexPath: indexPath
          ) as? SubtitleCell else {

            assertionFailure("Unable to dequeue `SubtitleCell`.")
            return UITableViewCell()
        }

        cell.model = cellModel as? SubtitleCellModel

        return cell

      case .Open:
        guard let cell = tableView.dequeueReusableCellWithIdentifier(
          CellIdentifier.Picker.rawValue, forIndexPath: indexPath
          ) as? PickerCell else {

            assertionFailure("Unable to dequeue `PickerCell`.")
            return UITableViewCell()
        }

        cell.model = cellModel as? PickerViewCellModel

        return cell
      }
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let cellModel = dataSource[indexPath.row]

    switch cellModel.state {
    case .Closed:

      // If the row is closed and the row is the last row, open the last row
      if indexPath.row == dataSource.count - 1 {
        dataSource.insert(
          PickerViewCellModel(rowIndex: indexPath.row + 1), atIndex: indexPath.row + 1
        )
        
        return
      }

      let nextCell = dataSource[indexPath.row + 1]

      switch nextCell.state {
      case .Open:
        dataSource.removeAtIndex(nextCell.rowIndex)
      case .Closed:
        dataSource.insert(
          PickerViewCellModel(rowIndex: indexPath.row + 1), atIndex: indexPath.row + 1
        )
      }

    case .Open:
      break
    }
  }
  
}
