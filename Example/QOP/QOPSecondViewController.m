//
//  QOPSecondViewController.m
//  WyhViewModel_Example
//
//  Created by wyh on 2019/8/26.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import "QOPSecondViewController.h"
#import "QOPDemoData.h"
#import <QOP.h>

@interface QOPSecondViewController ()

@property (nonatomic, copy) NSString *name;

@end

@implementation QOPSecondViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"B title";
    
    __weak typeof(self) ws = self;
    QOPUNObserve(self, name);
    [QOPObserve(self, name) update:^(id observer, id updatedValue) {
        ws.title = updatedValue;
    }];   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)changeATitleAction:(id)sender {
    
    QOPDemoData.instance.identifier = @"BBBBB";
    
}
- (IBAction)changeBTitleAction:(id)sender {
    
    self.name = @"Change B title";
    
}

@end
