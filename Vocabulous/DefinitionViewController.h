//
//  DefinitionViewController.h
//  Vocabulous
//
//  Created by james sa on 2011/4/1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DefinitionViewController : UIViewController {
    UIWebView *webView;
    NSString *word;
}

@property (copy) NSString *word;

@end
