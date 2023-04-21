//
//  MainViewModel.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol MainViewModelInput {
    func fetchAppInfo()
}

protocol MainViewModelOutput {
    var appInfoPublishRelay: PublishRelay<(TopInfoModel, VersionInfoModel)> { get }
}

protocol MainViewModelType {
    var inputs: MainViewModelInput { get }
    var outputs: MainViewModelOutput { get }
}


final class MainViewModel: MainViewModelInput, MainViewModelOutput, MainViewModelType {
    var inputs: MainViewModelInput { self }
    var outputs: MainViewModelOutput { self }
    
    var repository: RepositoryType
    
    var appInfoPublishRelay: PublishRelay<(TopInfoModel, VersionInfoModel)> = .init()
    
    init(repository: RepositoryType) {
        self.repository = repository
    }
    
    
    func fetchAppInfo() {
        repository.requestService() { [weak self] topInfoModel, versionInfoModel in
            guard let self = self else { return }
            self.outputs.appInfoPublishRelay.accept((topInfoModel, versionInfoModel))
        }
    }
    
}
