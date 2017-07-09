//
//  ECDLoginVC.m
//  ZZKong
//
//  Created by lee on 16/9/18.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ZZKLoginVC.h"
#import "ETStoryboard.h"
#import "ETPredicate.h"
#import "ETBottomLineTextField.h"
#import "ECDNC.h"
#import "NSString+MD5.h"
#import "ECDLoginModel.h"
#import "UIViewController+loading.h"

#import "ECDSetting.h"
#import "ETUserDefault.h"
#import "ETLeftViewTextFeild.h"
#import "ETBottomLineLeftViewTextFeild.h"
#import "ETColor.h"




@interface ZZKLoginVC ()<UIPickerViewDataSource, UIPickerViewDelegate>
{
    BOOL _isAgree;

}

@property (weak, nonatomic) IBOutlet ETBottomLineLeftViewTextFeild *loginId;

@property (weak, nonatomic) IBOutlet ETBottomLineLeftViewTextFeild *loginPwd;

@property (weak, nonatomic) IBOutlet UIButton *btnCheckbox;

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
@property (weak, nonatomic) IBOutlet UIButton *btnForgetPwd;

@property (strong, nonatomic) UIPickerView *pickerView;

- (IBAction)login:(id)sender;
- (IBAction)userRegister:(id)sender;
- (IBAction)forgetPwd:(id)sender;

@end

@implementation ZZKLoginVC
-(UIPickerView *)pickerView{
    if(!_pickerView){
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.9];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        _pickerView.alpha = 0;
    }
    return _pickerView;

}



#pragma mark LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

-(void)initUI{
    [self initNavigationBar];
    [self initMainView];
    [self showServerPicker];
}

-(void)initNavigationBar{
    self.navigationBarHidden = NO;
    self.title = @"登录";
}

-(void)initMainView{


    self.loginId.baseTextColor = [ETColor colorWithRGB:0xcacaca];
    self.loginPwd.baseTextColor = [ETColor colorWithRGB:0xcacaca];

    self.loginId.lineColor = [ETColor colorWithRGB:0xcacaca];
    self.loginPwd.lineColor = [ETColor colorWithRGB:0xcacaca];
    
    self.loginId.leftImageName = @"mobile";
    self.loginPwd.leftImageName = @"lock";


    self.loginId.placeholder = @"请输入手机号";
    self.loginId.placeHolderColor =  [ETColor colorWithRGB:0xcacaca];
    self.loginId.keyboardType = UIKeyboardTypePhonePad;
    
    self.loginPwd.placeholder = @"请输入密码";
    self.loginPwd.placeHolderColor =  [ETColor colorWithRGB:0xcacaca];
    self.loginPwd.secureTextEntry = YES;
    
    
    [self.btnCheckbox setImage:[UIImage imageNamed:@"unselected"] forState:UIControlStateNormal];
    [self.btnCheckbox setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    self.btnCheckbox.backgroundColor = [UIColor clearColor];
    
    [self setUserAndPwd];
    
}

//初始化记住密码
-(void)setUserAndPwd {
    ECDLoginModel *login = [ECDLoginModel load];
    BOOL remember =  [[ECDLoginModel getRemember] boolValue];

    if(remember){
        if (login.loginUsername) {
            self.loginId.text = login.loginUsername;
        }
        if (login.loginPassword) {
            self.loginPwd.text = login.loginPassword;
        }
    }else{
        self.loginId.text = @"";
        self.loginPwd.text = @"";
    }
    self.btnCheckbox.selected = remember;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//所有输入项是否合法
-(BOOL)isInputsValid {
    
    if ([ETPredicate isAllSpace:self.loginId.text]){
        ETToast(@"手机号不能为空！");
        return NO;
    }
    if (![ETPredicate checkPhoneNumber:self.loginId.text]) {
        ETToast(@"用户名必须为手机号码！");
        return NO;
    }
    if ([ETPredicate isAllSpace:self.loginPwd.text]){
        ETToast(@"密码不能为空！");
        return NO;
    }
//    if (![ETPredicate checkCharacter:self.loginPwd.text]){
//        ETToast(@"密码只能由字母和数字组成！");
//        return NO;
//    }
    if (![ETPredicate checkPassword:self.loginPwd.text]){
        ETToast(@"密码长度必须大于8位！");
        return NO;
    }
    return YES;
}



#pragma mark Action method
- (IBAction)login:(id)sender {
//    [self.view endEditing:YES];
//    if([self isInputsValid]){
        [self userLogin];
//    }
}

- (IBAction)userRegister:(id)sender {
    [ETStoryboard setStoryboardName:@"Login"];
//    ECDRegisterStep1VC *step1VC = (ECDRegisterStep1VC *)[ETStoryboard viewControllerByName:@"ECDRegisterStep1VC"];
//   [self.navigationController pushViewController:step1VC animated:YES];
}


- (IBAction)forgetPwd:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    
//    ECDForgetPasswordVC *forgetVC = (ECDForgetPasswordVC *) [self viewControllerBySBName:@"Login" aVcName:@"ECDForgetPasswordVC"];
//     [self.navigationController pushViewController:forgetVC animated:YES];
    
    
//    if([self forgetValidate]){
//        WEAK_SELF;
//        [ECDAppStatus ticket:^(NSString *ticket) {
//            STRONG_SELF;
//            [self forgetPassword:ticket];
//        }];
//    }
}


#pragma mark 登录请求
- (IBAction)agreeAction:(id)sender {
    UIButton *check = (UIButton *)sender;
    if(check.selected){
        [check setSelected:NO];
        _isAgree = NO;
    }else{
        [check setSelected:YES];
        _isAgree = YES;
    }
    
    [ECDLoginModel  updateRemember:@(_isAgree) ]; //更新记住用户名和密码
}


//dimiss到主页面
-(void)navigateMainVC{

    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationLogined object:nil];

    [[self appDelegate] showTabbarController];
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}



