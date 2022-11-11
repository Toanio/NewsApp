//
//  HomeViewController.swift
//  NewsApp
//
//  Created by c.toan on 27.10.2022.
//

import UIKit

class HomeViewController: UIViewController {

     
    private var titles: [News] = [News]()
    
    private let covidButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 400, height: 100))
        button.setTitle("Covid", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return button
    }()
    
    private let topNewsTabel: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(TopNewsTableViewCell.self, forCellReuseIdentifier: TopNewsTableViewCell.identifier)
        //table.backgroundColor = .white
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createNavBar()
        view.addSubview(topNewsTabel)
        topNewsTabel.delegate = self
        topNewsTabel.dataSource = self
        
        fetchNews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topNewsTabel.frame = view.bounds
    }
    
    private func createNavBar() {
        var image = UIImage(named: "mainLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.title = "NEWS"
        //TODO: - Сделать Title
    
    }
    
    private func fetchNews() {
        APICaller().getTopNews { results in
            switch results {
            case .success(let titles):
                self.titles = titles
                DispatchQueue.main.async {
                    self.topNewsTabel.reloadData()
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }

}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopNewsTableViewCell.identifier) as? TopNewsTableViewCell else {
            return UITableViewCell()
        }
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(title: title.title ?? "", image_url: title.image_url))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
