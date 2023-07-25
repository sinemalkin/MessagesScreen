//
//  ViewController.swift
//  MessagesScreen
//
//  Created by sinem alkin on 11.07.2023.
//

import UIKit
typealias DataSource = UICollectionViewDiffableDataSource<String, Message>
typealias Snapshot = NSDiffableDataSourceSnapshot<String, Message>

class ChatViewController: UIViewController, UICollectionViewDelegate {
    var chatView = ChatView()
    var dataSource : DataSource?
    var snapshot : Snapshot?
    private var messages: [Message] = []
    var sectionTitles: [(Section: String , message: Message)] = []
    let dateFormatter = DateFormatter()
    var lastMessageDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatView.configureCollectionView()
        chatView.setupUICollection()
        setupUI()
        self.dataSource = makeDataSource()
        applySnapshot()
    }
    func makeDataSource() -> DataSource? {
        self.dataSource = DataSource(collectionView: chatView.collectionView, cellProvider: {(collectionView,indexPath, message) -> UICollectionViewCell? in
            
            collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
            
            self.dateFormatter.dateFormat = "HH:mm"
            message.sender == .me ? cell?.configure(IsMe: true, Message: message.text, Date: self.dateFormatter.string(from: Date())) :
            cell?.configure(IsMe: false, Message: message.text, Date: self.dateFormatter.string(from: Date()))
            return cell
        })
        self.dataSource?.supplementaryViewProvider = { [weak self] (collectionView, kind, indexPath) -> UICollectionReusableView? in
            guard let self else { return nil }
            
            if kind == UICollectionView.elementKindSectionHeader {
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? ChatHeaderView
                
                let section = self.snapshot?.sectionIdentifiers[indexPath.section]
                headerView?.titleLabel.text = section
                return headerView
            } else {
                return nil
            }
        }
        return dataSource
    }
    fileprivate func updateMessagesDate() {
        var NewMessages: [Message] = []
        messages.forEach { Message in
            var message = Message
            
            if let newDate = Calendar.current.date(byAdding: .day, value: -1, to: message.date) {
                if self.messages.last != message {
                    message.date = newDate
                }
            }
            NewMessages.append(message)
        }
        
        self.messages = NewMessages
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        sectionTitles.removeAll() // olusturulmus sectionlari sildik
        self.snapshot = Snapshot()
        updateMessagesDate()
        
        for message in messages {
            
            let dateDiff = Functions().howManyDays(messageDate: message.date , currentDate: lastMessageDate)
            if dateDiff == 0 {
                sectionTitles.append(("Today",message))
            }else if dateDiff == 1 {
                sectionTitles.append(("Yesterday",message))
            }else if dateDiff >= 2 && dateDiff <= 6 {
                let gunIsmi = message.date.dayFormatter()
                sectionTitles.append((gunIsmi,message))
            }else {
                sectionTitles.append((message.date.toString(),message))
            }
        }
        sectionTitles.forEach { (Section: String, message: Message) in
            snapshot?.appendSections([Section])
            snapshot?.appendItems([message], toSection: Section)
        }
        if let snapshot {
            dataSource?.apply(snapshot, animatingDifferences: animatingDifferences)
        }
    }
    
    private func sendMessage(isMyMessage: Bool) {
        guard let text = chatView.textField.text, !text.isEmpty else {
            return
        }
        
        let message = Message(id: UUID(), sender: isMyMessage ? .me : .you , text: text, date: lastMessageDate)
        messages.append(message)
        chatView.textField.text?.removeAll()
        self.applySnapshot()
    }
        
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(chatView)
        
        chatView.yourButton.addTarget(self, action: #selector(youButtonTapped), for: .touchUpInside)
        chatView.button.addTarget(self, action: #selector(meButtonTapped), for: .touchUpInside)
        chatView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            chatView.topAnchor.constraint(equalTo: view.topAnchor),
            chatView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            chatView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        chatView.collectionView.register(ChatHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        barButtonSetupUI()
    }
    @objc private func youButtonTapped() {
        sendMessage(isMyMessage: false)
    }
    @objc func meButtonTapped() {
        sendMessage(isMyMessage: true)
    }
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    func barButtonSetupUI(){
        navigationItem.hidesBackButton =  true
        let text = "Michelle Wie"
        let attributedText = NSAttributedString(string: text, attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 20),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: UIColor.black
        ])

        let nameLabel = UILabel()
        nameLabel.attributedText = attributedText
        let labelContainer = UIView()
        labelContainer.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: labelContainer.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor)
        ])
        let labelBarButtonItem = UIBarButtonItem(customView: labelContainer)
        let profileImageBackButton = UIBarButtonItem(image: UIImage(named: "michelleWie3")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backButtonTapped))
        let barButtonItems: [UIBarButtonItem] = [
            profileImageBackButton,
            labelBarButtonItem
        ]
        navigationItem.leftBarButtonItems = barButtonItems
    }
    
}

