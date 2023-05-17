//
//  ContentView.swift
//  LunchPicker
//
//  Created by ST SE on 10/5/2023.
//

import SwiftUI

struct ContentView: View {
    
    let food = Foods.examples
    @State private var selectedFood: Foods?
    @State private var shouldShowInfo: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 30) {
                
                Image("lunch")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                
                Text("Today Lunch")
                    .bold()
                    .font(.title)
                
                selectedFoodInfoView
                
                buttonActionView
            }
            .padding()
            .frame(maxWidth: .infinity)
            .animation(.spring(), value: shouldShowInfo)
        }
        .background(Color(.secondarySystemBackground))
    }
    
}
// MARK: - SubView
private extension ContentView{
    @ViewBuilder var selectedFoodNameView: some View{
        HStack{
            Group{
                Text(selectedFood!.name)
                    .id(selectedFood!.name)
                    .foregroundColor(.black)
                    .font(.largeTitle)
                Button {
                    withAnimation{
                        shouldShowInfo.toggle()
                    }
                } label: {
                    Text(Image(systemName: "info.circle.fill"))
                }
                .foregroundColor(.gray)
                .font(.title)
            }
            .transition(.asymmetric(insertion: .opacity.animation(.easeOut(duration: 0.5).delay(0.2)), removal: .opacity.animation(.easeInOut(duration: 0.4))))
            
        }
    }
    
    @ViewBuilder var selectedFoodInfoView: some View {
        if selectedFood?.name != .none{
            
            selectedFoodNameView
            
            if shouldShowInfo == true {
                Text("Calorie: " + selectedFood!.calorie.formatted())
                    .foregroundColor(.black)
                    .font(.title2)
                
                Grid(horizontalSpacing: 12, verticalSpacing: 12){
                    GridRow{
                        Text("Carb")
                        Text("Fat")
                        Text("Protein")
                    }.frame(minWidth: 60)
                    
                    Divider()
                        .gridCellUnsizedAxes(.horizontal)
                        .padding(.horizontal, -10)
                    
                    GridRow{
                        Text(selectedFood!.carb.formatted() + " g")
                        Text(selectedFood!.fat.formatted() + " g")
                        Text(selectedFood!.protein.formatted() + " g")
                    }
                }
                .padding()
                .foregroundColor(.gray)
                .font(.title3)
                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.white))
            }
            
        }
    }
    
    @ViewBuilder var buttonActionView: some View{
        Button {
            withAnimation{
                selectedFood = food.randomElement()
                shouldShowInfo = false
            }
        } label: {
            Text(selectedFood?.name == .none ? "Tell me": "Change").frame(width: 200)
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
                shouldShowInfo = false
            }
        }
        .font(.headline)
        .controlSize(.large)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
