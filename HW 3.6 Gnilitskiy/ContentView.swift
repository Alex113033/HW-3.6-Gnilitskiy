//
//  ContentView.swift
//  HW 3.6 Gnilitskiy
//
//  Created by Александр on 23.09.2022.
//

import SwiftUI

enum RocketState {
    case begin
    case phaseOne
    case stop
    
    func getRunRocket() -> (CGFloat, CGFloat) {
        switch self {
        case .begin:
            return (0, 55)
        case .phaseOne:
            return (0, -100)
        case .stop:
            return (0, 55)
            
        }
        
    }
    
    func getRunPlanet() -> (CGFloat, CGFloat) {
        switch self {
        case .begin:
            return (0, 360)
        case .phaseOne:
            return (0, 1000)
        case .stop:
            return (0, 360)
            
        }
    }
}

enum StarState {
    case begin
    case stop
    
    func getRunStars() -> (CGFloat, CGFloat) {
        switch self {
        case .begin:
            return (0, -800)
        case .stop:
            return (0, 800)
            
        }
    }
    
}



struct ContentView: View {
    
    @State private var rocketOffSet = CGSize(width: 0, height: 55)
    @State private var planetOffSet = CGSize(width: 0, height: 360)
    @State private var starsOffSet = CGSize(width: 0, height: -800)
    
    private let animationDuration: TimeInterval = 4.0
    
    var body: some View {
        VStack {
            Button("TEST FLIGHT") {
                animate()
            }
            .bold()
            
            ZStack {
                TrafficStars()
                    .offset(starsOffSet)
                
                RocketElement()
                    .frame(width: 200, height: 200)
                    .offset(rocketOffSet)
                
                Image(systemName: "globe.asia.australia.fill")
                    .resizable()
                    .frame(width: 500, height: 500)
                    .foregroundColor(.blue)
                    .offset(planetOffSet)
            }
        }
    }
    
    
    func animate() {
        
        Timer.scheduledTimer(withTimeInterval: animationDuration / 2, repeats: true) { _ in
            withAnimation(.spring(response: animationDuration * 2 , dampingFraction: 1.0)) {
                setRunStars(state: .stop)
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration / 2, repeats: false) { _ in
            withAnimation(.spring(response: animationDuration * 2, dampingFraction: 0.5)) {
                setRunRocket(state: .phaseOne)
            }
            withAnimation(.spring(response: animationDuration / 2, dampingFraction: 1.0)) {
                setRunPlanet(state: .phaseOne)
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration * 2 , repeats: false) { _ in
            withAnimation(.spring(response: animationDuration * 2, dampingFraction: 0.85)) {
                setRunRocket(state: .stop)
            }
            withAnimation(.spring(response: animationDuration * 2, dampingFraction: 1.0)) {
                setRunPlanet(state: .stop)
            }
        }
    }
    
    private func setRunRocket(state: RocketState) {
        let offSet = state.getRunRocket()
        self.rocketOffSet = CGSize(width: offSet.0, height: offSet.1)
    }
    
    private func setRunPlanet(state: RocketState) {
        let offSet = state.getRunPlanet()
        self.planetOffSet = CGSize(width: offSet.0, height: offSet.1)
    }
    private func setRunStars(state: StarState) {
        let offSet = state.getRunStars()
        self.starsOffSet = CGSize(width: offSet.0, height: offSet.1)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
