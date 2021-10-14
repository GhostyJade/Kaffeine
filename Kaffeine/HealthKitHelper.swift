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
    
    func hasPermissions() -> Bool {
        var result: HKAuthorizationStatus?
        if #available(iOS 15.0, *) {
            result = healthStore?.authorizationStatus(for: HKQuantityType(.dietaryCaffeine))
        } else {
            result = healthStore?.authorizationStatus(for: HKObjectType.quantityType(forIdentifier: .dietaryCaffeine)!)
        }
        return result == HKAuthorizationStatus.sharingAuthorized
    }
    
    func requestPermissions() -> Void {
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
    
    func retrieveCaffeine(completion: @escaping (Int) -> ()){
        var objectType: HKSampleType
        if #available(iOS 15.0, *) {
            objectType = HKQuantityType(.dietaryCaffeine)
        } else {
            objectType = HKObjectType.quantityType(forIdentifier: .dietaryCaffeine)!
        }
        
        // TODO check permisisons before starting execution
        
        // TODO: the following dates represents yesterday and today, with timestamps.
        // Change dates from midnight to 11:59pm
        let startDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let endDate = Date()
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: HKQueryOptions.strictStartDate)
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: objectType, predicate: predicate, limit: 200, sortDescriptors: [sortDescriptor]){
            (query, tmpResult, error) -> Void in
            if error != nil {
                return
            }
            var totalCoffee : Int = 0
            
            if let result = tmpResult {
                for _ in result {
                    totalCoffee += 1
                }
            }
            completion(totalCoffee)
        }
        
        healthStore?.execute(query)
    }
}
