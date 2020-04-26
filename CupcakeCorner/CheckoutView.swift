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
  
  @State private var confirmationMessage = ""
  @State private var showingConfirmation = false
  
  @State private var errorMessage = ""
  @State private var showingError = false
  
  var body: some View {
    GeometryReader { geo in
      ScrollView {
        VStack {
          Image("cupcakes")
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width)
          
          Text("Your total is $\(self.order.cost, specifier: "%.2f")")
            .font(.title)
          
          Button("Place Order") {
            self.placeOrder()
          }
          .padding()
          
        }
      }
    }
    .alert(isPresented: $showingConfirmation) {
      Alert(title: Text("Thank you"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
    }
    .alert(isPresented: $showingError) {
      Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
    }
        .navigationBarTitle("Check out", displayMode: .inline)
    }
    
    func placeOrder() {
      guard let encoded = try? JSONEncoder().encode(order) else {
        print("Failed to encode order.")
        return
      }
      
      let url = URL(string: "https://reqres.in/api/cupcakes")!
      var request = URLRequest(url: url)
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      request.httpMethod = "POST"
      request.httpBody = encoded
      
      URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
          print("Something went wrong: \(error?.localizedDescription)")
          return
        }
        
        if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
          self.confirmationMessage = "Your order for \(decodedOrder.quantity) \(Order.types[decodedOrder.type].lowercased()) is on its way!"
          self.showingConfirmation = true
        } else {
          self.errorMessage = "No internet"
          self.showingError = true
      }
    }.resume()
    
    
    
  }
}

struct CheckoutView_Previews: PreviewProvider {
  static var previews: some View {
    CheckoutView(order: Order())
  }
}
