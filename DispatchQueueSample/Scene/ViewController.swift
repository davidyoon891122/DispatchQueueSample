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
        let layout = createLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.register(
            TopInfoCell.self,
            forCellWithReuseIdentifier: TopInfoCell.identifier
        )
        
        return collectionView
    }()
    
    private var datasource: UICollectionViewDiffableDataSource<Int, AppInfoModel>!
    
    private let service = AppStoreService()
    
    private var appInfoData: [AppInfoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        setupViews()
        configureDatasource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        service.requestService() { appInfoData in
            DispatchQueue.main.async {
                self.appInfoData = appInfoData
                self.applyDatasource()
            }
        }
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
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100.0)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100.0)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        })
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource<Int, AppInfoModel> (collectionView: collectionView, cellProvider: {
            collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopInfoCell.identifier, for: indexPath) as? TopInfoCell else { return UICollectionViewCell() }
            
            cell.setupCell(appInfo: item)
            
            return cell
        })
        
        applyDatasource()
    }
    
    func applyDatasource() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, AppInfoModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(appInfoData)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
}

