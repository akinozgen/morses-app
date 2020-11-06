//
//  HomeVİewTabbed.swift
//  Test 3
//
//  Created by Akın Özgen on 6.11.2020.
//

import SwiftUI

struct HomeViewTabbed: View {
    var body: some View {
        TabView {
            TextToMorseView(home: self)
            MorseToTexView(home: self)
            SpeechToMorse()
            MorseToLightView()
        }
    }
}

struct HomeVI_ewTabbed_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewTabbed()
    }
}
