//
//  ContentView.swift
//  LunchPicker
//
//  Created by ST SE on 10/5/2023.
//

import SwiftUI

struct ContentView: View {
    
    let food = ["food1", "food2", "food3", "food4", "food5"]
    @State private var selectedFood: String?
    
    var body: some View {
        VStack(spacing: 30) {
            Image("lunch")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
                
                
            Text("Today Lunch")
                .bold()
                .font(.title)
            
            if selectedFood != .none{
                
                Text(selectedFood ?? "")
                    .id(selectedFood)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .transition(.asymmetric(insertion: .opacity.animation(.easeOut(duration: 0.5).delay(0.2)), removal: .opacity.animation(.easeInOut(duration: 0.4))))
                
            }
            Button {
                withAnimation{
                    selectedFood = food.randomElement()
                }
            } label: {
                Text(selectedFood == .none ? "Tell me": "Change").frame(width: 200)
                    .transformEffect(.identity)
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .padding(.bottom, -10)
            

            
            
            
            Button("Reset"){
                withAnimation {
                    selectedFood = .none
                }
            }
            .font(.headline)
            .controlSize(.large)
            
            
            
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
//        .animation(.easeInOut, value: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
