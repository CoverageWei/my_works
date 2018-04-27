设计 1d
NEI录入 1d
联调 2d
冒烟 1d
环境搭建（联调+冒烟）1d


开发部分：
绑定流程选择保留有学习数据账号 1.5d	pjt
下单时切换登录账号 0.5d			pjt
绑定时双学习账号点击切换登录 1d		pjt


下单页账号信息显示 0.5d			ww
下单时绑定手机号 2d				ww
机构后台订单列表显示买家账号 1d		ww



// 更新课程索引
courseSearchIndexJmsProvider.index(oldTermDto.getCourseId());


  
	
2、发送验证码：
增加 sign

/**
 * 发送验证码
 * 
 * @param ver
 * @param phoneNumber
 * @param hasClientRegistered
 * @param request
 * @return
 */
@RequestMapping(value = "/member/sendValidationCode/v{ver}")
ver = 3
phoneNumber + hasRegistered 


3、完成绑定

/member/bindPhoneNumberToAccount/v{ver}

安卓：
新增接口，带 sign
参数：
	phoneNumber + validationCode + password
return：
	有木有被佔用； true/false
	name
	accessToken(根據 phoneNumber)

ios：
新增接口，带 sign
参数：
	phoneNumber + validationCode + password
return:
	有木有被佔用； true/false
	name
	accessToken(根據phoneNumber)


4、切換 

安卓：
	带 sign
	参数： accessToken
	return： LoginInData


ios：
	

生成token：
mobilememberController	795
String mob_token = getToken(uid, timestamp, type, null, logonSessionDto.getSid(), null, mid);
            String mob_p_token = getToken(uid, timestamp + 1, type, null, logonSessionDto.getSid(), null, mid);
            
解析token：
TokenFilter.doFilter(...)

/logonForAndroid 有返回 完整的 LoginData；

app 手机号登录：
/member/phoneLogon/v{ver}




C端ykt 绑定手机账号：（资料设置 > 账号设置 > 手机帐号 > 绑定手机号）

1.1、输入手机号：
https://study.163.com/passport/cellphone/isMobileExist.htm	校验手机号是否存在；
	cellphoneLoginManager.ifMobileExist(mobile)
		[app_passport表]  app_user_login_id = 手机号 and app_id = -1 and app_type = 3 limit 1;

1.2、
https://study.163.com/passport/cellphone/needVerifyCode.htm
mobile:13732226115

{code: 0, message: "ok", result: false}


https://study.163.com/passport/cellphone/getEncryptKey.htm
mobile:13732226115

{"code":0,"message":"ok","result":"9BHxNf9xa1EbpuiT"}

1.3
https://study.163.com/passport/cellphone/v2/sendValidationCode.htm
params:emtGNW5HdkhuSHI5UExSRnJLbXdKTmdvcjU3eXhhdU8zQzNlVW5FOWl3RXF4a3I0UHFBaXJiN0l1V3BMTFlBNmRmeEJjK3VUT01YbUQ5S3lRQjNOT2Fiblp6aDVLT09DbVYvbzM1SzlRaEoxZXRnYVZTa0pQSUNhWmRaaWtjYnM3NFZhVDNMdFpnME1yL00wS0lLMHhOai9obXlUZEdXUEF4ZjFZck12eUVYaER2MXIxQ21ENFN3dmg0RFhYU0Rz
bizType:reg
mobile:13732226115

{"code":0,"message":"发送成功"}

点击“发送验证码”后，前端触发 1.1 - 1.3请求；


2.1、完成绑定
https://study.163.com/passport/cellphone/validateRegisterCondition.htm
mobile:13732226115
validationCode:123456

{"code":12,"message":"请输入正确的验证码"}



2.1、校验验证码
https://study.163.com/passport/cellphone/validateRegisterCondition.htm
mobile:18795959175
validationCode:6244

