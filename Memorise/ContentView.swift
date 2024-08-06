//
//  ContentView.swift
//  Memorise
//
//  Created by Alexander Frazis on 5/8/2024.
//
import SwiftUI
//import System


struct ContentView: View {
    
    var body: some View {
        VStack{
            Text("Memorise!").font(.largeTitle)
            ScrollView{
                CardView().
                
            }
            
        }
        .padding()
        
    }
}

struct CardView: View {
    var body: some View {
        
        let baseCard = RoundedRectangle(cornerRadius: 20)
            
        
        ZStack {
            baseCard
                .stroke(lineWidth: 10)
                .foregroundStyle(.orange)
            
            
        }
    }
}




#Preview {
    ContentView()
}
