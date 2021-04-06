//
//  ColorSlider.swift
//  SwiftUIColorizedApp
//
//  Created by Alexey Efimov on 26.05.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var sliderValue: Int
    @State private var alpha = CGFloat(1)
    @Binding var targetValue: Int
    
    var body: some View {
        HStack {
            ColorUISlider(value: $sliderValue, alpha: alpha)
                .onChange(of: sliderValue) { _ in
                    settingAlpha()
                }
                .onChange(of: targetValue) { _ in
                    settingAlpha()
                }
        }
    }
    
    func settingAlpha() {
        alpha = CGFloat(1-Float(abs(targetValue - sliderValue))/100)
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(sliderValue: .constant(50), targetValue: .constant(100))
    }
}
