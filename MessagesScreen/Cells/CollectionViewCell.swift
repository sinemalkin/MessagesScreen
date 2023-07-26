//
//  CollectionViewCell.swift
//  MessagesScreen
//
//  Created by sinem alkin on 11.07.2023.
//

import UIKit
class CollectionViewCell: UICollectionViewCell {
    let notchSize: CGSize = CGSize(width: 10, height: 10)
    let notchPath = UIBezierPath()
    let notchLayer = CAShapeLayer()
    var notchView = UIView()
    var notchView2 = UIView()
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    var notchConstraint: NSLayoutConstraint!
    var notchConstraint2: NSLayoutConstraint!

    var notchConstraintLeading2: NSLayoutConstraint!
    var notchConstraintTrailing: NSLayoutConstraint!
    
    
    let profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        if let image = UIImage(named: "michelleWie") {
            profileImageView.image = image
        }
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 12
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 0.5
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
        //stackView.clipsToBounds = true
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
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 25),
            profileImageView.heightAnchor.constraint(equalToConstant: 25),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            stackView.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            
            
            //            notchView.widthAnchor.constraint(equalToConstant: notchSize.width),
            //            notchView.heightAnchor.constraint(equalToConstant: notchSize.height),
            //            notchView2.widthAnchor.constraint(equalToConstant: notchSize.width),
            //            notchView2.heightAnchor.constraint(equalToConstant: notchSize.height),
        ])
        leadingConstraint = stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: 5)
        leadingConstraint.priority = .defaultHigh
        trailingConstraint = stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5)
        trailingConstraint.priority = .defaultHigh
        
        
        //        notchConstraint = notchView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        //        notchConstraint2 = notchView2.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        //        notchConstraintLeading2 = notchView2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
        //
        //        notchConstraintTrailing = notchView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        
    }
    func stackViewLocation(IsMe:Bool) {
        trailingConstraint.isActive = IsMe
        leadingConstraint.isActive = !IsMe
        profileImageView.isHidden = IsMe
        label.textColor = IsMe ? .white : .black
        dateLabel.textColor = IsMe ? .white : .black
        stackView.backgroundColor = IsMe ? .systemBlue : .systemGray6
        
        
        //        if IsMe {
        //
        //            notchView = notchMeSetup()
        //            stackView.addSubview( notchView)
        //            notchConstraintTrailing.isActive = true
        //            notchConstraint.isActive = true
        //
        //        }else{
        //            notchView2 = notchYouSetup()
        //            stackView.addSubview(notchView2)
        //            notchConstraint2.isActive = true
        //            notchConstraintLeading2.isActive = true
        //        }
        //    }
        //    func notchMeSetup() -> UIView {
        //        notchPath.move(to: CGPoint(x: 0, y: notchSize.height))
        //        notchPath.addLine(to: CGPoint(x: notchSize.width, y: notchSize.height))
        //        notchPath.addLine(to: CGPoint(x: notchSize.width, y: 0))
        //        notchPath.close()
        //
        //        notchLayer.path = notchPath.cgPath
        //        notchLayer.fillColor = UIColor.red.cgColor
        //
        //
        //        notchView.translatesAutoresizingMaskIntoConstraints = false
        //        notchView.layer.addSublayer(notchLayer)
        //        return notchView
        //    }
        //
        //    func notchYouSetup() -> UIView {
        //        notchPath.move(to: CGPoint(x: notchSize.width, y: notchSize.height))
        //        notchPath.addLine(to: CGPoint(x: 0, y: notchSize.height))
        //        notchPath.addLine(to: CGPoint(x: 0, y: 0))
        //        notchPath.close()
        //
        //        notchLayer.path = notchPath.cgPath
        //        notchLayer.fillColor = UIColor.red.cgColor
        //
        //        notchView2.translatesAutoresizingMaskIntoConstraints = false
        //        notchView2.layer.addSublayer(notchLayer)
        //        return notchView2
        //    }
    }
        func configure(IsMe: Bool, Message: String, Date: String) {
            self.label.text = Message
            self.dateLabel.text = Date
            stackViewLocation(IsMe: IsMe)
        }
    }

