//
//  XmlPPP.swift
//  xmlParse
//
//  Created by  yanglc on 15/12/3.
//  Copyright © 2015年  yanglc. All rights reserved.
//

import UIKit

class XmlPPP: NSObject,NSXMLParserDelegate {
    
    internal var notes:NSMutableArray!
    
    internal var  currentTag:String!;
    
    

    
    func start(){
        let path  = NSBundle.mainBundle().pathForResource("notes", ofType: "xml");
    
        var rr = NSURL(fileURLWithPath: path!);
        
        var paser = NSXMLParser(contentsOfURL: rr);
        paser!.delegate = self;
        
        
        paser?.parse();
        
    
       
    }
    
    
    func parserDidStartDocument(parser: NSXMLParser) {
        self.notes = NSMutableArray();
    }
    
    
    func parserDidEndDocument(parser: NSXMLParser) {
    
        print("解析完成")
        
        print(self.notes)
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print(parseError)
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        self.currentTag  = elementName;
        
        if(self.currentTag == "Note"){
            let id = attributeDict["id"]! as NSString;
            var dic = NSMutableDictionary();
            dic.setObject(id, forKey: "id");
            self.notes.addObject(dic);
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
    
        let str = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if(str == ""){
            return
        }
        
        var dic = self.notes.lastObject as! NSMutableDictionary;
        
        
        if(currentTag == "AAA"){
            dic.setObject(string, forKey: "AAA");
        }
        if(currentTag == "BBB"){
            dic.setObject(string, forKey: "BBB")
            
        }
        if(currentTag == "CCC"){
            dic.setObject(string, forKey: "CCC")
            
        }
        
    }
    
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        self.currentTag = nil
    }
    
    
    
    
    

}
