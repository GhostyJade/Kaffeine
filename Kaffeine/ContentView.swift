//
//  ContentView.swift
//  Kaffeine
//
//  Created by Giulia on 11/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var isKaffeinDetailsShown : Bool = false
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \CaffeineSummary.kaffeineQuantity, ascending: true)], animation: .default)
    private var caffeine : FetchedResults<CaffeineSummary>
    
    var body: some View {
        NavigationView {
            List{
                Button(action: openKaffeineDetails){
                    NavigationLink(destination: CaffeineConsumptionView(),isActive: $isKaffeinDetailsShown){EmptyView()}.hidden()
                    VStack{
                        HStack{
                            Image(systemName: "cup.and.saucer.fill")
                            Text("Caffeine").font(.system(size: 14))
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        Divider()
                        HStack{
                            Text(getString(value: caffeine.first?.kaffeineQuantity ?? 0))
                            Text("cups")
                            Spacer()
                        }
                    }
                }
            }.navigationTitle("Summary")
        }
    }
    
    func getString(value: Int64) -> String {
        return String(value)
    }
    
    private func openKaffeineDetails(){
        isKaffeinDetailsShown = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
