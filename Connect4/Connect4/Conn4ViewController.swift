//
//  ViewController.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-07.
//

import Cocoa
import MultipeerConnectivity

class Conn4ViewController: NSViewController {

    var conn4Board = Conn4Board()
    
    var peerID: MCPeerID!
    var session: MCSession!
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser!
    
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peerID = MCPeerID(displayName: Host.current().name ?? "Golden Thumb's mbp2020")
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self

        boardView.conn4Delegate = self
        
        boardView.shadowPiecesBox = conn4Board.piecesBox
        boardView.setNeedsDisplay(boardView.bounds)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func advertise(_ sender: NSButton) {
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "gt-conn4")
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceAdvertiser.startAdvertisingPeer()
    }
    
    @IBAction func invite(_ sender: NSButton) {
        let browser = MCBrowserViewController(serviceType: "gt-conn4", session: session)
        browser.delegate = self
        presentAsSheet(browser)
    }
    
    func makeMoveAt(col: Int) {
        conn4Board.dropPieceAt(col: col)
        boardView.shadowPiecesBox = conn4Board.piecesBox
        boardView.setNeedsDisplay(boardView.bounds)
    }
}

extension Conn4ViewController: Conn4Delegate {
    func dropPieceAt(col: Int) {
        makeMoveAt(col: col)
        
        let colStr: String = "\(col)"
        if let colData = colStr.data(using: .utf8) {
            try? session.send(colData, toPeers: session.connectedPeers, with: .reliable)
        }
    }
}

extension Conn4ViewController: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(browserViewController)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(browserViewController)
    }
}

extension Conn4ViewController: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
}

extension Conn4ViewController: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let colStr = String(data: data, encoding: .utf8), let col = Int(colStr) {
            DispatchQueue.main.async {
                self.makeMoveAt(col: col)
            }
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
}
