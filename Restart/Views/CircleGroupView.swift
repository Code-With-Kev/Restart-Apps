//
//  CircleGroupView.swift
//  Restart
//
//  Created by Kevni Woodside on 4/9/22.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    // @State - Property wrapper type that can read and write a value managed by SwiftUI
    // Notice that there is no initial value set. Thats so we can change it anytime. But you have to give values to the preview so that it can know what to do.
    
    
    // MARK: - BODY
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            
            
            
            
        } //: ZSTACK
    }
}
    
    // MARK: - PREVIEW
struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorRed")
                .ignoresSafeArea(.all, edges: .all)

            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}

//PREP PREVIEW FOR DIFFERENT ENVIRONMENTS
    // 1. In the preview section, wrap ComponentName() in a ZStack
    // 2. But the background color of the page you want it to appear on over it

// ORIGINAL
//            Circle()
//                .stroke(.white.opacity(0.2), lineWidth: 40)
//                .frame(width: 260, height: 260, alignment: .center)
//            Circle()
//                .stroke(.white.opacity(0.2), lineWidth: 80)
//                .frame(width: 260, height: 260, alignment: .center)
