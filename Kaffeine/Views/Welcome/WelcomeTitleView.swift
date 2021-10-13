//
//  WelcomeTitleView.swift
//  Kaffeine
//
//  Created by Giulia on 13/10/21.
//

import SwiftUI

struct WelcomeTitleView: View {
    var image : String
    var title : String
    var subTitle : String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .accessibility(hidden: true)
            Text(title)
                .fontWeight(.black)
                .font(.system(size: 36))
            Text(subTitle)
                .fontWeight(.black)
                .font(.system(size: 36))
            //            .foregroundColor(.indigo)
        }
    }
}

struct WelcomeTitleView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeTitleView(image: "", title: "Welcome to", subTitle: "Kaffeine")
    }
}
