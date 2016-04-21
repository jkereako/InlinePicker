//
//  PickerCell.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class PickerCell: UITableViewCell, CellType {
  @IBOutlet weak var pickerView: UIPickerView!

  var model: PickerViewCellModel? {
    didSet {
      pickerView.dataSource = model
      pickerView.delegate = model

      // Reset the selected views
      let limit = model?.dataSource.count ?? 0
      for i in 0..<limit {
        pickerView.selectRow(0, inComponent: i, animated: false)
      }
    }
  }
}
