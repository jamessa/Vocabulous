//
//  DefinitionViewController.m
//  Vocabulous
//
//  Created by james sa on 2011/4/1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DefinitionViewController.h"


@implementation DefinitionViewController

@synthesize word;

- (NSURLRequest *)urlRequest
{
    NSString *urlString = @"http://www.google.com/dictionary";
    if (self.word) {
        urlString = [urlString stringByAppendingFormat:@"?langpair=en%%7Cen&q=%@", self.word];
    }
    return [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
}

- (void)setWord:(NSString *)newWord
{
    if (word != newWord) {
        [word release];
        word = [newWord copy];
    }
    self.title = word;
    if (webView.window) {
        [webView loadRequest:[self urlRequest]];
    }
}

- (void)loadView
{
    webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    webView.scalesPageToFit = YES;
    self.view = webView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [webView loadRequest:[self urlRequest]];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
