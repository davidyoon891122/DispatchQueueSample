//
//  MainViewModelTests.swift
//  DispatchQueueSampleTests
//
//  Created by jiwon Yoon on 2023/04/21.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest

@testable import DispatchQueueSample

final class MainViewModelTests: XCTestCase {
    var viewModel: MainViewModelType!
    var service: ServiceType!
    var repository: RepositoryType!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        scheduler = TestScheduler(initialClock: 0)
        service = MockService()
        repository = AppVersionRepository(service: service)
        viewModel = MainViewModel(repository: repository)
    }

    override func tearDown() {
        super.tearDown()
        scheduler = nil
        service = nil
        repository = nil
        viewModel = nil
        disposeBag = nil
    }
    
    func test_fetchAppInfo() {
        let topInfoModel = TopInfoModel(
            iconImageURL: "https://www.testscreenshots.com",
            title: "KakaoBank",
            subTitle: "KakaoBank")
        let versionInfoModel = VersionInfoModel(version: "1.01.01")

        let observer = scheduler.createObserver((TopInfoModel, VersionInfoModel).self)
        
        let appInfoObserver = scheduler.createObserver(TopInfoModel.self)
        let versionInfoObserver = scheduler.createObserver(VersionInfoModel.self)
        
        viewModel.outputs.appInfoPublishRelay
            .asObservable()
            .bind(to: observer)
            .disposed(by: disposeBag)
        
        viewModel.outputs.topInfoPublishRelay
            .asObservable()
            .bind(to: appInfoObserver)
            .disposed(by: disposeBag)
        
        viewModel.outputs.versionInfoPublishRelay
            .asObservable()
            .bind(to: versionInfoObserver)
            .disposed(by: disposeBag)
        
        viewModel.inputs.fetchAppInfo()
        
        XCTAssertEqual(appInfoObserver.events, [
            .next(0, topInfoModel)
        ])
        
        XCTAssertEqual(versionInfoObserver.events, [
            .next(0, versionInfoModel)
        ])
    }
}


