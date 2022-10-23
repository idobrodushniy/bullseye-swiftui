//
//  SliderTextView.swift
//  Bullseye
//
//  Created by Ilia on 18.10.2022.
//

import SwiftUI

struct SliderTextView: View {
    var text: String
    
    var body: some View {
        Text(text).bold()
    }
}

struct SliderTextView_Previews: PreviewProvider {
    static var previews: some View {
        SliderTextView(text: "Some text")
    }
}
