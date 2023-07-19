//
//  ContentView.swift
//  TrafficLight
//
//  Created by Даниил Чупин on 19.07.2023.
//

import SwiftUI

enum TrafficLightState {
    case none
    case red
    case yellow
    case green
}

struct SignalView: View {
    var color: Color
    var lineWidth = 4.0

    var body: some View {
        Circle()
            .frame(width: 120, height: 120)
            .foregroundColor(color)
            .overlay(
                Circle()
                    .stroke(Color.black.opacity(0.7), lineWidth: lineWidth)
            )
    }
}

struct TrafficLightView: View {
    @State private var lightState: TrafficLightState = .none
    @State private var buttonText = "START"

    var body: some View {
        VStack(spacing: 30) {
            SignalView(color: lightState == .red ? .red : .red.opacity(0.3))
            
            SignalView(color: lightState == .yellow ? .yellow : .yellow.opacity(0.3))
            
            SignalView(color: lightState == .green ? .green : .green.opacity(0.3))
            
            Spacer()
            
            Button(action: {
                switch lightState {
                case .none:
                    lightState = .red
                    buttonText = "NEXT"
                case .red:
                    lightState = .yellow
                case .yellow:
                    lightState = .green
                case .green:
                    lightState = .red
                }
            }) {
                Text(buttonText)
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 40)
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        TrafficLightView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
