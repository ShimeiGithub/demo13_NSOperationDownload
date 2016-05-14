//
//  ViewController.m
//  demo13_NSOperationDownload
//
//  Created by LuoShimei on 16/5/15.
//  Copyright © 2016年 罗仕镁. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 显示图片的控件 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
/** 点击下载图片的操作 */
- (IBAction)downloadByOperation:(id)sender {
    NSString *imageNetPath = @"http://images.apple.com/v/iphone-5s/gallery/a/images/download/photo_6.jpg";
    //创建队列
    NSOperationQueue *customQueue = [[NSOperationQueue alloc] init];
    [customQueue addOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:imageNetPath];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        //在主队列中刷新图片
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            self.imageView.image = image;
        }];
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
