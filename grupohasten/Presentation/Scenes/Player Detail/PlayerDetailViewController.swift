//
//  PlayerDetailViewController.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import UIKit

final class PlayerDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var playerImageView: ImageLoader!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sportLabel: UILabel!

    // MARK: - Properties
    private let presenter: PlayerDetailPresenter
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter
    }()
    
    // MARK: - LifeCycle
    init(presenter: PlayerDetailPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        
        self.presenter.setView(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.initialize()
        presenter.update()
    }

}

extension PlayerDetailViewController: PlayerDetailView {
    func setupViews() {
        setupNavigationController()
        setupContent()
    }
}

private extension PlayerDetailViewController {
    func setupNavigationController() {
        title = presenter.getTitle()
    }
    
    func setupContent() {
        playerImageView.contentMode = .scaleAspectFill
        
        if let url = URL(string: presenter.getImage()) {
            playerImageView.loadImageWithUrl(url) { isSuccess in
                if !isSuccess {
                    self.playerImageView.image = UIImage(named: "Placeholder")
                    return
                }
            }
        } else {
            self.playerImageView.image = UIImage(named: "Placeholder")
        }
        
        if !presenter.getName().isEmpty {
            nameLabel.text = "\("app.grupohasten.name".localized()): \(presenter.getName())"
        } else {
            nameLabel.isHidden = true
        }
        
        if !presenter.getSurname().isEmpty {
            surnameLabel.text = "\("app.grupohasten.surname".localized()): \(presenter.getSurname())"
        } else {
            surnameLabel.isHidden = true
        }
        
        if let date = presenter.getDate() {
            dateLabel.text = "\("app.grupohasten.date".localized()): \(dateFormatter.string(from: date))"
        } else {
            dateLabel.isHidden = true
        }
        
        if !presenter.getSport().isEmpty {
            sportLabel.text = "\("app.grupohasten.sport".localized()): \(presenter.getSport())"
        } else {
            sportLabel.isHidden = true
        }
    }
}