2.2、注册app_passport之后 重定向  （手机号未被注册的时候走这个请求， 注册并做绑定）
https://study.163.com/passport/cellphone/regAndBindCallback.htm?validationCode=6244&mobile=18795959175&password=327e6bb9b81460c4f447b0eac8ef984c&returnUrl=Ly9zdHVkeS4xNjMuY29t
302
validationCode:6244
mobile:18795959175
password:327e6bb9b81460c4f447b0eac8ef984c
returnUrl:Ly9zdHVkeS4xNjMuY29t
(后端做重定向：return "redirect:/member/bindCallback.htm?success=" + result + "&loginType=" + loginType + "&returnUrl="
               + returnUrl;)

2.3、关闭弹窗
https://study.163.com/member/bindCallback.htm?success=true&loginType=30&returnUrl=Ly9zdHVkeS4xNjMuY29t&success=true&loginType=30
Request Method:GET

success:true
loginType:30
returnUrl:Ly9zdHVkeS4xNjMuY29t
【写 cookie】


3、绑定账号
http://study.163.com/dwr/call/plaincall/BindAccountBean.getBindMemberData.dwr
Request Method:POST

当前登录账号信息 (loginId + loginType + memberId)： cookie "STUDY_WTR"; 
绑定账号信息 (loginId + loginType + memberId)：    cookie "STUDY_BIND_COOKIE_NAME"; 


BindAccountLogic.getBindMemberData()		// 二者memberId都存在的时候，study 和 mooc 是否有学习数据，会作为结果返回！
	// 当前账户信息,根据memberId获取用户在云课堂和中M的相关数据
    Long currentMemberId = currentAccount.getBindingMemberId();
    Map<String, Object> currentAccountData = memberLogic.getCompareData4Member(currentMemberId);
    	"study":		study 有学习数据 才put；
    	"mooc":			同理；
    	"memberId"
    	"nickName"
    	"smallFaceUrl"
    // 判断用户存在特殊权限
    boolean currentSpecial = hasSpecialPrivilege4Binding(currentMemberId);

    // 被绑定账户信息
    Long bindedMemberId = bindedAccount.getBindingMemberId();
    Map<String, Object> bindedAccountData = memberLogic.getCompareData4Member(bindedMemberId);
    boolean bindedSpecial = hasSpecialPrivilege4Binding(bindedMemberId);

    result.put("currentAccount", currentAccountData);
    currentAccountData.put("specialType", currentSpecial);

    result.put("bindedAccount", bindedAccountData);
    bindedAccountData.put("specialType", bindedSpecial);

    if (currentSpecial && bindedSpecial) {
        throw new FrontNotifiableRuntimeException("登录帐号和绑定帐号均为特殊帐号，暂不支持绑定功能。");
    }

    // currentMemberId 和 bindedMemberId 一个存在一个不存在
    if (currentMemberId != null) {
        nickName = doBindMember(currentAccount.getLoginId(), currentAccount.getLoginType(),
            bindedAccount.getLoginId(), bindedAccount.getLoginType(), currentMemberId, bindedMemberId, true,request);

    } else {
        nickName = doBindMember(bindedAccount.getLoginId(), bindedAccount.getLoginType(),
            currentAccount.getLoginId(), currentAccount.getLoginType(), bindedMemberId, currentMemberId,
            false,request);
        result.put("refresh", Boolean.TRUE);
    }


doBindMember(...)
	bindAccountTransactionLogic.doBindMemberWithTransaction(bindedLoginId, bindedLoginType, currentMemberId, bindedMemberId, selectCurrent);
		LoginAccount existAccount = loginAccountService.getLoginAccount(currentMemberId, bindedLoginType);
        if (existAccount != null) {
            throw new FrontNotifiableRuntimeException("同类型帐号无法重复绑定。");
        }

        boolean bindResult = loginAccountService.changeBindingMemberId(bindedLoginId, bindedLoginType, currentMemberId);




