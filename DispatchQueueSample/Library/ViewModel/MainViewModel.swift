//
//  MainViewModel.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/21.
//

import Foundation

protocol MainViewModelInput {
    
}

protocol MainViewModelOutput {
    
}

protocol MainViewModelType {
    var inputs: MainViewModelInput { get }
    var outputs: MainViewModelOutput { get }
}


final class MainViewModel: MainViewModelInput, MainViewModelOutput, MainViewModelType {
    var inputs: MainViewModelInput { self }
    var outputs: MainViewModelOutput { self }
    
    
    
}
