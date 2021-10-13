//
//  HealthKitHelper.swift
//  Kaffeine
//
//  Created by Giulia on 13/10/21.
//

import Foundation
import HealthKit

struct HealthKitHelper {
    static let shared = HealthKitHelper()
    
    let healthStore : HKHealthStore?
    
    init(){
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
        else{
            healthStore = nil
        }
    }
    
    func requestPermissions() {
        var permissionsTypes = Set<HKSampleType>()
        if #available(iOS 15.0, *) {
            permissionsTypes.insert(HKQuantityType(.dietaryCaffeine))
        } else {
            let item = HKObjectType.quantityType(forIdentifier: .dietaryCaffeine)
            if item != nil {
                permissionsTypes.insert(item!)
            }
        }
        
        healthStore?.requestAuthorization(toShare: permissionsTypes, read: permissionsTypes, completion: { success, error in
            if !success {
                // TODO: Error handling
            }
        })
    }
}
