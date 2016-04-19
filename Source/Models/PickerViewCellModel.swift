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
  var values:[String]
  private let dataSource: [[String]] = [["Hello", "World"]]

  init(rowIndex: Int) {
    self.rowIndex = rowIndex
    values = [String](count: dataSource.count, repeatedValue: "")

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