手机号已注册：
1、输入手机号
https://study.163.com/passport/cellphone/isMobileExist.htm
mobile:13732226115

true

2、输入手机号 + 密码
点击“完成绑定”：
https://study.163.com/passport/cellphone/validateLoginCondition.htm
mobile:13732226115
password:8057a9ae62d782d115be8019d5520265

{"code":23,"message":"帐号或密码错误，请重新输入"}


cellphoneLoginManager.validateLoginCondition(mobile, password)
	return new ResponseView(23, "帐号或密码错误，请重新输入");
	return new ResponseView(0, "验证登录成功");

【前端根据 状态码 0 来自己拼接重定向url，打开小窗口...（和未注册手机号流程相同），最终在 原页面调用 请求3，做账号绑定】	


3、账号绑定
http://study.163.com/dwr/call/plaincall/BindAccountBean.getBindMemberData.dwr

输入正确密码：
3.1、如果 当前账号 和 待绑定账号 都绑定了 member && 待绑定账号有学习数据：
	绑定失败，...请绑定其他帐号。（返回2个账号的学习数据给前端）

var s0={};var s2={};var s1={};var s3={};s0.specialType=false;s0.nickName="ykt1470896205995";s0.smallFaceUrl=null;s0.memberId=1019177004;s0.study=s2;
s2.certCount=0;s2.couponCount=0;s2.courseCount=1;s2.hasAuthenticated=false;s2.orderCount=0;s2.purseId=null;s2.sumPayAmount=0.0;s2.testCount=0;
s1.specialType=false;s1.nickName="ykt1508983795932";s1.smallFaceUrl=null;s1.memberId=1032258428;s1.study=s3;
s3.certCount=0;s3.couponCount=0;s3.courseCount=1;s3.hasAuthenticated=false;s3.orderCount=0;s3.purseId=null;s3.sumPayAmount=0.0;s3.testCount=0;
dwr.engine._remoteHandleCallback('1508984099418','0',{bindStatus:false,currentAccount:s0,bindedAccount:s1});


3.2、待绑定手机号 没有学习数据：
var s0={};var s2={};var s1={};
s0.specialType=false;s0.nickName="ykt1470896205995";s0.smallFaceUrl=null;s0.memberId=1019177004;s0.study=s2;
s2.certCount=0;s2.couponCount=0;s2.courseCount=1;s2.hasAuthenticated=false;s2.orderCount=0;s2.purseId=null;s2.sumPayAmount=0.0;s2.testCount=0;
s1.specialType=false;s1.nickName="ykt1508983795932";s1.smallFaceUrl=null;s1.memberId=1032258428;
dwr.engine._remoteHandleCallback('1508984099474','0',{bindStatus:false,currentAccount:s0,bindedAccount:s1});

弹窗提示： 该手机帐号注册过云课堂，确认将其绑定至当前登录帐号？


3.3、二个账号都没有学习数据
var s0={};var s1={};s0.specialType=false;s0.nickName="ykt1470896205995";s0.smallFaceUrl=null;s0.memberId=1019177004;
s1.specialType=false;s1.nickName="ykt1508983795932";s1.smallFaceUrl=null;s1.memberId=1032258428;
dwr.engine._remoteHandleCallback('1508984099482','0',{bindStatus:false,currentAccount:s0,bindedAccount:s1});

弹窗提示： 该手机帐号注册过云课堂，确认将其绑定至当前登录帐号？


