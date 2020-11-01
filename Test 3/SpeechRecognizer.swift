//
//  SpeechRecognizer.swift
//  Test 3
//
//  Created by Akın Özgen on 30.10.2020.
//

import SwiftUI
import SwiftSpeech

struct SpeechRecognizer: View {
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
            Button(action: {
                withAnimation {
                    self.showSheet.toggle()
                }
            }, label: {
                Text(getLanguageName(language: selectedLocale))
            })
            
            TextField("Result", text: $text)
                .padding()
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SwiftSpeech
                .RecordButton()
                .swiftSpeechRecordOnHold(
                    locale: Locale.init(identifier: getLanguageCode(language: selectedLocale)),
                    animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)
                )
                .onAppear(perform: {
                    SwiftSpeech.requestSpeechRecognitionAuthorization()
                })
                .onRecognizeLatest(update: $text)

        }
        .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
        
        if self.showSheet == true {
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
            .padding(EdgeInsets.init(top: 30, leading: 40, bottom: 120, trailing: 50)).background(Color.gray.opacity(0.1))
        }
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
                return "en_US"
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
                return "English"
        }
    }	
}

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Image("SR_intro")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .frame(width: .infinity, height: .infinity, alignment: .center)
            .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            })
    }
}

struct SpeechRecognizer_Previews: PreviewProvider {
    static var previews: some View {
        SpeechRecognizer()
    }
}
