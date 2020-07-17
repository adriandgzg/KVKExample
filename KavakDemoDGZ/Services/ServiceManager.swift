//
//  ServiceManager.swift
//  KavakDemoDGZ
//
//  Created by desarrollo on 16/07/20.
//  Copyright © 2020 KavakDemo. All rights reserved.
//

import UIKit

class ServiceManager {
    
    static let shared = ServiceManager()
    
    
    func GetData<T:Codable>(completion:@escaping (_ dataResponse:T) -> Void, errorCompletition: @escaping (_ errorString:String) -> Void){
        
    
        guard let url = URL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json") else {
                print("Invalid URL")
                errorCompletition("Invalid URL")
                return
              
            }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                       
                    }
                    return
                }
            }
            errorCompletition(error?.localizedDescription ?? "Unknown error")
            
        }.resume()
    }
    
    
    
    
}
