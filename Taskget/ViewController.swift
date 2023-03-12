//
//  ViewController.swift
//  Taskget
//
//  Created by Jo on 04/12/22.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    
    @IBOutlet var clc: UICollectionView!
    
    var Mydata = [Model]()
    
   // MARK: - VIEW OUTLET
    @IBOutlet var vU1: UIView!
    @IBOutlet var vU3: UIView!
    @IBOutlet var vU2: UIView!
    
    @IBOutlet var srchns: NSLayoutConstraint!
    @IBOutlet var lblTitel: UILabel! // vU2
    
    
    @IBOutlet var btnsrch: UIButton!
    
    let url = "http://174.138.121.52:3009/v1/product/getAllProduct"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getdata()
        srchns.constant = 0
        
        
    }
    
    
    
    func getdata(){
        
        AF.request(url, method: .get).responseJSON { [self] resp in
            switch resp.result{
                
            case .success(let suc):
//                print(suc)
           // MARK: - url bytes convert to json format
//                let json = try! JSONSerialization.jsonObject(with: suc!, options: [])
//                print(json)
                
                if let value = suc as? [String:Any] {
                    print(value)
                    if let result = value["data"] as? [[String:Any]]{
//                        print(result)
                        for i in result {
                            Mydata.append(Model(fromdata: i))

                        }
                        clc.reloadData()
                    }
                }
               
                
            case .failure(let err):
                print(err)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Mydata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvcProducts", for: indexPath) as! cvcProducts
        cell.lblProductname.text = Mydata[indexPath.row].name ?? ""
        cell.lblproductPrice.text = Mydata[indexPath.row].price ?? ""
        cell.img.kf.setImage(with: URL(string: Mydata[indexPath.row].image ?? "" ))
        
        cell.img.layer.cornerRadius = 30
        cell.imgView.layer.cornerRadius = 20
        
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let pass = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCprodiscription") as! VCprodiscription
        
        pass.passimg =  Mydata[indexPath.row].image ?? ""
        pass.passdata = Mydata[indexPath.row].name ?? ""
        pass.passprice = Mydata[indexPath.row].price ?? ""
        pass.passdis = Mydata[indexPath.row].dis ?? ""
        
        
//        pass.
        
       
        self.navigationController?.pushViewController(pass, animated: true)
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 175, height: 230)
    }

    
    func animations(withDuration: Double,delay: Double,width: NSLayoutConstraint){
        UIView.animate(withDuration: withDuration, delay: delay) { [self] in
            if srchns.constant == 0{
                srchns.constant = 250
            
                
            }
            else{
                srchns.constant = 0
            }
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func btnsrch(_ sender: UIButton) {
        animations(withDuration: 1, delay: 0, width: srchns)
    }
    
}

class Model{
    
    var image : String?
    var name : String?
    var price : String?
    var dis : String?
    init(fromdata: [String:Any]){
        
        self.image = fromdata["image"] as? String
        self.name = fromdata["name"] as? String
        self.price = fromdata["price"] as? String
        self.dis = fromdata["description"] as? String
    }
}
   
