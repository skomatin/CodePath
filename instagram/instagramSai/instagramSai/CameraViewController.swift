//
//  CameraViewController.swift
//  instagramSai
//
//  Created by Saikiran Komatineni on 4/8/19.
//  Copyright © 2019 saikiran. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBAction func cameraButton(_ sender: Any) {
        print("camera button tapped")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        }
        else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let imageScaled = image.af_imageScaled(to: size)
        postImage.image = imageScaled
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let post = PFObject(className: "Posts")
        post["caption"] = caption.text!
        post["author"] = PFUser.current()!
        
        let imageData = postImage.image!.pngData()!
        let file = PFFileObject(data: imageData)
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                print("image saved successfully")
                self.dismiss(animated: true, completion: nil)
            }else {
                print(error?.localizedDescription)
            }
        }
        
    }
    
    @IBOutlet weak var caption: UITextField!
    @IBOutlet weak var postImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
