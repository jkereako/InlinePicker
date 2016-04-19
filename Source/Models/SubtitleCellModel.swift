//
//  SubtitleCellModel.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

class SubtitleCellModel: NSObject, CellModelType {
  let state = CellModelState.Closed

  let rowIndex: Int
  var title: String
  var subTitle: String
  var values: [String] {
    didSet {
      self.subTitle = self.values.joinWithSeparator(" ")
    }
  }

  init(rowIndex: Int, title: String, subTitle: String) {
    self.rowIndex = rowIndex
    self.title = title
    self.subTitle = subTitle
    values = [""]
  }
}