4、 两个账号都已经绑定了 member，做账号绑定
BindAccountBean.changeBindMember(Long memberId)
	return bindAccountLogic.changeBindMember(WebUser.getUserId(),WebContextFactory.get().getHttpServletRequest());
		
		LoginAccount currentAccount = getCurrentAccount();	// 从cookie 中取当前账号 和 待绑定账号信息
        LoginAccount bindedAccount = getBindedAccount();
        ...
        boolean selectCurrent = memberId.equals(currentAccount.getBindingMemberId());
        return changeBindMember(request, bindMemberData, currentAccount, bindedAccount, selectCurrent);
        	validateLearnRecord(bindMemberData);	// 校验待绑定账号 是否有学习数据，有的话 则绑定失败异常；
        	validateSpecialAccount(bindMemberData, selectCurrent);	// 校验待绑定账号 是否是特殊权限， 是的话绑定失败异常；

        	askCouldUnbindMember(selectCurrent ? bindedAccount : currentAccount);	// 校验是否可以解绑 待绑定账号

        	if (selectCurrent) {
            nickName = doBindMember(currentAccount.getLoginId(), currentAccount.getLoginType(),
                bindedAccount.getLoginId(), bindedAccount.getLoginType(), currentAccount.getBindingMemberId(),
                bindedAccount.getBindingMemberId(), selectCurrent,request);
        } else {
        	...
        }


******************************************************** 接口

1、下单页 已绑定的手机号码：
/order/confirm.htm
WebUser.nickName
model 回填：  bindCellphoneNumber  

2、订单列表：（优先显示手机账号）
http://study.163.com/dwr/call/plaincall/BizOrderBean.getMySellesOrderList.dwr



********** 账号绑定

1、发送验证码：【复用】
https://study.163.com/passport/cellphone/v2/sendValidationCode.htm
params:emtGNW5HdkhuSHI5UExSRnJLbXdKTmdvcjU3eXhhdU8zQzNlVW5FOWl3RXF4a3I0UHFBaXJiN0l1V3BMTFlBNmRmeEJjK3VUT01YbUQ5S3lRQjNOT2Fiblp6aDVLT09DbVYvbzM1SzlRaEoxZXRnYVZTa0pQSUNhWmRaaWtjYnM3NFZhVDNMdFpnME1yL00wS0lLMHhOai9obXlUZEdXUEF4ZjFZck12eUVYaER2MXIxQ21ENFN3dmg0RFhYU0Rz
bizType:reg
mobile:13732226115

{"code":0,"message":"发送成功"}

改动： 新增 bizType: bind


1.2、校验验证码：【复用】
https://study.163.com/passport/cellphone/validateRegisterCondition.htm
mobile:18795959175
validationCode:6244


2、完成绑定 【新增 controller】
https://study.163.com/passport/cellphone/regAndBindCallback.htm



【问题】

1、点击“发送验证码”后，前端触发：1.1 - 1.3请求；
2、点击“完成绑定”：
2.1 校验验证码；不通过，报错；
校验通过：

2.2 
if（用户所输入的手机号未注册）{
	addOrUpdateAppPassport；
	写cookie；
	bindMember;	// 新手机号，手机号 和 当前登陆方式 都绑定到 该member；
	return  true;
} else {		// 用户所输入的手机号已经注册
	帮用户更新密码;
	完成绑定;		// 已注册手机号，判断 账号学习数据，loginAccount 绑定到 规则所选memberId；
}


账号绑定规则：

都没有学习数据：
	支持绑定；		【问题】什么操作？ 
	手机号绑定到当前member，（手机号对应的 memberId丢弃掉），保持当前member的用户信息；
账号A 有学习数据 || 账号B 有学习数据：
	支持绑定；
	切换到 有学习数据的账号；  最终效果是： 没有学习数据的 memberId 丢弃掉； 两个登录账号 都绑定到 有学习数据的memberId；
（账号A 和 账号B 都有学习数据） ||（手机号已被注册 && 手机号对应 memberId 还绑定了 与当前登录用户登录类型 相同的登录账号）
	什么都不做，return 手机账号信息（占用）；
	提示用户切换到手机号对应的member下单；







http://study.163.com/dwr/call/plaincall/MemberBean.getMemberInfo.dwr




MemcacheSessionManager.invalidateSession();
MemcacheSessionManager.invalidateUserInfoCache(currentAccount.getBindingMemberId());
NeteaseEduCookieManager.logout(request, response, true, true);

