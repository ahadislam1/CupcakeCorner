//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ahad Islam on 4/26/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
  
  @Published var type = 0
  @Published var quantity = 3
  
  @Published var specialRequestEnabled = false {
    didSet {
      if !specialRequestEnabled {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
  
  
  @Published var extraFrosting = false
  @Published var addSprinkles = false
  
}
