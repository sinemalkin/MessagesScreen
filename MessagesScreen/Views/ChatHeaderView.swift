//
//  ChatHeaderView.swift
//  MessagesScreen
//
//  Created by sinem alkin on 18.07.2023.
//

import UIKit

class ChatHeaderView: UICollectionReusableView {
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupHeader() {
        addSubview(backgroundView)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: -5),
            backgroundView.bottomAnchor.constraint(equalTo:titleLabel.bottomAnchor,constant: 5),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
