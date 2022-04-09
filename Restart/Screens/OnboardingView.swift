//
//  OnboardingView.swift
//  Restart
//
//  Created by Kevni Woodside on 4/7/22.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    //This TRUE value will only be added to the property when the program doesnt find the ONBOARDING key previously set in the device's permanent storage (in ContentView). Therefore, if a running program does find a previous onboarding key, it will ignore everything after the equal sign.
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = false
                //Automatic View Change
            }) {
                Text("Start")
            }
        } //: END OF VSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
