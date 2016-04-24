//
//  PickerViewCellModel.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

final class PickerViewCellModel: NSObject, CellModelType {
  let state = CellModelState.Open
  let rowIndex: Int
  var values:[String]
  let dataSource: [[String]] = PickerViewDataSource.dataSource

  init(rowIndex: Int) {
    self.rowIndex = rowIndex
    self.values = [String](count: dataSource.count, repeatedValue: "")

    // Initialize `values` to the first row in the data source so at least there is something.
    var i = 0
    for component in dataSource {
      values[i] = component[0]
      i += 1
    }

    super.init()
  }
}

extension PickerViewCellModel: UIPickerViewDataSource {
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return dataSource.count
  }

  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return dataSource[component].count
  }
}

extension PickerViewCellModel: UIPickerViewDelegate {
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->
    String? {

      return dataSource[component][row]
  }

  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    values[component] = dataSource[component][row]
  }
}
