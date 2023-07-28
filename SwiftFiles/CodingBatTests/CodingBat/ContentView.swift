//
//  ContentView.swift
//  CodingBat
//
//  Created by Grzegorz Kulesza on 18/07/2023.
//

import SwiftUI

struct ContentView: View {
    var imageName: String

    init(imageName: String = "globe") {
        self.imageName = imageName
    }

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
