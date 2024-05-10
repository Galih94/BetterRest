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
    @State private var coffeeAmount = 1
    let tomorrowInSecond: Double = 86_400
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack(spacing: 5) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(spacing: 5) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(spacing: 5) {
                    Text("Daily Coffee intake")
                        .font(.headline)
                    Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                }
            }
            .padding(16)
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate") {
                    calculateBedTime()
                }
            }
        }
    }
    
    private func calculateBedTime() {
        
    }
    
    private func exampleDate() {
        // get date 8.00 am
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        if let date = Calendar.current.date(from: components) {
//            print("date is: \(date)")
//        }
        
//        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
//        let hour = components.hour
//        let minute = components.minute
//        print("date is: \(hour):\(minute)")
    }
}

#Preview {
    ContentView()
}
