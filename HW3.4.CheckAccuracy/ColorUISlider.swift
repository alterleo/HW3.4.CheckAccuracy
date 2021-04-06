//
//  ColorUISlider.swift
//  SwiftUIColorizedApp
//
//  Created by Alexey Efimov on 04.04.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    @Binding var value: Int
    let alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension ColorUISlider {
    class Coordinator: NSObject {
        @Binding var value: Int
        
        init(value: Binding<Int>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Int(sender.value)
        }
    }
}

struct ColorUISlider_Preeviews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(value: .constant(100), alpha: 0.5)
    }
}