LoginGateController


NeteaseEduCookieManager.logout(HttpServletRequest request, HttpServletResponse response, boolean isMock,
                              boolean onlyCookie)





 
当前 									待绑定

微博账号登录 + 有学习数据：  				邮箱账号 + 有学习数据        		提示手动切换
微博账号登录 + 无学习数据 					邮箱账号 + 有学习数据 				自动切换到绑定账号，当前账号登出，绑定账号登录，一切ok

FRKWR7



一、未注册手机号
CellphoneLoginController

1.1、输入手机号
https://study.163.com/passport/cellphone/isMobileExist.htm

1.2、
https://study.163.com/passport/cellphone/needVerifyCode.htm

1.3、
https://study.163.com/passport/cellphone/getEncryptKey.htm

1.4、发送验证码
https://study.163.com/passport/cellphone/v2/sendValidationCode.htm


2.1、校验验证码
https://study.163.com/passport/cellphone/validateRegisterCondition.htm

2.2、注册app_passport之后 重定向  （手机号未被注册的时候走这个请求， 注册并做绑定）
https://study.163.com/passport/cellphone/regAndBindCallback.htm?validationCode=6244&mobile=18795959175&password=327e6bb9b81460c4f447b0eac8ef984c&returnUrl=Ly9zdHVkeS4xNjMuY29t


// MemberController 【study-platform】
2.3、https://study.163.com/member/bindCallback.htm?success=true&loginType=30&returnUrl=Ly9zdHVkeS4xNjMuY29t&success=true&loginType=30


// BindAccountBean【study-platorm】
3、注册并自动绑定账号 
http://study.163.com/dwr/call/plaincall/BindAccountBean.getBindMemberData.dwr



二、已注册手机号
CellphoneLoginController

1.1、输入手机号
https://study.163.com/passport/cellphone/isMobileExist.htm

true

1.2、输入手机号 + 密码
点击“完成绑定”：
https://study.163.com/passport/cellphone/validateLoginCondition.htm
mobile:13732226115
password:8057a9ae62d782d115be8019d5520265


// BindAccountBean 【study-platorm】
2、账号绑定
http://study.163.com/dwr/call/plaincall/BindAccountBean.getBindMemberData.dwr
	弹窗提示： 绑定失败，...请绑定其他帐号。（返回2个账号的学习数据给前端）
	弹窗提示： 该手机帐号注册过云课堂，确认将其绑定至当前登录帐号？  【点击确定，走3 真正绑定和解绑】

// BindAccountBean 【study-platorm】
3、真正账号绑定 和 解绑
BindAccountBean.changeBindMember(Long memberId)


课程索引里 只有前台类目； 
目前有2种方式：
1、课程直接和前台类目关联
2、课程和后台类目关联，后台类目 和前台类目关联，所以 导致 课程间接 和前台类目有关联关系；
创建课程索引的时候，只会 取课程关联的 前台类目id，但是 会合并直接关联和间接关联这两种情况的 前台类目 到索引字段；





老的发 v2 的地方，以前发送 v2 ，是需要图片验证码的； 现在 会统一改成 V3，那 V3 中需要兼容以前的 v2处理；





ssh -i ~/.ssh/id_rsa -p1046 hzweiwei2015@10.165.124.82 -L 18363:127.0.0.1:18363 -N


ssh -i /Users/weiwei/.ssh/id_rsa -p1046 hzweiwei2015@10.165.124.82 -L 18363:127.0.0.1:18363 -N

/Users/weiwei/work/program_tools/id_rsa_bac


ssh -i /Users/weiwei/work/program_tools/id_rsa_bac/ykt-work-ssh(windows)/id_rsa -p1046 hzweiwei2015@10.165.124.82 -L 18363:127.0.0.1:18363 -N

/Users/weiwei/work/program_tools/id_rsa_bac/ykt-work-ssh(windows)





		





