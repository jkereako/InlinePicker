//
//  PickerViewCellModel.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class PickerViewCellModel: NSObject, CellModelType {
  let state = CellModelState.Open
  let rowIndex: Int
  private let dataSource = ["Hello", "World"]

  init(rowIndex: Int) {
    self.rowIndex = rowIndex

    super.init()
  }
}

extension PickerViewCellModel: UIPickerViewDataSource {
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return dataSource.count
  }
}

extension PickerViewCellModel: UIPickerViewDelegate {
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->
    String? {

      return dataSource[row]
  }
}
