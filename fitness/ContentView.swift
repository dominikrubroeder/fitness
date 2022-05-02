//
//  ContentView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            HomeView()
                .tabItem {
                    Label("Übersicht", systemImage: "42.circle")
                }
            FitnessPlusView()
                .tabItem {
                    Label("Fitness+", systemImage: "42.circle")
                }
            ShareView()
                .tabItem {
                    Label("Teilen", systemImage: "42.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
