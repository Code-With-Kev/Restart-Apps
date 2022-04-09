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
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            
            VStack(spacing: 20) {
               //MARK: - HEADER
                
                Spacer()
                
                VStack(spacing: 0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    //use triple quotes for a subheading
                    Text("""
                    It's not how much we give but
                    how much love we put into giving
                    """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }
                
               //MARK: - CENTER
                
                
               //MARK: - FOOTER
            } //: END OF V STACK
        } //: END OF Z STACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
