//
//  TableViewDataSource.swift
//  InlinePicker
//
//  Created by Jeffrey Kereakoglow on 4/19/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

/// Helper object whose responsibility is to build the data source for the table view.
struct TableViewDataSource {
  static let dataSource: [CellModelType] = [
    SubtitleCellModel(rowIndex: 0, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 1, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 2, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 3, title: "Title", subTitle: "subtitle"),
    SubtitleCellModel(rowIndex: 4, title: "Title", subTitle: "subtitle")
  ]
}
