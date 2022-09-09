//
//  ContentView.swift
//  dm
//
//  Created by Justin Nguyen on 2022-05-19.
//

import SwiftUI

struct ContentView: View {
    @State private var tabIndex = 0
    
    var body: some View {

        TabView {
            ViewA()
                .tabItem() {
                    Image(systemName: "message.fill")
                    Text("Messages")
                }
            ViewB()
                .tabItem() {
                    Image("bluetooth")
                    Text("Bluetooth")
                }
            ViewC()
                .tabItem() {
                    Image(systemName: "slider.horizontal.3")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
