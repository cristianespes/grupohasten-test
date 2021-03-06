//
//  PlayersViewController.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import UIKit

final class PlayersViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    // MARK: - Properties
    private let presenter: PlayersPresenter
    private let navigator: PlayerDetailAssembler
    
    
    // MARK: - LifeCycle
    init(presenter: PlayersPresenter, navigator: PlayerDetailAssembler) {
        self.presenter = presenter
        self.navigator = navigator
        
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

extension PlayersViewController: PlayersView {
    func setupViews() {
        setupNavigationController()
        setupTableView()
        setupEmptyLabel()
    }
    
    func startLoading() {
        emptyLabel.isHidden = true
        tableView.isHidden = true
        activityIndicator.isHidden = false
        
        if !activityIndicator.isAnimating {
            activityIndicator.startAnimating()
        }
    }
    
    func stopLoading() {
        activityIndicator.isHidden = true
        
        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
        }
    }
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "app.grupohasten.warning".localized(), message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "app.grupohasten.accept".localized(), style: .default, handler: nil))
        
        present(alertController, animated: true)
    }
    
    func stateData() {
        tableView.reloadData()
        
        emptyLabel.isHidden = true
        tableView.isHidden = false
    }
    
    func stateEmpty() {
        emptyLabel.isHidden = false
        tableView.isHidden = true
    }
    
    func navigateToDetail(player: Player, descriptionSport: String) {
        let viewController: PlayerDetailViewController = navigator.resolve(player: player, descriptionSport: descriptionSport)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension PlayersViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getNumSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumItems(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier) as! PlayerTableViewCell
        cell.configureWith(presenter.getItemFor(indexPath))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.getTitleFor(section)
    }
}

extension PlayersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.itemTapped(indexPath)
    }
}

private extension PlayersViewController {
    func setupNavigationController() {
        title = "app.grupohasten.players_title".localized()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        tableView.alwaysBounceVertical = true
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        
        tableView.register(PlayerTableViewCell.nib, forCellReuseIdentifier: PlayerTableViewCell.identifier)
    }
    
    func setupEmptyLabel() {
        emptyLabel.textAlignment = .center
        emptyLabel.textColor = .gray
    }
}
