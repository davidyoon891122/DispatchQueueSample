//
//  AppVersionRepository.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/18.
//

import Foundation

protocol RepositoryType {
    
}


final class AppVersionRepository: RepositoryType {
    
    private var service: ServiceType
    
    init(service: ServiceType) {
        self.service = service
    }
    
    func requestService(completion: @escaping ((TopInfoModel, VersionInfoModel)) -> Void) {
        service.requestService() { [weak self] result in
            guard let self = self else { return }
            let topInfoModel = TopInfoModel(
                iconImageURL: result[0].artworkUrl512,
                title: result[0].trackName,
                subTitle: result[0].artistName
            )
            
            let versionInfoModel = VersionInfoModel(version: result[0].version)
            
            completion((topInfoModel, versionInfoModel))
            
        }
    }
}
