//
//  GridItemView.swift
//  Kaffeine
//
//  Created by Giulia on 15/10/21.
//

import SwiftUI

struct GridItemView: View {
    var quantity: Int64
    var name: String
    // var action: (CupData) -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            Text(name).bold()
            Image(systemName: "cup.and.saucer").font(.system(size: 64))
            Text("\(quantity) ml")
        }.padding()
            .border(.blue)
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(quantity: 250, name: "Small"
        //             , action: {_ in }
        )
    }
}
