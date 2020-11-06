//
//  OnboardingViewPure.swift
//  Test 3
//
//  Created by Akın Özgen on 1.11.2020.
//

import SwiftUI

struct OnboardingViewPure: View {
    var data: [OnboardingDataModel]
    var routes: [Any]
    var doneFunction: () -> ()
    
    @State var slideGesture: CGSize = CGSize.zero
    @State var curSlideIndex = 0
    var distance: CGFloat = UIScreen.main.bounds.size.width
    
    func nextButton() {
        if self.curSlideIndex == self.data.count - 1 {
            doneFunction()
            return
        }
        
        if self.curSlideIndex < self.data.count - 1 {
            withAnimation {
                self.curSlideIndex += 1
            }
        }
    }
    
    func progressView() -> some View {
        VStack(alignment: .center) {
            HStack {
                ForEach(0..<data.count) { i in
                    Circle()
                        .scaledToFit()
                        .frame(width: 10)
                        .foregroundColor(self.curSlideIndex == i ? Color.white.opacity(0.29) : Color.black.opacity(0.44))
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }
    
    func arrowView() -> some View {
        Group {
            if self.curSlideIndex == self.data.count - 1 {
                HStack {
                    Text("Done")
                        .font(.system(size: 27, weight: .medium, design: .rounded))
                        .foregroundColor(Color(.systemBackground))
                }
                .frame(width: 120, height: 120)
                .background(Color(.label))
                .cornerRadius(25)
            } else {
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .foregroundColor(Color(.label))
                    .scaledToFit()
                    .frame(width: 50)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            ZStack (alignment: .center) {
                ForEach(0..<self.data.count) { i in
                    OnboardingStepView(data: self.data[i], routes: self.routes)
                        .offset(x: CGFloat(i) * self.distance)
                        .offset(x: self.slideGesture.width - CGFloat(self.curSlideIndex) * self.distance)
                        .animation(.spring())
                        .gesture(
                            DragGesture().onChanged { value in
                                self.slideGesture = value.translation
                            }
                            .onEnded { value in
                                if self.slideGesture.width < -50 {
                                    if self.curSlideIndex < self.data.count - 1 {
                                        withAnimation {
                                            self.curSlideIndex += 1
                                        }
                                    }
                                }
                                if self.slideGesture.width > 50 {
                                    if self.curSlideIndex > 0 {
                                        withAnimation {
                                            self.curSlideIndex -= 1
                                        }
                                    }
                                }
                                
                                self.slideGesture = .zero
                            }
                        )
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    self.progressView()
                    Spacer()
                }
            }
            .padding(20)
        }
    }
}

struct OnboardingViewPure_Previews: PreviewProvider {
    static let sample = OnboardingDataModel.data
    static var previews: some View {
        OnboardingViewPure(data: sample, routes: [], doneFunction: { print("done") })
    }
}
