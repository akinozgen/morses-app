//
//  MorseToLightView.swift
//  Test 3
//
//  Created by Akın Özgen on 6.11.2020.
//

import SwiftUI
import AVKit

struct MorseToLightView: View {
    @State var morse: String
    
    var body: some View {
        VStack {
            TextField("Input (in Morse)", text: $morse)
            
            Button("Light'em up", action: {
                blink(text: morse)
            })
        }
    }
    
    func blink(text: String = "") {
        let letters = Array(text)
        
        for i in 0..<letters.count {
            if letters[i] == "." {
                flash()
                wait(delay: 300000)
                flash(off: true)
                wait(delay: 300000)
            } else if letters[i] == "-" {
                flash()
                wait(delay: 900000)
                flash(off: true)
                wait(delay: 300000)
            } else if letters[i] == "/" {
                wait(delay: 2100000)
            } else {
                wait(delay: 900000)
            }
        }
        flash(off: true)
    }
    
    func wait(delay: UInt32 = 1) {
        usleep(useconds_t(delay))
    }
    
    func flash(off: Bool = false) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("no camera")
            return
        }
        guard device.hasTorch else {
            print("no flash")
            return
        }
        do {
            try device.lockForConfiguration()
            
            if off {
                device.torchMode = AVCaptureDevice.TorchMode.off
            } else {
                if device.torchMode == AVCaptureDevice.TorchMode.on {
                    device.torchMode = AVCaptureDevice.TorchMode.off
                } else {
                    do {
                        try device.setTorchModeOn(level: 1.0)
                    } catch {
                        print(error)
                    }
                }
            }
            
            device.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
}

struct MorseToLightView_Previews: PreviewProvider {
    static var previews: some View {
        MorseToLightView(morse: "")
    }
}
