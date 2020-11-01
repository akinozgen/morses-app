//
//  OnboardingStepView.swift
//  Test 3
//
//  Created by Akın Özgen on 1.11.2020.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct OnboardingStepView: View {
    var data: OnboardingDataModel
    
    var body: some View {
        VStack(alignment: .center) {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 15)
                .padding(.top, 100)
                .frame(width: 50)
            
            Text(data.heading)
                .font(.system(size: 18, design: .rounded))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.bottom, 90)
            
            if data.route != nil {
                NavigationLink(destination: getNavigationDestionation(title: data.route ?? "default")) {
                    Text(data.button)
                        .padding(.horizontal, 15)
                        .frame( height: 40)
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(Color(hex: data.color))
                        .font(.system(size: 18, design: .rounded))
                }.navigationBarBackButtonHidden(true)
                
                
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color(hex: data.color))
        .edgesIgnoringSafeArea(.all)
    }
    
    func getNavigationTitle(title: String) -> String {
        switch title {
        case "speechrecognizer":
            return "Speech to Morse"
        case "texttomorse":
            return "Text to Morse"
        case "morsetotext":
            return "Morse to Text"
        default:
            return "Text to Morse"
        }
    }
    
    func getNavigationDestionation(title: String) -> some View {
        Group {
            switch title {
                case "speechrecognizer":
                    SpeechRecognizer().navigationBarBackButtonHidden(true)
                case "texttomorse":
                    TextToMorseView().navigationBarBackButtonHidden(true)
                case "morsetotext":
                    MorseToTexView().navigationBarBackButtonHidden(true)
                default:
                    Text("Default")
            }
        }
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var data = OnboardingDataModel.data[0]
    static var previews: some View {
        OnboardingStepView(data: data)
    }
}
