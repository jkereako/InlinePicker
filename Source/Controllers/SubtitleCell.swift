//
//  SubtitleCell.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

final class SubtitleCell: UITableViewCell, CellType {
  var model: SubtitleCellModel? {
    didSet {
      textLabel?.text = model?.title
      detailTextLabel?.text = model?.subTitle
    }
  }
}
