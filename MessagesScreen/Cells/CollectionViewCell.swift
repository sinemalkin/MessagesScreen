//
//  CollectionViewCell.swift
//  MessagesScreen
//
//  Created by sinem alkin on 11.07.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    let profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        if let image = UIImage(named: "michelleWie") {
            profileImageView.image = image
        }
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 15
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.black.cgColor
        return profileImageView
    }()
    let label: UILabel = {
        let myLabel = UILabel()
        myLabel.numberOfLines = 0
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.textAlignment = .left
        return myLabel
    }()
    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        dateLabel.textAlignment = .right
        return dateLabel
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(dateLabel)
        stackView.layer.cornerRadius = 15
        stackView.layoutMargins = .init(top: 5, left: 5, bottom: 5, right: 5)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CollectionViewCell {
    private func setupUI() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 25),
            profileImageView.heightAnchor.constraint(equalToConstant: 25),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            stackView.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
        ])
        leadingConstraint = stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: 5)
        trailingConstraint = stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5)
    }
    func stackViewLocation(IsMe:Bool) {
        trailingConstraint.isActive = IsMe
        leadingConstraint.isActive = !IsMe
        profileImageView.isHidden = IsMe
        label.textColor = IsMe ? .white : .black
        dateLabel.textColor = IsMe ? .white : .black
        stackView.backgroundColor = IsMe ? .systemBlue : .systemGray6
    }
    func configure(IsMe: Bool, Message: String, Date: String) {
        self.label.text = Message
        self.dateLabel.text = Date
        stackViewLocation(IsMe: IsMe)
    }
}



