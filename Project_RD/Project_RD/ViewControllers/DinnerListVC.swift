//
//  ViewController.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import UIKit
import SnapKit

struct DevTestData {
    static var loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    static var userListContent: [User] = [
        User(firstName: "Chrisser", lastName: "First"),
        User(firstName: "Chrisser", lastName: "Second"),
        User(firstName: "Chrisser", lastName: "Third"),
        User(firstName: "Chrisser", lastName: "Fourth"),
        User(firstName: "Chrisser", lastName: "Fifth"),
        User(firstName: "Chrisser", lastName: "Sixth")
    ]
    
    static var dinnerListContent: [Dinner] = [
        Dinner(title: "First test dinner", description: DevTestData.loremIpsum, guestCapacity: 2, host: DevTestData.userListContent[0]),
        Dinner(title: "Second test dinner", description: DevTestData.loremIpsum, guestCapacity: 2, host: DevTestData.userListContent[1]),
        Dinner(title: "Third test dinner", description: DevTestData.loremIpsum, guestCapacity: 3, host: DevTestData.userListContent[2]),
        Dinner(title: "Fourth test dinner", description: DevTestData.loremIpsum, guestCapacity: 1, host: DevTestData.userListContent[3]),
        Dinner(title: "Fifth test dinner", description: DevTestData.loremIpsum, guestCapacity: 1, host: DevTestData.userListContent[4]),
        Dinner(title: "Sixth test dinner", description: DevTestData.loremIpsum, guestCapacity: 1, host: DevTestData.userListContent[5])
    ]
}

class DinnerListVC: UIViewController { // SnapKit usage only.
    // Required and unused.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        // DinnerListVC makes no use of nib, and by extension, nor bundle.
        super.init(nibName: nil, bundle: nil)
        initializeSelf()
    }
    
    convenience init() {
        // Force use of overriden init.
        self.init(nibName: nil, bundle: nil)
        
    }
    
    // MARK: Views/Children
    private var dinnerListTable: UITableView = UITableView()

    private func initializeSelf() {
        self.insertAndAnchorChildren()
        
        dinnerListTable.delegate = self
        dinnerListTable.dataSource = self
        
        self.dinnerListTable.register(DinnerListCell.self, forCellReuseIdentifier: DinnerListCell.identifier)
    }

}

extension DinnerListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160 // TODO: Switch to non-static value
    }
}

extension DinnerListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DevTestData.dinnerListContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DinnerListCell.identifier, for: indexPath) as? DinnerListCell else { return UITableViewCell() }
        
        cell.configureFrom(dinner: DevTestData.dinnerListContent[indexPath.row])
        
        return cell
    }
}



// MARK: SnapKit
extension DinnerListVC {
    private func insertAndAnchorChildren() {
        self.view.addSubview(self.dinnerListTable)
        
        dinnerListTable.snp.makeConstraints({ make in
            make.edges.equalTo(self.view)
        })
    }
}

