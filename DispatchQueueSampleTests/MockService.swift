//
//  MockService.swift
//  DispatchQueueSampleTests
//
//  Created by jiwon Yoon on 2023/04/21.
//

import Foundation

final class MockService: ServiceType {
    func requestService(completion: @escaping (([AppInfoEntity]) -> Void)) {
        let appInfoEntity = AppInfoEntity.item
        
        completion([appInfoEntity])
    }
}
