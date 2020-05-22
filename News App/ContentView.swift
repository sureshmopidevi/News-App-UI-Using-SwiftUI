//
//  ContentView.swift
//  News App
//
//  Created by APPLE  on 21/05/20.
//  Copyright © 2020 Suresh Mopidevi. All rights reserved.
//

// uplabs.com/posts/news-blog-application

import SwiftUI

struct ContentView: View {
    var headlineData: [String] {
        ["Latest", "India", "World", "Business", "Technology"]
    }

    var body: some View {
        VStack(spacing: 0.0) {
            navBar()
            ScrollView {
                chipsBar()
                headlinesBar()
                messageCard()
                    .padding(.horizontal, 12)
                featuredCard()
            }
            bottombar()
        }
    }

    func navBar() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text("THURSDAY, APRIL 16")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                Text("Headlines")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            Spacer()
            Image("profile_user")
                .resizable()
                .frame(width: 56, height: 56, alignment: .center)
                .clipShape(Circle())
        }
        .padding(.all)
    }

    func chipsBar() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(headlineData, id: \.self) { val in
                    Text(val)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                        .foregroundColor(val == "Latest" ? Color.white : Color.gray)
                        .background(val == "Latest" ? Color.blue : Color.white)
                        .cornerRadius(6)
                }
            }.padding()
        }
    }

    func headlinesBar() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1 ... 5, id: \.self) { val in
                    ZStack {
                        Image("images-\(val)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 108, height: 158)
                            .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                            .overlay(
                                LinearGradient(gradient: .init(colors: [Color(#colorLiteral(red: 0.6234533629, green: 0.6234533629, blue: 0.6234533629, alpha: 0)), Color(#colorLiteral(red: 0.1053101206, green: 0.1053101206, blue: 0.1053101206, alpha: 1))]),
                                               startPoint: .top, endPoint: .bottom)
                                    .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/))
                    }
                }
            }.padding()
        }
    }

    func messageCard() -> some View {
        Text("COVID-19 NEWS: See the latest coverage of the coronavirus (COVID-19)")
            .font(.footnote)
            .fontWeight(.regular)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.leading)
            .padding(.all)
            .background(Color(white: 0.96))
            .cornerRadius(8)
            .shadow(radius: 1)
    }

    func featuredCard() -> some View {
        ZStack {
            Image("iphone")
                .resizable()
                .frame(height: 300)
                .cornerRadius(8)
                .padding()
            VStack(alignment: .leading) {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .frame(height: 116)
                        .padding()
                    VStack(alignment: .leading) {
                        HStack {
                            chips(text: "LATEST")
                            .foregroundColor(.red)
                            chips(text: "TECHNOLOGY")
                            .foregroundColor(.blue)
                        }.padding()
                        Text("Apple's iPhone 12 to get a redesign, could look like the iPad Pro")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                    }
                }.padding(.bottom, 4)
            }.padding(8)
        }
    }

    func chips(text: String) -> some View {
        Text(text)
            .font(.footnote)
            .fontWeight(.medium)
            .padding(8)
            .background(Color(white: 0.95))
    }

    func bottombar() -> some View {
        HStack {
            Spacer()
            ZStack {
                Rectangle()
                    .frame(height: 56)
                HStack {
                    Spacer()
                    Image(systemName: "person")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "tv.circle")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                    Spacer()
                }.padding()
            }
            .cornerRadius(8)
            .padding(8)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
