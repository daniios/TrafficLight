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
    let color: Color
    let opacity: Double
    let circleSize: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: circleSize, height: circleSize)
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(
                Circle()
                    .stroke(Color.black.opacity(0.7),
                            lineWidth: 4.0)
            )
    }
}

struct TrafficLightView: View {
    @State private var lightState: TrafficLightState = .none
    @State private var buttonText = "START"
    @State private var circleSize: CGFloat = 0

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            SignalView(color: .red,
                       opacity: lightState == .red ? 1.0 : 0.3,
                       circleSize: circleSize)
                        
            SignalView(color: .yellow,
                       opacity: lightState == .yellow ? 1.0 : 0.3,
                       circleSize: circleSize)
                        
            SignalView(color: .green,
                       opacity: lightState == .green ? 1.0 : 0.3,
                       circleSize: circleSize)
                        
            Spacer()
            
            Button(action: changeLightState) {
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
        .onAppear {
            circleSize = min(UIScreen.main.bounds.width,
                             UIScreen.main.bounds.height) * 0.3
        }
    }
    
    private func changeLightState() {
        withAnimation(.easeInOut(duration: 0.5)) {
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
        }
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
