//
//  SecondViewController.m
//  cellDesigning
//
//  Created by 李玉卿 on 6/4/19.
//  Copyright © 2019 李玉卿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController{
    UIView *background;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.view.backgroundColor = [ UIColor redColor];
    
    //    创建一个黑色背景
    //初始化一个用来当做背景的View
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 500, 900)];
    background = bgView;
    [bgView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:bgView];
    
    //创建显示图像的视图
    //初始化要显示的图片内容的imageView
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 375, 812)];
    //要显示的图片，即要放大的图片
    int num = [self.ppp intValue];
    NSLog(@"NUM = %d",num);
    [imgView setImage:[UIImage imageNamed:@"1.jpeg"]];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [bgView addSubview:imgView];
    
    UIButton *Btn  = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 50, 50)];
    [Btn setTitle:@"return" forState:UIControlStateNormal];
    Btn.backgroundColor = [UIColor lightGrayColor];
    [Btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:Btn];
    
    imgView.userInteractionEnabled = YES;
    
}



-(void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

