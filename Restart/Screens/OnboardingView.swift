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
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    // The button's width property is the actual screen's width - 80
    
    @State private var buttonOffset: CGFloat = 0
    // Initialize button drag
    
        
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
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }//: CENTER
                
                Spacer()
                
               //MARK: - FOOTER
                
                ZStack {
                   // PARTS OF THE CUSTOM BUTTON
                    // 1. BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    // 2. CALL-TO-ACTION (STATIC)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        Spacer()
                        
                    }
                    // 4. CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                        ) //: GESTURE
                        
                        Spacer()
                    }//: HSTACK
                    
                    
                    
                    
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                    //width: buttonWidth - adds width constraint to button
                .padding()
                
            } //: V STACK
        } //: Z STACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

//OPTION + COMMAND + LEFT ARROW = Section Fold

// CREATING REUSABLE COMPOENTS:
    // 1. Copy code you want to be reused
    // 2. Create a new SwiftUI file in View Folder
    // 3. Replace Hello World text with copied code

// if gesture.translation.width > 0 - Only run when the dragging has been started in the right direction
