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

class GameViewController: UIViewController{
	
	var scnView:SCNView!;
	var scnScene:SCNScene!;
	var cameraNode:SCNNode!;
	var spawnTime:TimeInterval = 0;
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupView();
		setupScene();
		setupCamera();
		spawnShape();
	}
	
	func setupView(){
		scnView = self.view as! SCNView;
		scnView.showsStatistics = true;
		scnView.allowsCameraControl = true;
		scnView.autoenablesDefaultLighting = true;
		scnView.delegate = self;
		scnView.isPlaying = true;
	}
	func setupScene(){
		scnScene = SCNScene();
		scnView.scene = scnScene;
		scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png";
	}
	func setupCamera(){
		cameraNode = SCNNode();
		cameraNode.camera = SCNCamera();
		cameraNode.position = SCNVector3(x:0,y:5,z:10);
		scnScene.rootNode.addChildNode(cameraNode);
	}
	
	func spawnShape() -> Void {
		var geometry:SCNGeometry;
		switch ShapeType.random() {
		default:
			geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0);
		}
		let geometryNode = SCNNode(geometry: geometry);
		scnScene.rootNode.addChildNode(geometryNode);
		geometryNode.physicsBody = SCNPhysicsBody(type:.dynamic, shape: nil);
		let randomX:Float = -1.0;
		let randomY:Float = 15.0;
		let force = SCNVector3(x:randomX,y:randomY,z:0);
		let position = SCNVector3(x:0.05,y:0.05,z:0.05);
		geometryNode.physicsBody?.applyForce(force, at: position, asImpulse: true);

	}
	
	func cleanNode() -> Void {
		for node in scnScene.rootNode.childNodes {
			if node.position.y < -2 {
				node.removeFromParentNode();
			}
		}
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

extension GameViewController:SCNSceneRendererDelegate{
	func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
		if time > spawnTime {
			spawnShape();
			cleanNode();
			// 2
			spawnTime = time + TimeInterval(2.0);
		}
		
	}
}



