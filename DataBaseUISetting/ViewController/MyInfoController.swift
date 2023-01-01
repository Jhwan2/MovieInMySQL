//
//  MyInfoController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/21.
//

import UIKit

final class MyInfoController: UIViewController {
    
    var db = dbManager.shared
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phNumLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetting()
        myInfoSetting()
    }
    
    func tableViewSetting() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyReservationCell", bundle: nil), forCellReuseIdentifier: "reservationCell")
    }
    
    func myInfoSetting() {
        let us = db.getUserInfo()
        nameLabel.text = "이름 : " + us.name
        phNumLabel.text = "번호 : " + us.phoneNumber
        idLabel.text = "아이디 : " + us.id
    }

    
    
}

extension MyInfoController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservationCell", for: indexPath) as! MyReservationCell
        cell.titleLabel.text = "범죄도시2(대영극장)"
        cell.timeLabel.text = "12:30~3:00"
        cell.seatNumLable.text = "N3( 3 상영관 )"
        
        return cell
    }
    
    
    
}
