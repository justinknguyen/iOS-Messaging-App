//
//  ViewC.swift
//  dm
//
//  Created by Justin Nguyen on 2022-05-20.
//

import SwiftUI

struct ViewC: View {
    var body: some View {
        ZStack {
            Color.white
            
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(Color.blue)
                .font(.system(size: 100.0))
        }
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}
