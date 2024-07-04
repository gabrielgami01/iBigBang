//
//  RatingComponent.swift
//  BigBangSeries
//
//  Created by Gabriel Garcia Millan on 20/4/24.
//

import SwiftUI

struct RatingComponent: View {
    @Binding var rating: Int
    
    let maxRating = 5
    
    var body: some View {
        HStack {
            Text("Rating")
            Spacer()
            ForEach(1 ... maxRating, id: \.self) { number in
                    Button {
                        rating = number
                    } label: {
                        image(for: number)
                            .foregroundStyle(number > rating ? .blue : .yellow)
                    }
            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            Image(systemName: "star")
        } else {
            Image(systemName: "star.fill")
        }
    }
}


#Preview {
    RatingComponent.preview
}
