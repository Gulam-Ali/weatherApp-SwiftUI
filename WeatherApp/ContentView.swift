//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gulam Ali on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                CityView(city: "Delhi, IN")
                
                VStack(spacing:5){
                    let imageName = isNight ? "moon.stars.fill" : "cloud.sun.fill"
                    let temperature = isNight ? "22 °" : "40 °"
                    CurrentTempView(image: imageName, temp: temperature)
                    Spacer()
                 
                    HStack(spacing:12){

                        weatherDayView(dayOfWeek: "Mon", weatherImage: "sun.max.fill", temperature: "52°")
                        weatherDayView(dayOfWeek: "Tue", weatherImage: "cloud.drizzle.fill", temperature: "30°")
                        weatherDayView(dayOfWeek: "Wed", weatherImage: "cloud.sun.fill", temperature: "40°")
                        weatherDayView(dayOfWeek: "Thu", weatherImage: "wind", temperature: "20°")
                        weatherDayView(dayOfWeek: "Fri", weatherImage: "snowflake", temperature: "-10°")
                      
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Button {
                        print("tapped")
                        isNight.toggle()
                    } label: {
                        ModeButtonTextView(title: "Show Night Mode", backgroudColor: .white, isNight: $isNight)

                    }
                    Spacer()
                    
                }
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct weatherDayView: View {
    var dayOfWeek: String
    var weatherImage: String
    var temperature: String
    
    var body: some View {
        VStack(spacing:8){
            Text(dayOfWeek)
                .font(.system(size: 20.0, weight: .semibold, design: .default))
                .foregroundColor(.white)
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text(temperature)
                .font(.system(size: 22.0, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        let darkGradient: Color = isNight ? .black : .blue
        let lightGradient: Color = isNight ? .gray : .orange
        LinearGradient(colors: [darkGradient,lightGradient],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityView: View{
    var city: String
    var body: some View{
        Text(city)
            .foregroundColor(.white)
            .font(.system(.largeTitle, design: .default, weight: .heavy))
            .padding(.top, 50)
    }
}

struct CurrentTempView: View{
    var image: String
    var temp: String
    var body: some View{
        Image(systemName: image)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        Text(temp)
            .font(.system(size: 70.0, weight: .semibold, design: .default))
            .foregroundColor(.white)
    }
}

struct ModeButtonTextView: View {
    var title: String
    var backgroudColor: Color
    @Binding var isNight: Bool
    
    var body: some View{
        let textColor : Color = isNight ? .black : .teal
        Text(title)
            .frame(width: 280, height: 55)
            .background(backgroudColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
            .font(.system(size: 20, weight: .semibold, design: .default))
    }
}
