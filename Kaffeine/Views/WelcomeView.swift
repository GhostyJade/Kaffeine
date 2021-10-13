//
//  WelcomeView.swift
//  Kaffeine
//
//  Created by Giulia on 13/10/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack (alignment: .center) {
            Spacer()
            WelcomeTitleView(image: "", title: "Welcome to", subTitle: "Kaffeine")
            WelcomeContainerView()
            Spacer(minLength: 30)
            Button(action: {}){
                Text("Continue")
            }.padding(.horizontal)
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
//                    .fill()
                )
                .padding(.bottom)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
