//
//  SunView.swift
//  MPro
//
//  Created by Ezaden Seraj on 20/07/2020.
//

import SwiftUI

struct SunView: View {
    @State private var sunMovesAlong = false
    @State private var maskedRectScalesAlong = false
    @State private var maskedCircleAlong = false
    let blackPhoneScreen =  Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))

    var body: some View {
       
        ZStack {
            blackPhoneScreen // Phone screen
                .edgesIgnoringSafeArea(.all)
//                .blur(radius: 10.0, opaque: true)
            
            ZStack {
                Circle() //Moon
                    .trim(from: 0.0, to: CGFloat(0.5))
                    .rotationEffect(Angle(degrees: 270))
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                    .scaleEffect(x: maskedCircleAlong ? 0.8 : 0, y: 1, anchor: .trailing)
                    .animation(Animation.easeInOut(duration: 5).delay(2).repeatForever(autoreverses: true))
                      .onAppear(){
                          self.maskedCircleAlong.toggle()
                  }
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .offset(x: 165, y: -110)
                
                ZStack {
                    Circle()
                        .strokeBorder(lineWidth: 2, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .offset(x: 165, y: -110)
                }
                
            }
            
            ZStack {
                
                Circle()  // Circular path: Dotted semicircle
                    .trim(from: 1/2, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [7, 7]))
                    .frame(width:   300, height: 300)
                    .foregroundColor(.gray)
                
                Image(systemName: "sun.max")  // Sun symbol
                    .font(.title)
                    .foregroundColor(.yellow)
                    .offset(x: -150)
                    .rotationEffect(.degrees(sunMovesAlong ? 145 : 20))
                    .animation(Animation.easeInOut(duration: 5).delay(2).repeatForever(autoreverses: false))
                    .onAppear(){
                        self.sunMovesAlong.toggle()
                }
                    
                ZStack {
                    Rectangle() // Masked to parent
                      .frame(width: 300, height: 150)
                      .foregroundColor(.yellow)
                      .opacity(0.1)
                      .scaleEffect(x: maskedRectScalesAlong ? 0.9 : 0, y: 1, anchor: .leading)
                      .offset(y: -75)
                      .animation(Animation.easeInOut(duration: 5).delay(2).repeatForever(autoreverses: false))
                        .onAppear(){
                            self.maskedRectScalesAlong.toggle()
                    }
                    
                }.frame(width: 300, height: 300)
                .clipShape(Circle())  // Mask to bounds + mask to parent
                  
                Rectangle()  // X-axis
                    .frame(width: 400, height: 2)
                    .foregroundColor(.white)
                    .opacity(0.5)
                
                Circle() // Fajr
                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(x: -180)
                
                Circle() // Sunrise
                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(x: -150)
                
                Circle() // Dhuhr
                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(x: 10)
                
                Circle() // Asr
                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(x: 70)
                
                Circle() // Isha
                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(x: 150)
                
                Circle() // Point Left
                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(x: 180)
            }// Inner container
            .offset(y: 65)
        }
        
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView()
    }
}
