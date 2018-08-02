//
//  AlertaViewController.swift
//  InfraMap1.0
//
//  Created by student on 01/08/18.
//  Copyright © 2018 França. All rights reserved.
//

import UIKit

class AlertaViewController: UIViewController {

    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var foto: UIImageView!
    
    var lat: Double?
    var long: Double?
    var imagemRecebida: UIImage!
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(lat!)
        print(long!)
        foto.image = imagemRecebida
        
        // RESIZE
        let imagemRedimensionada = resizeImage(image: imagemRecebida, targetSize: CGSize(width: 300, height: 300))
        let imagemConvertida = convertBase64(imagemRecebida: imagemRedimensionada)
        print(imagemConvertida)
        
//        let imagemConvertida:String = convertBase64(imagemRecebida: imagemRecebida)!
        var alert: Alert?
        alert = Alert(photoAlert: imagemConvertida, latitude: lat!, longitude: long!)
        persistAlert(alert: alert!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func convertBase64(imagemRecebida: UIImage) -> String {
        let imageData = UIImageJPEGRepresentation(imagemRecebida, 0.75)! as NSData
//        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        let strBase64 = imageData.base64EncodedString()
        print("Resultado da Conversao: *********** NAO VOU PRINTAR PQ DEMORA")
        return strBase64
    }
    
    func persistAlert(alert: Alert){
        print("Cheguei na persistencia")
        AlertDAO.create(alert: alert)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
