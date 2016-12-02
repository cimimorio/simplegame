//
//  GameViewController.swift
//  SimpleGame
//
//  Created by apple on 12/2/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
			//create new scene
		let mainScene = MainScene(named:"")!;
		
		//create and add a camera to scene
		let cameraNode = SCNNode();
		cameraNode.camera = SCNCamera();
		mainScene.rootNode.addChildNode(cameraNode);
		
		//place the camera
		cameraNode.position = SCNVector3(x:0,y:0,z:15);
		
		//create and add a light to the scene
		let lightNode = SCNNode();
		lightNode.light = SCNLight();
		lightNode.light?.type = .ambient;
		lightNode.light?.color = UIColor.green;
		mainScene.rootNode.addChildNode(lightNode);
		
		
		
	}
	
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
	
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
