//
//  ChatView.swift
//  MessagesScreen
//
//  Created by sinem alkin on 21.07.2023.
//

import UIKit

class ChatView: UIView, UICollectionViewDelegate {
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints =  false
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.attributedPlaceholder = NSAttributedString(string: "Type a message...")
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.leftViewMode = .always
        return textField
    }()
    lazy var meButton:UIButton = {
        let meButton = UIButton()
        meButton.translatesAutoresizingMaskIntoConstraints = false
        let sendImage = UIImage(systemName: "paperplane.circle.fill")
        meButton.setImage(sendImage, for: .normal)
        meButton.tintColor = UIColor.darkGray
        return meButton
    }()
    lazy var yourButton:UIButton = {
        let yourButton = UIButton()
        yourButton.translatesAutoresizingMaskIntoConstraints = false
        let sendImage = UIImage(systemName: "paperplane.circle")
        yourButton.setImage(sendImage, for: .normal)
        yourButton.tintColor = UIColor.darkGray
        return yourButton
    }()
    func setupUICollection() {
        addSubview(collectionView)
        addSubview(textField)
        addSubview(meButton)
        addSubview(yourButton)
        
        NSLayoutConstraint.activate([
            meButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            meButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -30),
            meButton.heightAnchor.constraint(equalToConstant: 25),
            meButton.widthAnchor.constraint(equalToConstant: 25),
            
            yourButton.trailingAnchor.constraint(equalTo: meButton.leadingAnchor,constant: -5),
            yourButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -30),
            yourButton.heightAnchor.constraint(equalToConstant: 25),
            yourButton.widthAnchor.constraint(equalToConstant: 25),
            
            textField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -30),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            textField.trailingAnchor.constraint(equalTo: yourButton.leadingAnchor,constant: -5),
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: textField.topAnchor),
        ])
    }
    func configureCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate =  self
    }
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
            configuration.showsSeparators = false
            let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
            let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [headerElement]
            return section
        }
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        return layout
    }
}
