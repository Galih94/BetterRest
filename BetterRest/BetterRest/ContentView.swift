//
//  ContentView.swift
//  BetterRest
//
//  Created by Galih Samudra on 06/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    let tomorrowInSecond: Double = 86_400
    var body: some View {
        VStack {
            DatePicker("Please select Date", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
                .labelsHidden()
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        }.padding()
    }
}

#Preview {
    ContentView()
}
