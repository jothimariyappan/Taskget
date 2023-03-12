//
//  VCprodiscription.swift
//  Taskget
//
//  Created by Jo on 06/12/22.
//

import UIKit
import Kingfisher

class VCprodiscription: UIViewController {
    
    @IBOutlet var lbllike: UILabel!
    var passdata = String()
    var passprice = String()
    var passimg = String()
    var passdis = String()
    var like = 0
//    var like = [Int]()
// view 1
       @IBOutlet var lblProName: UILabel!
       @IBOutlet var lblPrice: UILabel!
    
// VIEW 2
    @IBOutlet var vu2: UIView!
    @IBOutlet var lblDisc: UILabel!
    
    @IBOutlet var img: UIImageView!
    
// view 3
    @IBOutlet var vu3: UIView!
         @IBOutlet var clr1: UIView!
         @IBOutlet var clr2: UIView!
         @IBOutlet var clr3: UIView!
    
    @IBOutlet var imglike: UIImageView!
    
// view 5
    
    @IBOutlet var btnBUY: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vu2.layer.cornerRadius = 30
        vu2.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        clr1.layer.cornerRadius = clr1.frame.size.height / 2
        clr2.layer.cornerRadius = clr2.frame.size.height / 2
        clr3.layer.cornerRadius = clr3.frame.size.height / 2
        btnBUY.layer.cornerRadius = 16.5
        // Do any additional setup after loading the view.
        
        lblProName.text = passdata
        lblPrice.text = passprice
        img.kf.setImage(with: URL(string: passimg))
        lblDisc.text = passdis
        imglike.image = UIImage(named: "6")
        lbllike.text = "\(like)"
        
    }
        
    @IBAction func btnlike(_ sender: UIButton) {
        
        if imglike.image == UIImage(named: "6"){
            imglike.image = UIImage(named: "5")
            like += 1
            lbllike.text = "\(like)"
            
        }else{
            imglike.image = UIImage(named: "6")
            if like == 1{
                like = 0
                lbllike.text = "\(like)"
            }
            
         }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
