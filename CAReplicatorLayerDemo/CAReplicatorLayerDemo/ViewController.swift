//
//  ViewController.swift
//  CAReplicatorLayerDemo
//
//  Created by longjianjiang on 2017/10/8.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    var titles = ["replicator effect", "replicator animation"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CAReplicatorLayer"
        
        tableView.frame = view.bounds
        tableView.rowHeight = 44
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            navigationController?.pushViewController(ReplicatorEffectViewController(), animated: true)
        } else if indexPath.row == 1 {
            navigationController?.pushViewController(ReplicatorAnimationViewController(), animated: true)
        }
    }
}
