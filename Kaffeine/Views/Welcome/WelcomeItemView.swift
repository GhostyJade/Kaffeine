//
//  WelcomeItemView.swift
//  Kaffeine
//
//  Created by Giulia on 13/10/21.
//

import SwiftUI

struct WelcomeItemView: View {
    var image : String
    var title : String
    var subTitle : String
    
    var body: some View {
        HStack{
            Image(systemName: image)
                .font(.largeTitle)
                .padding()
                .accessibilityHidden(true)
            VStack(alignment: .leading){
                Text(title).font(.headline)
                Text(subTitle).font(.body).fixedSize(horizontal: false, vertical: true)
            }
        }.padding(.top)
    }
}

struct WelcomeItemView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeItemView(image: "cup.and.saucer.fill", title: "Test title", subTitle: "A long description used to explain one ore more functionality")
    }
}
