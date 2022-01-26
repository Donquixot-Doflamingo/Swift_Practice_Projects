//
//  CircleImage.swift
//  ContactsApp
//
//  Created by harsh Khandelwal on 18/07/21.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 250, height: 250, alignment:.center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
                    
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("billgates"))
    }
}
