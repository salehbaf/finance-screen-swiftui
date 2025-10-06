//
//  ContentView.swift
//  AS2
//
//  Created by SDOT on 2025-10-01.
//



//
//  ContentView.swift
//  AS2
//
//  Created by SDOT on 2025-10-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Part 1 Tab
            NavigationStack {
                Part1View()
                    .navigationTitle("Straw Hat Registration")
            }
            .tabItem {
                Image(systemName: "person.3.fill")
                Text("Part 1")
            }

            // Part 2 Tab
            NavigationStack {
                Part2View()
            }
            .toolbar(.hidden, for: .navigationBar)
            .tabItem {
                Image(systemName: "bitcoinsign.circle.fill")
                Text("Part 2")
            }
        }
    }
}

#Preview {
    ContentView()
}
