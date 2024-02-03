//
//  ContentView.swift
//  SwiftUIWalkthrough
//
//  Created by Jacob Davis on 1/18/24.
//

import SwiftUI

enum Sport: String, CaseIterable {
    case golf, soccer, football, baseball
    case noneSelected = "none"
}

struct ContentView1: View {
    var size = CGFloat(75)
    let sports: [Sport] = Sport.allCases
    
    @State var submitted = false
    @State var selectedSport: Sport
    
    init(selectedSport: Sport) {
        self._selectedSport = State(initialValue: .noneSelected)
    }
    
    var body: some View {
        Spacer()
        VStack(spacing: 100) {
            Text("Favorite Sport")
                .font(.largeTitle)
            HStack {
                VStack {
                    SportButton(sport: .golf, size: size, selectedSport: $selectedSport)
                    
                    SportButton(sport: .football, size: size, selectedSport: $selectedSport)
                }
                VStack {
                    SportButton(sport: .soccer, size: size, selectedSport: $selectedSport)
                    
                    SportButton(sport: .baseball, size: size, selectedSport: $selectedSport)
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button(
                action: {
                    submitted = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        submitted = false
                    }
                },
                label: {
                    Text("Submit")
                        .frame(width: 300, height: 25)
                }
            )
            .padding(.bottom, 100)
            .buttonStyle(.borderedProminent)
            
            
        }
        if submitted {
            Text("You chose \(selectedSport.rawValue)")
        } else {
            Text("Please choose a sport")
        }
        
        Spacer()
    }
}

struct SportButton: View {
    let sport: Sport
    let size: CGFloat
    @Binding var selectedSport: Sport
    
    var body: some View {
        Button(
            action: {
                selectedSport = sport
            },
            label: {
                Text(sport.rawValue.capitalized)
                    .frame(width: size, height: size)
            }
        )
        .tint(.green.opacity(sport == selectedSport ? 1.0 : 0.3))
    }
}










// MARK: Ignore Everything Below Me
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Important Test")
                .font(.largeTitle)
            
            Spacer()
            
            Text("Summer Or Winter?")
            HStack {
                Button(
                    action: { },
                    label: {
                        Text("Summer")
                            .padding(10)
                            .frame(width: 150)
                    }
                )
                Button(
                    action: { },
                    label: {
                        Text("Winter")
                            .padding(10)
                            .frame(width: 150)
                    }
                )
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.white)
            
            Text("Light or Dark Mode?")
            HStack {
                Button(
                    action: { },
                    label: {
                        Text("Light Mode")
                            .padding(10)
                            .frame(width: 150)
                    }
                )
                Button(
                    action: { },
                    label: {
                        Text("Dark Mode")
                            .padding(10)
                            .frame(width: 150)
                    }
                )
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.white)
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView1(selectedSport: .noneSelected)
}
