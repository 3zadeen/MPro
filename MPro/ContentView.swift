//
//  ContentView.swift
//  MPro
//
//  Created by Ezaden Seraj on 20/07/2020.
//

import SwiftUI

struct ListRow: View {
    let prayerName: String
    let prayerTime: String
    let imageName: String
    
    init(prayerName: String, prayerTime: String, imageName: String) {
        self.prayerName = prayerName
        self.prayerTime = prayerTime
        self.imageName = imageName
    }
    
    var body: some View {
        HStack {
            Text(prayerName)
                .font(.title2)
            
            Spacer()
            
            Text(prayerTime)
                .padding(.trailing, 12)
                .font(.title2)
            
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30, alignment: .trailing)
        }
        .foregroundColor(.black)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    SunView()
                        .frame(height: geometry.size.height * 0.1)
                        .padding(.bottom, 40)
                    
                    Spacer(minLength: 30)
                    
                    List {
                        Section {
                            ListRow(prayerName: "Fajr", prayerTime: "5:45", imageName: "bell.slash.fill")
                            ListRow(prayerName: "Dhuhr", prayerTime: "1:25", imageName: "bell.slash.fill")
                            ListRow(prayerName: "Asr", prayerTime: "4:45", imageName: "bell.slash.fill")
                            ListRow(prayerName: "Maghrib", prayerTime: "7:20", imageName: "bell.slash.fill")
                            ListRow(prayerName: "Isha", prayerTime: "8:35", imageName: "bell.slash.fill")
                        }
                        .padding(25)
                    }.listStyle(InsetGroupedListStyle())
                    .offset(y: 60.0)
                    .foregroundColor(.gray)
                    .overlay(
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(20)
                            
                            HStack(alignment: .center) {
                                Button(action: {
                                    print("Left")
                                }) {
                                    Image("return")
                                        .resizable()
                                        .foregroundColor(.black)
                                        .frame(width: 25, height: 25)
                                }
                                .padding(.leading, 20)
                                
                                Spacer()
                                
                                VStack {
                                    Text("Tuesday, July 21")
                                        .font(.title2)
                                    Text("Dhul-Qi'dah 29, 1441 AH")
                                        .font(.subheadline)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    print("Right")
                                }) {
                                    Image("next")
                                        .resizable()
                                        .foregroundColor(.black)
                                        .frame(width: 25, height: 25)
                                }
                                .padding(.trailing, 20)
                            }
                        }
                        .offset(y: -20)
                        .frame(height: 80)
                        .shadow(radius: 12)
                        .padding()
                        
                        , alignment: .top
                    )
                }
            }
            
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
