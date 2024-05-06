//
//  ContentView.swift
//  BetterRest
//
//  Created by Galih Samudra on 06/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    var body: some View {
        Stepper("\(sleepAmount) hours", value: $sleepAmount)
    }
}

#Preview {
    ContentView()
}
