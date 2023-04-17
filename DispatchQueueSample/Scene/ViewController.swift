//
//  ViewController.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/17.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        setupViews()
    }
}

private extension ViewController {
    func configureNavigation() {
        navigationItem.title = "AppInfo"
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

