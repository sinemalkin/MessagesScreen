//
//  ViewController.swift
//  MessagesScreen
//
//  Created by sinem alkin on 13.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        profileButton.layer.cornerRadius = 50
        profileButton.clipsToBounds = true
        profileButton.setImage(UIImage(named: "michelleWie"), for: .normal)
        return profileButton
    }()
    let golfCoachLabel: UILabel = {
        let golfCoachLabel = UILabel()
        golfCoachLabel.translatesAutoresizingMaskIntoConstraints = false
        golfCoachLabel.textAlignment = .center
        golfCoachLabel.font = UIFont.boldSystemFont(ofSize: 20)
        golfCoachLabel.textColor = .black
        golfCoachLabel.text = "Michelle Wie"
        return golfCoachLabel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = " My Coach "
        setupUI()
        targetFunc()
    }
    private func targetFunc() {
        profileButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
    }
    @objc func saveButtonTapped() {
        let vc = ChatViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    private func setupUI() {
        view.addSubview(profileButton)
        view.addSubview(golfCoachLabel)
        NSLayoutConstraint.activate([
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            golfCoachLabel.topAnchor.constraint(equalTo: profileButton.bottomAnchor,constant: 20),
            golfCoachLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            golfCoachLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}
