//
//  ContentView.swift
//  GridView
//
//  Created by Akshatha on 21/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Main()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// Grid View For Colors
struct colorsGirdView: View {
    var colors: [Color] = [.blue, .black, .pink, .red, .brown, .gray, .red, .blue, .brown, .yellow, .orange, .gray, .green]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<colors.count){ aColor in
                    Rectangle()
                        .foregroundColor(colors[aColor])
                        .frame(height: 100)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y:5)
                }
            }
            .frame(alignment: .top)
            .padding(.top, 20)
            .padding(.horizontal)
        }
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
    }
}
// Grid View For Languages
struct languagesGridView: View {
    var languages: [String] = ["Swift", "Kotlin", "C#", "Java"]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<languages.count){ aLanguage in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 100)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y:5)
                        Text(languages[aLanguage])
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity , alignment: .top)
            .padding(.top, 20)
        }
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
    }
}

struct Main: View {
    @State var index = 0
    var body: some View {
        VStack {
            HStack {
                Text("Demo")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
            }
            .padding(.horizontal)
            HStack(spacing: 0) {
                Text("Colors")
                    .foregroundColor(self.index == 0 ? Color.white : Color.gray)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.blue.opacity(self.index == 0 ? 1: 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                Text("Languages")
                    .foregroundColor(self.index == 1 ? Color.white : Color.gray)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(Color.blue.opacity(self.index == 1 ? 1: 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 1
                        }
                    }
                Spacer(minLength: 0)
                Text("Others")
                    .foregroundColor(self.index == 2 ? Color.white : Color.gray)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.blue.opacity(self.index == 2 ? 1: 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 2
                        }
                        
                    }
                
            }
            .background(Color.blue.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top, 5)
            TabView(selection: self.$index) {
                colorsGirdView()
                    .tag(0)

                languagesGridView()
                    .tag(1)

                VStack {
                    Text("Other")
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.top, 5)
        }
        .padding(.top, 25)
        .frame(maxHeight: .infinity , alignment: .top)
    }
    
}
