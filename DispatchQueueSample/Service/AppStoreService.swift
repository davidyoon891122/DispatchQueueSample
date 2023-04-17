//
//  AppStoreService.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/17.
//

import Foundation

protocol service {
    func requestService()
}


final class AppStoreService: service {
    
    func requestService() {
        
        let urlRequest = URLRequest(url: URL(string: "https://itunes.apple.com/lookup?bundleId=com.truefriend.neosmartirenewal")!)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print("error :\(String(describing: error?.localizedDescription))")
                return
            }
            
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let appVersionModel = try JSONDecoder().decode(AppInfoResponseModel.self, from: data)
                    print(appVersionModel)
                } catch(let error) {
                    print(error.localizedDescription)
                }
            }
        }
        .resume()
    }
}
