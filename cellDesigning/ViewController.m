//
//  ViewController.m
//  cellDesigning
//
//  Created by 李玉卿 on 6/3/19.
//  Copyright © 2019 李玉卿. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController (){
    SecondViewController *sVC;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dic1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"1.jpeg",@"image",nil];
    NSDictionary *dic2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"2.jpeg",@"image",nil];
    NSDictionary *dic3 = [[NSDictionary alloc]initWithObjectsAndKeys:@"3.jpeg",@"image",nil];
    NSDictionary *dic4 = [[NSDictionary alloc]initWithObjectsAndKeys:@"4.jpeg",@"image",nil];
    NSDictionary *dic5 = [[NSDictionary alloc]initWithObjectsAndKeys:@"5.jpeg",@"image",nil];
    NSDictionary *dic6 = [[NSDictionary alloc]initWithObjectsAndKeys:@"6.jpeg",@"image",nil];
    NSDictionary *dic7 = [[NSDictionary alloc]initWithObjectsAndKeys:@"7.jpeg",@"image",nil];
    NSDictionary *dic8 = [[NSDictionary alloc]initWithObjectsAndKeys:@"8.jpeg",@"image",nil];
    
    _stuArry = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4,dic5,dic6,dic7,dic8,nil];
    sVC = [[SecondViewController alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return [_stuArry count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 300;
}
#define imageTag         4
#define fontSize        12
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"newCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        
        CGRect imageRect = CGRectMake(15, 15, 350, 300);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:imageRect];
        imageView.tag = 104;
        CALayer *layer = [imageView layer];
        layer.cornerRadius = 9;
        layer.borderColor = [[UIColor whiteColor]CGColor];
        layer.borderWidth = 1;
        [cell.contentView addSubview:imageView];
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(100, 15 ,80 , 30);
        [button setTitle:@"button" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        button.layer.borderColor=[[UIColor orangeColor]CGColor];
        button.layer.borderWidth=1;
        button.layer.cornerRadius=5;
//        [button addTarget:self action:@selector(btAction:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];

        [cell addSubview:button];

    }
    NSDictionary *dic = [_stuArry objectAtIndex:indexPath.row];
    
    UIImageView *imageV = [cell.contentView viewWithTag:104];
    imageV.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    
//    //    add tapGesture.
//    imageV.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
//    [imageV addGestureRecognizer:tapGesture];
//    [tapGesture addTarget:self action:@selector(displayPickerView:)];


    return cell;
}
- (void) tapAction:(UIButton*)bt{
    [self presentViewController:sVC animated:YES completion:nil];
    NSIndexPath *myIndex=[self.tableView indexPathForCell:(UITableViewCell*)[bt superview]];
    NSLog(@"myIndex.row==%ld",myIndex.row);
    _index = [NSString stringWithFormat:@"%ld",myIndex.row];
    NSLog(@"myIndex.row==%ld",_index);
    sVC.ppp = _index;
}
        
-(void)displayPickerView:(UITapGestureRecognizer*)sender
{
    UITextField *textField = (UITextField*)[sender view];
    NSLog(@"tag=  %ld", (long)textField.tag);
}

-(UITapGestureRecognizer*)createTapGestureOnView:(UIView *)view
{
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]init];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [view addGestureRecognizer:tapGesture];
    return tapGesture;
}
//-(void)btAction:(UIButton*)bt
//{
//    NSIndexPath *myIndex=[self.tableView indexPathForCell:(UITableViewCell*)[bt superview]];
//    NSLog(@"myIndex.row==%ld",myIndex.row);
//    _index = [NSString stringWithFormat:@"%ld",myIndex.row];
////    NSLog(@"result = %s",_index);
//}


@end
