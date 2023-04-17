//
//  TopInfoCell.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/17.
//

import UIKit
import SnapKit

final class TopInfoCell: UICollectionViewCell {
    static let identifier = "TopInfoCell"
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10.0
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "한국투자"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18.0, weight: .medium)
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Korea Investment & Securities Co, Ltd."
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .gray
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var getButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Get", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14.0
        button.setTitleColor(.label, for: .normal)
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        var configure = UIButton.Configuration.plain()
        configure.image = UIImage(systemName: "square.and.arrow.up")
        
        let button = UIButton(configuration: configure)
        
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        [
            iconImageView,
            titleLabel,
            subTitleLabel,
            getButton,
            shareButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.width.height.equalTo(100.0)
            $0.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(offset / 4)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        getButton.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(offset)
            $0.width.equalTo(70.0)
            $0.bottom.equalTo(iconImageView)
        }
        
        shareButton.snp.makeConstraints {
            $0.centerY.equalTo(getButton)
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
}

private extension TopInfoCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
