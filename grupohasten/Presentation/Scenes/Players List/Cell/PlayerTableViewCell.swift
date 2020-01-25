//
//  PlayerTableViewCell.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter
    }()

    // MARK: - IBOutlets
    @IBOutlet weak var widthImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var playerImageView: ImageLoader!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func configureWith(_ player: Player) {
        if let url = URL(string: player.image) {
            playerImageView.loadImageWithUrl(url) { isSuccess in
                if !isSuccess {
                    self.playerImageView.image = UIImage(named: "Placeholder")
                    return
                }
            }
        } else {
            playerImageView.image = UIImage(named: "Placeholder")
        }
        
        nameLabel.text = player.name
        surnameLabel.text = player.surname
        
        if let date = player.date {
            dateLabel.text = dateFormatter.string(from: date)
            dateLabel.isHidden = false
        } else {
            dateLabel.isHidden = true
        }
    }
}

private extension PlayerTableViewCell {
    func setupView() {
        selectionStyle = .none
        
        playerImageView.contentMode = .scaleAspectFill
        playerImageView.layer.cornerRadius = 8
        
        dateLabel.textColor = .gray
    }
}
