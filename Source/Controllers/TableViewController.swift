//
//  TableViewController.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
  private var dataSource: TableViewDataSource!

  convenience init(style: UITableViewStyle, dataSource: TableViewDataSource) {
    self.init(style: style)

    self.dataSource = dataSource
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource = TableViewDataSource()

    tableView.dataSource = dataSource
    tableView.delegate = dataSource
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 44
  }
}
