//
//  VersionInfoCell.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/18.
//

import UIKit
import SnapKit

final class VersionInfoCell: UICollectionViewCell {
    static let identifier = "VersionInfoCell"
    
    private lazy var versionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Version: "
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var versionValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1.00.00"
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            versionTitleLabel,
            versionValueLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        versionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.bottom.equalToSuperview().offset(-offset)
        }
        versionTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        versionValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(versionTitleLabel)
            $0.leading.equalTo(versionTitleLabel.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(versionInfoModel: VersionInfoModel) {
        versionValueLabel.text = versionInfoModel.version
    }
}

private extension VersionInfoCell {
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
