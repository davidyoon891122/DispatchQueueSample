//
//  MainViewController.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/17.
//

import UIKit
import SnapKit

enum SectionType: Hashable {
    case top
    case version
}

enum ItemType: Hashable {
    case top(TopInfoModel)
    case version(VersionInfoModel)
}

final class MainViewController: UIViewController {
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
        
        collectionView.register(
            VersionInfoCell.self,
            forCellWithReuseIdentifier: VersionInfoCell.identifier
        )
        
        return collectionView
    }()
    
    private var datasource: UICollectionViewDiffableDataSource<SectionType, ItemType>!
    
    private let service = AppStoreService()
    
    private lazy var repository = AppVersionRepository(service: service)
    
    private var topInfoModel: TopInfoModel?
    
    private var versionInfoModel: VersionInfoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        setupViews()
        configureDatasource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        repository.requestService() { [weak self] (topInfoModel, versionInfoModel) in
            guard let self = self else { return }
            
            self.topInfoModel = topInfoModel
            self.versionInfoModel = versionInfoModel
            self.applySnapshot()
        }
    }
}

private extension MainViewController {
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
            if sectionIndex == 0 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100.0)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100.0)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            } else if sectionIndex == 1 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50.0)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50.0)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100.0)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100.0)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }

        })
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource<SectionType, ItemType> (collectionView: collectionView, cellProvider: {
            collectionView, indexPath, item in
            if indexPath.section == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopInfoCell.identifier, for: indexPath) as? TopInfoCell else { return UICollectionViewCell() }
                
                if case let ItemType.top(topinfoModel) = item {
                    cell.setupCell(topInfoModel: topinfoModel)
                }
                
                return cell
            } else if indexPath.section == 1 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VersionInfoCell.identifier, for: indexPath) as? VersionInfoCell else { return UICollectionViewCell() }
                
                if case let ItemType.version(versionInfoModel) = item {
                    cell.setupCell(versionInfoModel: versionInfoModel)
                }
                
                return cell
            } else {
                return UICollectionViewCell()
            }
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        guard let topInfoModel = topInfoModel,
              let versionInfoModel = versionInfoModel else { return }
        
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, ItemType>()
        snapshot.appendSections([.top, .version])
        snapshot.appendItems([.top(topInfoModel)], toSection: .top)
        snapshot.appendItems([.version(versionInfoModel)], toSection: .version)
        self.datasource.apply(snapshot, animatingDifferences: true)
    }
}

