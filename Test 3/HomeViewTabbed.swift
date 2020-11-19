//
//  HomeVİewTabbed.swift
//  Test 3
//
//  Created by Akın Özgen on 6.11.2020.
//

import SwiftUI

struct HomeViewTabbed: View {
    @Environment(\.colorScheme) var systemScheme;
    
    var body: some View {
        TabView {
            TextToMorseView(home: self)
                .tabItem {
                    VStack {
                        Image(systemName: "doc.text")
                        Text("Text to Morse")
                    }
                }
            MorseToTexView(home: self)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("Morse to Text")
                    }
                }
            SpeechToMorse()
                .tabItem {
                    VStack {
                        Image(systemName: "megaphone")
                        Text("Speech to Morse")
                    }
                }
            MorseToLightView()
                .tabItem {
                    Image(systemName: "flashlight.on.fill")
                    Text("Morse to Flash")
                }
        }
        .accentColor(systemScheme == .dark ? Color.white : Color.black)
    }
}

struct HomeVI_ewTabbed_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewTabbed()
    }
}
