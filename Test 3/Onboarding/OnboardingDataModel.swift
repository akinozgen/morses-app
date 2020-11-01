//
//  OnboardingDataModel.swift
//  Test 3
//
//  Created by Akın Özgen on 1.11.2020.
//

import Foundation
import SwiftUI

struct OnboardingDataModel {
    var image: String
    var heading: String
    var button: String
    var route: String?
    var color: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(
            image: "TextIcon",
            heading: "Text to Morse",
            button: "Convert Text to Morse Code",
            route: "texttomorse",
            color: "#510D8A"
        ),
        OnboardingDataModel(
            image: "MorseIcon",
            heading: "Morse to Text",
            button: "Convert Morse Code to Text",
            route: "morsetotext",
            color: "#91C602"
        ),
        OnboardingDataModel(
            image: "MicIcon",
            heading: "Speech to Morse",
            button: "Convert Voice to Morse Code",
            route: "speechrecognizer",
            color: "#C6021B"
        ),
        OnboardingDataModel(
            image: "FlashIcon",
            heading: "Morse to Flashlight",
            button: "Convert Morse Code to Light",
            route: "default",
            color: "#02C6BA"
        )
    ]
}
