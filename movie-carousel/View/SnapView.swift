//
//  SnapView.swift
//  movie-carousel
//
//  Created by Clarence on 16/05/22.
//

import SwiftUI

struct SnapView: View {
    @State var currentIndex = 0
    var body: some View {
        SnapCarousel(index: $currentIndex, items: movies) { movie in
            GeometryReader { proxy in
                let size = proxy.size

                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width)
                    .cornerRadius(12)
            }
        }
        .padding(.vertical, 80)
    }
}

struct SnapView_Previews: PreviewProvider {
    static var previews: some View {
        SnapView()
    }
}
