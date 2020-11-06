//
//  TextToMorseView.swift
//  Test 3
//
//  Created by Akın Özgen on 1.11.2020.
//

import SwiftUI

struct TextToMorseView: View {
    @State var inputText = "Type something";
    @State var resultText = "- -.-- .--. . / ... --- -- . - .... .. -. --."
    var home: Any
    
    var body: some View {
        VStack {
            // Input Area Starts
            Group {
                TextField(inputText, text: $inputText)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
            .background(Color.white.opacity(0.2))
            .cornerRadius(8)
            .padding()
            .multilineTextAlignment(.leading)
            .foregroundColor(Color.white.opacity(0.85))
            // Input Area Ends
            
            // Convert and bakc Button Starts
            Button("Convert", action: {})
                .foregroundColor(Color.black)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: .center)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal, 15)
            // Convert and back Button Ends
            
            // Result Area Starts
            Group {
                VStack {
                    TextField(resultText, text: $resultText)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .foregroundColor(Color.white.opacity(0.8))
                    Divider()
                        .background(Color.white.opacity(0.2))
                        .padding(.horizontal, 5)
                    Button("Share", action: {})
                        .padding(.vertical, 10)
                        .foregroundColor(Color.white)
                }
            }
            .background(Color.white.opacity(0.3))
            .cornerRadius(8)
            .padding()
            .multilineTextAlignment(.leading)

            // Result Area Ends
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.black)
        .edgesIgnoringSafeArea(.top)
    }
}

struct TextToMorseView_Previews: PreviewProvider {
    static var previews: some View {
        TextToMorseView(home: EmptyView())
    }
}
