//
//  ContentView.swift
//  BetterRest
//
//  Created by Galih Samudra on 06/05/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    static var defaultWakeTime: Date {
        var component = DateComponents()
        component.hour = 5
        component.minute = 0
        return Calendar.current.date(from: component) ?? .now
    }
    
    var startSleepTime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            return "Your ideal bed time to sleep is \(sleepTime.formatted(date: .omitted, time: .shortened))"
        } catch {
            return "Found error \(error) on creating predictions"
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .listRowSeparator(.hidden)
                
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                .listRowSeparator(.hidden)
                
                Section {
                    Picker("Daily Coffee intake", selection: $coffeeAmount) {
                        ForEach(0..<21) {
                            Text("^[\($0) cup](inflect: true)")
                        }
                    }
                    .font(.headline)
                }
                .listRowSeparator(.hidden)
                
                Section {
                    Text("\(startSleepTime)")
                    .font(.headline)
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Better Rest")
        }
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
