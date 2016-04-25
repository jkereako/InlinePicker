//
//  TableViewController.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
  var dataSource: TableViewDataSource!

  override func viewDidLoad() {
    super.viewDidLoad()

    if dataSource == nil {
      dataSource = TableViewDataSource()
    }

    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 44
  }

  func setUpWithDataSource(dataSource: TableViewDataSource) {
    self.dataSource = dataSource
    tableView.dataSource = dataSource
    tableView.delegate = dataSource
  }

  // Delegate the methods below to the data source object.

  // MARK: - Data source
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return dataSource.numberOfSectionsInTableView(tableView)
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.tableView(tableView, numberOfRowsInSection: section)
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
    UITableViewCell {

      return dataSource.tableView(tableView, cellForRowAtIndexPath: indexPath)
  }

  // MARK: - Delegate
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    return dataSource.tableView(tableView, didSelectRowAtIndexPath: indexPath)
  }
}
