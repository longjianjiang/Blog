//
//  ViewController.swift
//  TableviewCellSubviewClickDemo
//
//  Created by longjianjiang on 2017/9/23.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit

class EvaluateView: UIView {
    var starOne = UIButton()
    var starTwo = UIButton()
    
    var descLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubview()
        addSomeConstraints()
    }
    
    func setupSubview() {
        starOne.translatesAutoresizingMaskIntoConstraints = false
        starOne.tag = 1
        starOne.setBackgroundImage(UIImage.init(named: "order_star"), for: .normal)
        starOne.setBackgroundImage(UIImage.init(named: "order_star_selected"), for: .selected)
        starOne.addTarget(self, action: #selector(clickStar(_:)), for: .touchDown)
        
        starTwo.translatesAutoresizingMaskIntoConstraints = false
        starTwo.tag = 2
        starTwo.setBackgroundImage(UIImage.init(named: "order_star"), for: .normal)
        starTwo.setBackgroundImage(UIImage.init(named: "order_star_selected"), for: .selected)
        starTwo.addTarget(self, action: #selector(clickStar(_:)), for: .touchDown)

        
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.textAlignment = .left
        descLabel.text = ""
        
        
        self.addSubview(starOne)
        self.addSubview(starTwo)
        self.addSubview(descLabel)
    }
    
    func addSomeConstraints() {
        starOne.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        starOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        starTwo.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        starTwo.leadingAnchor.constraint(equalTo: starOne.trailingAnchor, constant: 10).isActive = true
        
        descLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: self.starTwo.trailingAnchor, constant: 10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: response method
    func clickStar(_ btn: UIButton) {
        print("click star \(btn.tag)")
    }
}
class MyCell: UITableViewCell {
    var msgLabel = UILabel()
    var evaluateView = EvaluateView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
        addSomeConstraints()
    }
    
    func setupSubview() {
        msgLabel.translatesAutoresizingMaskIntoConstraints = false
        msgLabel.textAlignment = .left
        msgLabel.text = "描述相符"
        
        evaluateView.translatesAutoresizingMaskIntoConstraints = false
        evaluateView.isUserInteractionEnabled = true
        contentView.addSubview(msgLabel)
        contentView.addSubview(evaluateView)
    }
    func addSomeConstraints() {
        msgLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        msgLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        
        evaluateView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        evaluateView.leadingAnchor.constraint(equalTo: msgLabel.trailingAnchor, constant: 10).isActive = true
        evaluateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        evaluateView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class ViewController: UIViewController {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 44
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
