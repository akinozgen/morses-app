//
//  ContentView.swift
//  Test 3
//
//  Created by Akın Özgen on 30.10.2020.
//

import SwiftUI

struct ContentView: View {
    var data = OnboardingDataModel.data
    
    var body: some View {
        HomeViewTabbed()
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
