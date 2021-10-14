//
//  CaffeineModel.swift
//  Kaffeine
//
//  Created by Giulia on 13/10/21.
//

import Foundation

class CaffeineModel : ObservableObject {
    @Published var caffeineQuantity : Int = 0
    
    private let helper = HealthKitHelper.shared
    
    func retrieveCaffeine() {
        helper.retrieveCaffeine() { totalCoffee -> Void in
            DispatchQueue.main.async {
                self.caffeineQuantity = totalCoffee
            }
        }
    }
}
