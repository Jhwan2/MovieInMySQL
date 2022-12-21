//
//  MyReservationCell.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/12/21.
//

import UIKit

class MyReservationCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var seatNumLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func reservationCancelBtnTapped(_ sender: UIButton) {
        print(#function)
    }
}
