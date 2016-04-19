//
//  CellModelType.swift
//  InlinePicker
//
//  Created by Jeff Kereakoglow on 4/18/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation

protocol CellModelType {
  var state: CellModelState { get }
  var rowIndex: Int { get }
  var values: [String] { get set }
}