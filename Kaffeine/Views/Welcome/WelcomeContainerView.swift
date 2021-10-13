//
//  WelcomeContainerView.swift
//  Kaffeine
//
//  Created by Giulia on 13/10/21.
//

import SwiftUI

struct WelcomeContainerView: View {
    var body: some View {
        VStack(alignment: .leading){
            WelcomeItemView(image: "cup.and.saucer.fill", title: "Coffee tracking", subTitle: "Keep track of how many coffee do you consume everyday")
            WelcomeItemView(image: "", title: "Health app integration", subTitle: "Store your data to Health App")
        }.padding(.horizontal)
    }
}

struct WelcomeContainerView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeContainerView()
    }
}
