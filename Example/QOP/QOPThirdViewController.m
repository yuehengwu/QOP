//
//  QOPThirdViewController.m
//  QOP_Example
//
//  Created by Michael Wu on 2019/8/27.
//  Copyright © 2019 609223770@qq.com. All rights reserved.
//

#import "QOPThirdViewController.h"
#import <QOP.h>

@interface QOPThirdViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *topTextView;
@property (weak, nonatomic) IBOutlet UITextView *bottomTextView;

@end

@implementation QOPThirdViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak typeof(self) ws = self;
    [self.bottomTextView.qop.bind(self.topTextView).keypath(@"text") update:^(id observer, id updatedValue) {
       
        ws.bottomTextView.text = updatedValue;
        
    }];
    
    [self.topTextView.qop.bind(self.bottomTextView).keypath(@"text") update:^(id observer, id updatedValue) {
        
        ws.topTextView.text = updatedValue;
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.topTextView resignFirstResponder];
    [self.bottomTextView resignFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView {
    
    if ([textView isEqual:self.topTextView]) {
        self.bottomTextView.text = textView.text;
    }else {
        self.topTextView.text = textView.text;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
