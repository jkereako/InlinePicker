//
//  SubtitleCellModel.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

struct SubtitleCellModel: CellModelType {
  let state = CellModelState.Closed

  let rowIndex: Int
  let title: String
  let subTitle: String
}