-(void)userLogin {
    [self hideServerPicker];
    
//    [self showLoading];
//    @weakify(self)
//    [[self getLoginSignal] subscribeNext:^(ECDLoginModel *result) {
//        @strongify(self)
//        if (result.success) {
//            result.loginUsername = self.loginId.text;
//            result.loginPassword = self.loginPwd.text;
//            [result save];   //登录成功保存
            [self performSelector:@selector(navigateMainVC) withObject:nil afterDelay:0.3];

//        }else{
//            NSString *msg = [NSString stringWithFormat:@"%@",result.MessageText];
//            ETToast(msg);
//        }
//         [self hideLoading];
//    }];
}


-(RACSignal *)getLoginSignal {
    ETCommonRequest *request = [ETCommonRequest new];
    request.relativePath =@"user/login1";
    [request setResponseModelClass:[ECDLoginModel class]];  //更改返回类型
//        [request setResponseModelClass:@"ECDLoginModel"];
    request.method = @"POST";
//    NSString *pcid = nil;
//    if([ETUtils isAllKindsNull:[ETUserDefault getValueForKey:@"pcid"]]){
//        pcid = @"";
//    }else{
//        pcid = [ETUserDefault getValueForKey:@"pcid"];
//    }
    
    request.params = @{
                       @"phoneOrMail":self.loginId.text,
                       @"userPassword":self.loginPwd.text
                      };
    return [ETCommonRequest commonApiSignal:request queue:nil  isModel:YES];

}

//找回密码
-(void)forgetPassword:(NSString *)ticket{
    [self showLoading];
    @weakify(self)
    [[self forgetPasswordSignal:ticket] subscribeNext:^(ETCommonResponse *result) {
        @strongify(self)
        if (result.success) {
        }else{
//            ETToast(result.msg);
        }
        [self hideLoading];
    }];
}

//POST /v2/user/pwd  忘记密码
//POST /v2/user/pwd/sms/{mobile} 找回POST找回密码发送验证码
-(RACSignal *)forgetPasswordSignal:(NSString *)ticket{
    ETCommonRequest *request = [ETCommonRequest new];
    request.relativePath = [NSString stringWithFormat:@"user/pwd/sms/%@?_ticket_=%@",self.loginId.text,ticket];
    request.method = @"POST";
    return [ETCommonRequest commonApiSignal:request queue:nil];
}
//验证忘记密码时的输入项
-(BOOL)forgetValidate{
    if ([ETPredicate isAllSpace:self.loginId.text]){
        ETToast(@"用户名不能为空！");
        return NO;
    }
    if (![ETPredicate checkPhoneNumber:self.loginId.text]) {
        ETToast(@"用户名必须为手机号码！");
        return NO;
    }
    return YES;
}



#pragma mark - server picker for debug


-(void)showServerPicker {
    
    if (![ECDSetting getAppStatus]) {
        return;
    }
    
    [self.pickerView removeFromSuperview];
    [self.view addSubview:self.pickerView];
    [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
        make.height.equalTo(@150);
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerView.alpha = 1;
    }];
    [self.pickerView selectRow:[ECDSetting lastServerEnvironment] inComponent:0 animated:NO];
}

-(void)hideServerPicker {
    if (![ECDSetting getAppStatus]) {
        return;
    }
    
    self.pickerView.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.pickerView removeFromSuperview];
        self.pickerView.userInteractionEnabled = YES;
    }];
}



#pragma mark - @protocol UIPickerViewDataSource<NSObject>
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [ECDSetting serverURLs].count;
}

#pragma mark -@protocol UIPickerViewDelegate<NSObject>
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [ECDSetting envirmentDescription:row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
        pickerLabel.minimumScaleFactor = 0.5;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor whiteColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:13]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [ECDSetting setServerEnvironment:row];
    [self hideServerPicker];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 44;
}


@end
