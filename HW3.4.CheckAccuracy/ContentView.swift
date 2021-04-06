//
//  ContentView.swift
//  HW3.4.CheckAccuracy
//
//  Created by Alexander Konovalov on 06.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = 0
    @State private var sliderValue = 0
    @State private var showingAlert = false
    @State private var youScore = 0
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                ColorSlider(sliderValue: $sliderValue,
                            targetValue: $targetValue)
                Text("100")
            }
            .padding()
            Button("Проверь меня!", action: checkScore)
                .padding()
            Button("Начать заново", action: restartGame)
                .padding()
        }
        .padding()
        .onAppear() { restartGame() }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Your Score"), message: Text("\(youScore)"), dismissButton: .default(Text("OK")))
        }
    }
    
    func restartGame() {
        targetValue = Int.random(in: 0...100)
    }
    
    func checkScore() {
        youScore = computeScore()
        showingAlert.toggle()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - sliderValue)
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
