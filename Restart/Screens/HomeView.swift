//
//  HomeView.swift
//  Restart
//
//  Created by Kevni Woodside on 4/7/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    //allows you to change the home screen to the onboarding screen

    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home").font(.largeTitle )
            
            Button(action: {
                isOnboardingViewActive = true
                //changes property value when button is clickedgutdim
            }) {
                Text("Restart")
            }
        } //: VSTACK
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
