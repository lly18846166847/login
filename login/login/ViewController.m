//
//  ViewController.m
//  login
//
//  Created by bjhl on 2019/10/17.
//  Copyright © 2019 lly. All rights reserved.
//

#import "ViewController.h"
#import "Foundation/Foundation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTitle];
    [self createTextFields];
    [self createButton];
}
-(void)createTitle
{
    UILabel * lbTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 64)];
    [self.view  addSubview: lbTitle];
    lbTitle.backgroundColor = [UIColor orangeColor];
    lbTitle.text = @"USER_LOGIN";
    lbTitle.textColor = [UIColor whiteColor];
    lbTitle.textAlignment =  NSTextAlignmentCenter;  // 中心对齐
    lbTitle.font = [UIFont systemFontOfSize:24];   //字形 字号
}
-(void)createTextFields
{
    NSArray * arrName = @[@"user_name",@"user_password"];
    for(int i=0;i<arrName.count;i++)
    {
        UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake(0, 150+i*50, 300, 50)];
        [self.view addSubview : tf];
        CGPoint pt = tf.center;
        pt.x = self.view.frame.size.width/2;
        tf.center = pt;
        tf.layer.cornerRadius = 10;
        tf.layer.borderWidth = 1;
        tf.clipsToBounds = YES;   //剪裁超过父视图的子试图
        tf.layer.borderColor = [UIColor grayColor].CGColor;
        
        UILabel * lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 130)];
        lb.text = arrName[i];
        lb.textAlignment = NSTextAlignmentCenter;   //中心对齐
        lb.font = [UIFont systemFontOfSize:14];
        tf.leftView = lb;   //设计TextField 左右两边的试图
        tf.leftViewMode = UITextFieldViewModeAlways;
        tf.tag = i+1;
        if (i == 1){
        tf.secureTextEntry = YES;  //密码文本框
        }
    }
}
//实现系统方法，在任意一个文本框区域之外点击，键盘收回
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //循环文本框，看哪一个是使键盘弹出来的框框即第一响应者
    for (int i = 0; i<3; i ++)
    {
        //获取文本框通过标号
        UITextField *tf = (UITextField *)[self.view viewWithTag:i + 1];
        if ([tf isFirstResponder])
        {
            //是
            //释放第一响应者身份
            [tf resignFirstResponder];
        }
    }
}
-(void) createButton
{
    NSArray * arr =  @[@"Login",@"Regist"];
    for(int i =0;i<arr.count;i++)
    {
        UIButton *btn =[[UIButton alloc] initWithFrame:CGRectMake(70 +i*90, 260, 70, 40)];
        [self.view addSubview:btn];//把按钮添加上
        btn.backgroundColor = [UIColor orangeColor];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.tag = i+1;
        [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
//登录按钮的点击事件处理方法
-(void) clickButton : (UIButton *) btn
{
    //先获取用户名和密码的文本框
    UITextField *tfUserName = (UITextField *)[self.view viewWithTag:1];
    UITextField *tfPassword = (UITextField *)[self.view viewWithTag:2];
    //获取文本框的文字
    NSString *strUserName = tfUserName.text;
    NSString *strPassword = tfPassword.text;
    NSLog(@"%@",strUserName);
    NSLog(@"%@",strPassword);
    
    if(btn.tag == 0)
    {
        if ([strUserName isEqualToString:@"Lly"] && [strPassword isEqualToString:@"123"] )
        {
        //登陆成功
            NSLog(@"login sucessed!");
        }
        else{
            NSLog(@"login failed!");
        }
    }
    else
    {
        NSLog(@"regist sucessed");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
