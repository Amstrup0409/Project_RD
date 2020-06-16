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
    static var dinnerListContent: [Dinner] = [
        Dinner(title: "First test dinner", host: "Chrisser1"),
        Dinner(title: "Second test dinner", host: "Chrisser2"),
        Dinner(title: "Third test dinner", host: "Chrisser3"),
        Dinner(title: "Fourth test dinner", host: "Chrisser4"),
        Dinner(title: "Fifth test dinner", host: "Chrisser5"),
        Dinner(title: "Sixth test dinner", host: "Chrisser6")
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
    
}

extension DinnerListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DevTestData.dinnerListContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DinnerListCell.identifier, for: indexPath) as? DinnerListCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}



// MARK: SnapKit
extension DinnerListVC {
    private func insertAndAnchorChildren() {
        self.view.addSubview(self.dinnerListTable)
        
        dinnerListTable.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }
}

