//
//  ItemCreationView.swift
//  Kaffeine
//
//  Created by Giulia on 15/10/21.
//

import SwiftUI

struct ItemCreationView: View {
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \CaffeineSummary.kaffeineQuantity, ascending: true)], animation: .default)
    private var cupTypes : FetchedResults<CupData>
    
    func action(item: CupData) -> Void {
        
    }
    
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    
                }
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]){
                        ForEach(cupTypes) { item in
                            GridItemView(quantity: item.quantity, name: item.name!)
                        }
                    }
                }
            }.navigationTitle("New Item")
        }
    }
}

struct ItemCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCreationView()
    }
}
