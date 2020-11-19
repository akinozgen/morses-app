//
//  MorseLib.swift
//  Test 3
//
//  Created by Akın Özgen on 18.11.2020.
//

import Foundation

struct MorseLib {
    static var abc: KeyValuePairs<String, String> = [
        "A": ".-",
        "B": "-...",
        "C": "-.-.",
        "D": "-..",
        "E": ".",
        "F": "..-.",
        "G": "--.",
        "H": "....",
        "I": "..",
        "J": ".---",
        "K": "-.-",
        "L": ".-..",
        "M": "--",
        "N": "-.",
        "O": "---",
        "P": ".--.",
        "Q": "--.-",
        "R": ".-.",
        "S": "...",
        "T": "-",
        "U": "..-",
        "V": "...-",
        "W": ".--",
        "X": "-..-",
        "Y": "-.--",
        "Z": "--..",
        "0": "-----",
        "1": ".----",
        "2": "..---",
        "3": "...--",
        "4": "....-",
        "5": ".....",
        "6": "-....",
        "7": "--...",
        "8": "---..",
        "9": "----.",
        ".": ".-.-.-",
        ",": "--..--",
        ":": "---...",
        "?": "..--..",
        "'": ".----.",
        "-": "-....-",
        "/": "-..-.",
        "(": "-.--.-",
        ")": "-.--.-",
        "\"": ".-..-.",
        "@": ".--.-.",
        "=": "-...-",
        "!": "-.-.--"
    ]
    
    static func letterToMorse(l: String) -> String {
        if let index = self.abc.firstIndex(where: { $0.0 == l }) {
            let letter = self.abc[index].1
            return letter;
        }
        return ""
    }
    
    static func morseToLetter(l: String) -> String {
        if let index = self.abc.firstIndex(where: { $0.0 == l }) {
            return String(index);
        }
        
        return "";
    }
}
