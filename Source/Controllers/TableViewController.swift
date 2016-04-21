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

  private var dataSource: [CellModelType] = TableViewDataSource.dataSource

  convenience init(style: UITableViewStyle, dataSource: [CellModelType]) {
    self.init(style: style)

    self.dataSource = dataSource
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 44
  }

  // MARK: - Data source
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

  // MARK: - Delegate
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    var cellModel = dataSource[indexPath.row]
    // Prevents out-of-bounds indexing; either fetches the last row or the "next row".
    let rowIndex = min(indexPath.row + 1, dataSource.count - 1)

    switch cellModel.state {
    case .Closed:
      // Investigate the next cell model: If it's open, close it, and if it's closed, open it.
      let nextCellModel = dataSource[rowIndex]

      switch nextCellModel.state {
      case .Open:
        let anIndexPath = NSIndexPath(forRow: rowIndex, inSection: indexPath.section)
        let cell = tableView.cellForRowAtIndexPath(anIndexPath) as? PickerCell

        cell?.model = nil
        cellModel.values = nextCellModel.values

        dataSource.removeAtIndex(nextCellModel.rowIndex)

        tableView.deleteRowsAtIndexPaths(
          [NSIndexPath(forRow: rowIndex, inSection: indexPath.section)],
          withRowAnimation: .Top
        )

        //        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

      case .Closed:
        var nextRowIndex = rowIndex

        // If `nextCellModel` and `cellModel` have the same index, then they both reference the last
        // row in the table. If so, increment `nextRowIndex` by 1 so we may append a picker view to
        // the bottom of the table.
        if nextCellModel.rowIndex == cellModel.rowIndex {
          nextRowIndex = indexPath.row + 1
        }
        let nextCellModel = PickerViewCellModel(rowIndex: nextRowIndex)

        dataSource.insert(nextCellModel, atIndex: nextRowIndex)

        UIView.animateWithDuration(
          0.25,
          delay: 0,
          usingSpringWithDamping: 0.6,
          initialSpringVelocity: 0.3,
          options: .CurveEaseIn,
          animations: {
            tableView.insertRowsAtIndexPaths(
              [NSIndexPath(forRow: nextRowIndex, inSection: indexPath.section)],
              withRowAnimation: .Top
            )
          },
          completion: nil
        )
      }
      
    case .Open:
      // Do not respond to a tap on an open row
      break
    }
  }
}
