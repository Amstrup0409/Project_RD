//
//  UserImage.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import UIKit


enum AttendeeRole {
    case Host
    case Attendee
    case Missing
}

class AttendeeImage: UIView {
    // Required and unused.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    init(attendee: User?, host: Bool = false) {
        super.init(frame: CGRect(x: 0, y: 0, width: 16, height: 16)) // TODO: Switch to non-static value
        
        insertAndAnchorChildren()
        
        guard let attendee = attendee else { setupVisuals(for: .Missing); return }
        if host { setupVisuals(for: .Host, withImage: attendee.getImage()) } else {
            setupVisuals(for: .Attendee, withImage: attendee.getImage())
        }
    }
    
    // MARK: Views/Children
    private var imageView: UIImageView = UIImageView()
}

extension AttendeeImage {
    private func insertAndAnchorChildren() {
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        
        imageView.layer.borderWidth = 2 // TODO: Switch to non-static value
        imageView.layer.cornerRadius = 8 // TODO: Switch to non-static value
        
    }
    
    private func setupVisuals(for role: AttendeeRole, withImage userImage: UIImage? = nil) {
        switch role {
        case .Host:
            changeTintColor(to: .systemGreen)
            imageView.image = userImage != nil ? userImage : UIImage(named: "sun.min") // TODO: Placeholder Image
            return
        case .Attendee:
            changeTintColor(to: .systemBlue)
            imageView.image = userImage != nil ? userImage : UIImage(named: "person")
            return
        case .Missing:
            imageView.image = UIImage(named: "questionmark")
            return
        }
    }
    
    private func changeTintColor(to color: UIColor = .systemGray) {
        imageView.tintColor = color
        imageView.layer.borderColor = color.cgColor
    }
}

