//
//  SpeechRecognizer.swift
//  Test 3
//
//  Created by Akın Özgen on 30.10.2020.
//

import SwiftUI
import SwiftSpeech

struct SpeechToMorse: View {
    @State var text = "hold to speak"
    var sessionConfiguration: SwiftSpeech.Session.Configuration
    
    @State var isPresented = true
    
    var locales = [ "English", "Turkish (Türkçe)", "Spanish (Espanol)" ]
    @State private var selectedLocale = 0
    @State private var showSheet: Bool = false;
    
    public init(sessionConfiguration: SwiftSpeech.Session.Configuration) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    public init(locale: Locale = .current) {
        self.init(sessionConfiguration: SwiftSpeech.Session.Configuration(locale: locale))
    }
    
    public init(localeIdentifier: String) {
        self.init(locale: Locale(identifier: localeIdentifier))
    }
    
    
    var body: some View {
        VStack {
            // Input Area Starts
            Group {
                VStack {
                    SwiftSpeech
                        .RecordButton().foregroundColor(Color.green)
                        .swiftSpeechRecordOnHold(
                            locale: Locale.init(identifier: getLanguageCode(language: selectedLocale)),
                            animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)
                        )
                        .onAppear(perform: {
                            SwiftSpeech.requestSpeechRecognitionAuthorization()
                        })
                        .onRecognizeLatest(update: $text)
                        .padding(.top, 15)
                    
                    Text(text)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .foregroundColor(Color.white.opacity(0.85))
                        .font(.headline)
                    
                    
                    Button(action: {
                        withAnimation {
                            self.showSheet.toggle()
                        }
                    }, label: {
                        Text("Language: " + getLanguageName(language: selectedLocale))
                            .foregroundColor(Color.white.opacity(0.85))
                    })
                    .padding(.bottom, 15)
                }
            }
            .background(Color.white.opacity(0.42))
            .cornerRadius(8)
            .padding()
            .multilineTextAlignment(.leading)
            .foregroundColor(Color(hex: "#CBED6F").opacity(0.85))
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
                    TextField(text, text: $text)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .foregroundColor(Color.white.opacity(0.8))
                    Divider()
                        .background(Color.white.opacity(0.2))
                        .padding(.horizontal, 5)
                    Button("Share", action: {})
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                }
            }
            .background(Color.white.opacity(0.3))
            .cornerRadius(8)
            .padding()
            .multilineTextAlignment(.leading)
            .foregroundColor(Color(hex: "#1B0330"))
            .sheet(isPresented: $showSheet, content: {
                VStack(alignment: .center, content: {
                    Button("Close", action: {
                        withAnimation {
                            self.showSheet.toggle()
                        }
                    })
                    Picker(selection: $selectedLocale, label: Text("Select your preffered language")) {
                        ForEach(0 ..< locales.count) {
                            Text(self.locales[$0]).tag($0)
                        }
                    }
                })
            })
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.top)
    }
    
    func getLanguageCode(language: Int) -> String {
        switch language {
            case 0:
                return "en_US"
            case 1:
                return "tr_TR"
            case 2:
                return "es_ES"
            default:
                return "tr_TR"
        }
    }
    
    
    func getLanguageName(language: Int) -> String {
        switch language {
            case 0:
                return "English"
            case 1:
                return "Turkish (Türkçe)"
            case 2:
                return "Spanish (Espanol)"
            default:
                return "Turkish (Türkçe)"
        }
    }
}

struct SpeechToMorse_Previews: PreviewProvider {
    static var previews: some View {
        SpeechToMorse()
    }
}
