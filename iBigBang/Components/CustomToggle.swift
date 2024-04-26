//
//  CustomToggle.swift
//  iBigBang
//
//  Created by Gabriel Garcia Millan on 25/4/24.
//

import SwiftUI

struct CustomToggle: View {
    @Binding var value: Bool
    let label: String
    let image: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Toggle(isOn: $value) {
                Image(systemName: image)
                    .symbolVariant(value ? .fill : .none)
                    .font(.headline)
                    .frame(width: 25)
            }
            .toggleStyle(.button)
            .tint(value ? color : .blue)
        }
    }
}

#Preview {
    CustomToggle(value: .constant(true), label: "Seen", image: "eye", color: .blue)
}
