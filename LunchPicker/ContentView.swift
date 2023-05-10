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
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
            }
            
            Button("Tell me"){
                selectedFood = food.randomElement()
            }.font(.title)
                .buttonStyle(.borderedProminent)
            
            
            
            Button("Reset"){
                selectedFood = .none
            }.font(.headline)
            
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
