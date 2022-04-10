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
    // The button's width property is the actual screen's width - 80, so padding of 40 on each side
    
    @State private var buttonOffset: CGFloat = 0
    // Initialize button drag
    
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    
    
        
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            
            VStack(spacing: 20) {
               //MARK: - HEADER
                
                Spacer()
                 
                VStack(spacing: 0){
                    
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        // Fix text transition problem
                        .id(textTitle)
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving
                    """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
               //MARK: - CENTER
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        //Move background in opposite direction
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width) / 5)
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        //Accelerates drag gesture movement
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    //Control how far you can drag image
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        
                                        //Change arrow indicator
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "Give."
                                        }
                                        
                                    }
                                }//: ONCHANGED
                            //Reset image position to start after drag
                                .onEnded {  _ in
                                    imageOffset = .zero
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }
                                }
                        ) //: GESTURE
                        //Make drag movement smoother
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                }//: CENTER
                //MARK: - ARROW
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                    //Note the comma
                    ,   alignment: .bottom
                )
                
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
                            .frame(width: buttonOffset + 80) // added 80 because button initial offset is 0.
                        
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
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }//: ONCHANGED
                            // MARK: - DRAG ONENDED
                                .onEnded { _ in
                                    // Fade into next screen
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffset = 0 // brings button back to start
                                        }
                                    }
                                }
                        ) //: GESTURE
                        
                        Spacer()
                    }//: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                    //width: buttonWidth - adds width constraint to button
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
            } //: V STACK
        } //: Z STACK
        .onAppear(perform: {
            isAnimating = true
        })
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

// WHY SUBTRACT 80 if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80
// Button is 80x80 and z stack uses the top left corner coordinate. This ensures the button keeps its position inside the component horizontally

// IF BUTTON IS DRAGGED MORE THAN HALFWAY CONSIDER IT A COMPLETE ACTION, OTHERWISE MOVE BACK TO START
//    .onEnded { _ in
//        if buttonOffset > buttonWidth / 2 {
//            buttonOffset = buttonWidth - 80
//            isOnboardingViewActive = false
//        } else {
//            buttonOffset = 0 // brings button back to start
//        }

// IF ALL PROPERTIES EQUAL ZERO USE .ZERO

//@State private var imageOffset: CGSize = CGSize(width: 0, height: 0) ->
// @State private var imageOffset: CGSize = .zero

// ABSOLUTE VALUE
//abs - converts any number to positive

// UNDERSCORE
// Represents an unnamed variable. Used when the variable itself isnt used in the for loop

// RESET POSITION AT END OF ACTION
//    .onEnded { _ in
//        imageOffset = .zero
//    }

// WHY TEXT TRANSITIONS ARE DIFFICULT / ID METHOD
// Swift UI see text changes as being the same rather than becoming a different view. But we can explicitly tell SwiftUI that this is a different view after the value change with the ID method

// SUBHEADING
// Use triple quotes
