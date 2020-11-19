//
//  MorseToLightView.swift
//  Test 3
//
//  Created by Akın Özgen on 6.11.2020.
//

import SwiftUI
import AVKit

struct MorseToLightView: View {
    @State var morse: String = ".../---/..."
    
    var body: some View {
        VStack {
            // Input Area Starts
            Group {
                TextField(morse, text: $morse)
                    .padding()
                    .multilineTextAlignment(.leading)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
            .background(Color.white.opacity(0.2))
            .cornerRadius(8)
            .padding()
            .multilineTextAlignment(.leading)
            .foregroundColor(Color.white.opacity(0.85))
            // Input Area Ends
            
            // Result Area Starts
            Group {
                Button(action:  {
                    blink(text: morse)
                }) {
                    Image(systemName: "flashlight.on.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(.all, 25)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(100)
                        .shadow(radius: 6)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.white.opacity(0.3))
            .cornerRadius(8)
            .padding()
            .multilineTextAlignment(.leading)
            .foregroundColor(Color(hex: "#1B0330"))

            // Result Area Ends
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.black)
        .edgesIgnoringSafeArea(.top)
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
        MorseToLightView(morse: ".../---/...")
    }
}
