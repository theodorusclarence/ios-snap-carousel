//
//  Home.swift
//  movie-carousel
//
//  Created by Clarence on 16/05/22.
//

import SwiftUI

struct Home: View {
    @State var currentIndex = 0
    @State var currentTab: String = "Films"

    @Namespace var animation
    @Environment(\.colorScheme) var scheme

    var body: some View {
        ZStack {
            BlurBackground()
            
            
            
            VStack {
                NavBar()
                
                SnapCarousel(spacing: 20, trailingSpace: 110, index: $currentIndex, items: movies) { movie in
                    
                    GeometryReader {proxy in
                        let size = proxy.size
                        
                        Image(movie.artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(15)
                    }
                }
                .padding(.top, 70)
                
                CustomIndicator()
                
                HStack {
                    Text("Popular")
                        .font(.title3.bold())
                    
                    Spacer()
                    
                    Button("See More") {
                    }
                    .font(.system(size: 16, weight: .semibold))
                }.padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(movies) {movie in
                            Image(movie.artwork)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 120)
                                .cornerRadius(15)
                        }
                    }
                }
            }
        } //: ZStack
    }
    
    @ViewBuilder
    func CustomIndicator() -> some View {
        HStack (spacing: 5) {
            ForEach(movies.indices, id:\.self) {index in
                Circle()
                    .fill(currentIndex == index ? .blue : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
            }
        }
    }
    
    @ViewBuilder
    func NavBar() -> some View {
        HStack (spacing: 0) {
            ForEach(["Films", "Localities"], id: \.self) {tab in
                Button {
                    withAnimation {
                        currentTab = tab
                    }
                } label: {
                    Text(tab)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                        .background {
                            if (currentTab == tab) {
                                Capsule()
                                    .fill(.regularMaterial)
                                    .environment(\.colorScheme, .dark)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                }
            }
        }
        .padding()
    }

    @ViewBuilder
    func BlurBackground() -> some View {
        GeometryReader { proxy in
            let size = proxy.size

            TabView(selection: $currentIndex) {
                ForEach(movies.indices, id: \.self) { index in
                    Image(movies[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)

            let color: Color = (scheme == .dark ? .black : .white)
            LinearGradient(colors: [
                .black,
                .clear,
                color.opacity(0.15),
                color.opacity(0.5),
                color.opacity(0.8),
                color,
                color
            ], startPoint: .top, endPoint: .bottom)
            
            // Blur
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
//            .preferredColorScheme(.dark)
    }
}
