//
//  TextToMorseView.swift
//  Test 3
//
//  Created by Akın Özgen on 1.11.2020.
//

import SwiftUI

struct MorseToTexView: View {
    @State var resultText = "Type something";
    @State var inputText = "- -.-- .--. . / ... --- -- . - .... .. -. --."
    
    var body: some View {
        VStack {
            // Input Area Starts
            Group {
                TextField(inputText, text: $inputText)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
            .background(Color.black.opacity(0.42))
            .cornerRadius(8)
            .padding()
            .multilineTextAlignment(.leading)
            .foregroundColor(Color(hex: "#CBED6F").opacity(0.85))
            // Input Area Ends
            
            // Convert and bakc Button Starts
            HStack {
                NavigationLink(destination: ContentView()) {
                    Text("Back")
                        .foregroundColor(Color.white.opacity(0.6))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: .center)
                        .padding(.vertical, 10)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.leading, 15)
                }.navigationBarBackButtonHidden(true)
                
                Button("Convert", action: {})
                    .foregroundColor(Color.black.opacity(0.6))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: .center)
                    .padding(.vertical, 10)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.trailing, 15)
            }
            // Convert and back Button Ends
            
            // Result Area Starts
            Group {
                VStack {
                    TextField(resultText, text: $resultText)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    Divider()
                        .background(Color(hex: "#CBED6F"))
                        .padding(.horizontal, 5)
                    Button("Share", action: {})
                        .padding(.vertical, 10)
                }
            }
            .background(Color.white.opacity(0.3))
            .cornerRadius(8)
            .padding()
            .multilineTextAlignment(.leading)
            .foregroundColor(Color(hex: "#1B0330"))

            // Result Area Ends
        }
        .padding(.top, 15)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color(hex: "#91C602"))
        .ignoresSafeArea(SafeAreaRegions.all, edges: .all)
    }
    
}

struct MorseToTexView_Previews: PreviewProvider {
    static var previews: some View {
        MorseToTexView()
    }
}
