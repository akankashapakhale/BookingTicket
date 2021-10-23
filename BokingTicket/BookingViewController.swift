//
//  BookingViewController.swift
//  BokingTicket
//
//  Created by Akanksha pakhale on 22/10/21.
//

import UIKit

class BookingViewController: UIViewController {
    var myCollectionView:UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        let view = UIView()
              //view.backgroundColor = .gray
              
              let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
              layout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 10, right: 5)
              layout.itemSize = CGSize(width: 30, height: 30)
              
              myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
              myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = .secondarySystemBackground
              view.addSubview(myCollectionView ?? UICollectionView())
              
              self.view = view
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        setdata()
        
    }
    
    var data:Array<(key: String, value: Array<String>)>?

    func setdata(){
        let arr = ["B:1(C)|2(A)|3(C)|4(A)|5(c)|6(A)|7(C)|8(A)|9(C)/C:1(B)|2(C)|3(B)|4(C)|P|P|5(A)|6(C)|7(A)/D:1(C)| 2(A)|3(C)|4(A)|P|P|5(C)|6(A)|7(C)/E:1(A)|2(C)|3(A)|4(C)|P|P|5(A)|6(C)|7(A)/F:1(C)|2(A)|3(C)|4(A)| P|P|5(C)|6(A)|7(C)","B:1(C)|2(A)|3(C)|4(A)|5(c)|6(A)|7(C)|8(A)|9(C)/C:1(B)|2(C)|3(B)|4(C)|P|P|5(A)|6(C)|7(A)/D:1(C)| 2(A)|3(C)|4(A)|P|P|5(C)|6(A)|7(C)/E:1(A)|2(C)|3(A)|4(C)|P|P|5(A)|6(C)|7(A)/F:1(C)|2(A)|3(C)|4(A)| 5(C)|P|p)|6(A)|7(C)/G:1(C)|2(A)|3(C)|4(A)| 5(C)|P|p|6(A)|7(C)/H:1(C)|2(A)|3(C)|4(A)| 5(C)|P|p|6(A)|7(C)/I:1(C)|2(A)|3(C)|4(A)| 5(C)|P|p|6(A)|7(C)/J:1(C)|2(A)|3(C)|4(A)| 5(C)|P|p|6(A)|7(C)","B:1(C)|2(A)|3(C)|4(A)|p|6(A)|7(C)|8(A)|9(C)/C:1(B)|2(C)|3(B)|4(C)|P|6(A)|7(C)|8(A)|9(c)/D:p|p|p|p|P|P|p|p|p/E:p|1(a)|2(c)|3(b)|4(c)|5(B)|6(c)|p|p/F:p|1(c)|2(B)|3(C)|4(A)|5(c)|6(B)|p|p","B:1(B)|2(B)|3(B)|4(A)|5(c)|6(A)|7(C)|8(A)|9(C)/C:1(B)|2(C)|3(B)|4(C)|P|P|5(A)|6(C)|7(A)/D:1(C)| 2(A)|3(C)|4(A)|P|P|5(C)|6(A)|7(C)/E:1(A)|2(C)|3(A)|4(C)|P|P|5(b)|6(b)|7(b)/F:1(b)|2(A)|3(C)|4(A)| 5(b)|P|p)|6(A)|7(C)/G:1(C)|2(A)|3(b)|4(A)| 5(C)|P|p|6(A)|7(C)/H:1(C)|2(A)|3(B)|4(A)| 5(C)|P|p|6(A)|7(b)/I:1(C)|2(A)|3(C)|4(A)| 5(C)|P|p|6(A)|7(C)/J:1(B)|2(A)|3(B)|4(B)| 5(B)|P|p|6(A)|7(A)"]
        let striData = arr.randomElement()
        let test = striData!.components(separatedBy: "/")
        //print(test)
        var dic = [String:[String]]()
        for t in test{
            let u = t.components(separatedBy: ":")
            dic.updateValue((u.last?.components(separatedBy: "|"))! , forKey:u.first!)
        }
//        print(dic)
//        print(/*Array(dic.keys).sorted(by: <)*/dic.sorted(by: { $0.0 < $1.0 }))
        data = dic.sorted(by: { $0.0 < $1.0 })
        
    myCollectionView?.reloadData()
    }


}

extension BookingViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data![section].value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        let info = data![indexPath.section].value[indexPath.row]
        switch true {
        case info.uppercased().contains("C"):
            myCell.backgroundColor = UIColor.yellow
        case info.uppercased().contains("A"):
            myCell.backgroundColor = UIColor.green
        case info.uppercased().contains("B"):
            myCell.backgroundColor = UIColor.systemOrange
        default:
            myCell.backgroundColor = UIColor.clear
        }
       // myCell.backgroundColor = UIColor.blue
        return myCell
    }
}
extension BookingViewController: UICollectionViewDelegate {
 
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       setdata()
        
    }
}
