//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ahad Islam on 4/26/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
  @ObservedObject var order: Order
  
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
