//
//  ContentView.swift
//  Restart
//
//  Created by Kevni Woodside on 4/7/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    //@AppStorage - Property Wrapper - SwiftUI property that uses user's defaults under the hood. Purpose is to store a value on the device's permanent storage by utilizing a get and set method.
    //("onboarding") - User Defaults Key - A unique key identifier that we can refer to later on by using this key. You can edit or recall its saved value on the storage device.
    //isOnboardingViewActive - Property Name - The actual property name you can use in this file
    //Bool = true - Value Set - This is where you set the default value of the property.
    

    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView( )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
