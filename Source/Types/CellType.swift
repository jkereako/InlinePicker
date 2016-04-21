//
//  CellType.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

protocol CellType {
  associatedtype CellModel

  var model: CellModel? { get set }
}
