//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ahad Islam on 4/25/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import SwiftUI

class User: ObservableObject, Codable {
  
  @Published var name = "Paul Hudson"
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
  }
  
  enum CodingKeys: CodingKey {
    case name
  }
  
  
}

struct ContentView: View {
  var body: some View {
    Text("Hello, World!")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
