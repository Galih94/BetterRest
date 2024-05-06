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
            Button("Date") {
                exampleDate()
            }
            Text(Date.now, format: .dateTime.day().month().year())
        }.padding()
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
