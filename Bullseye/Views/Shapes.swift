//
//  Shapes.swift
//  Bullseye
//
//  Created by Ilia on 19.10.2022.
//

import SwiftUI

struct Shapes: View {
    
    @State private var wideShapes = true
    
    
    var body: some View {
        let elementWidth = wideShapes ? 200.0 : 100.0
        
        VStack{
            if !wideShapes{
                Circle()
                    .strokeBorder(
                        Color.blue,
                        lineWidth: 20.0
                    )
                    .frame(width: 200, height: 100)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: elementWidth, height: 100)
            Capsule()
                .fill(Color.blue)
                .frame(width: elementWidth, height: 100)
            Ellipse()
                .fill(Color.blue)
                .frame(width: elementWidth, height: 100)
            Button(action:{
                withAnimation(.linear(duration: 2.0)){
                    wideShapes.toggle()
                }
            }){
                Text("Animate!")
            }
        }.background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
