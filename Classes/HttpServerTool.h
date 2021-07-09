//
//  PrefixHeader.pch
//  EverydayLyrical
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019年 杨风波. All rights reserved.
//

#ifndef HttpTool_pch
#define HttpTool_pch

#pragma  mark  -------------    工具类    --------------

////隐私条款地址----测试
//测试            /?type=partnerRecruitment  //更改
//#define HttpURLString @"http://192.168.0.153:9999"
//#define HttpURLString @"http://192.168.0.155:9999"
#define HttpURLString @"http://183.131.134.242:10167/api"
//隐私条款地址----测试
#define WebfuwuString @"http://183.131.134.242:10173/?type=agreement"
#define WebyinsiString @"http://183.131.134.242:10173/?type=privacy"
#define WebURLString @"http://183.131.134.242:10173/?"


//#define HttpURLString @"https://admin.wecan.vip/api"
////隐私条款地址----正式
//#define WebfuwuString @"https://h5.wecan.vip/?type=agreement"
//#define WebyinsiString @"https://h5.wecan.vip/?type=privacy"
////网页地址
//#define WebURLString @"https://h5.wecan.vip/?"

#define URL(str) [HttpURLString stringByAppendingString:str]

#pragma mark -------------  登录  -------------
#define HicityTokenMobile            URL(@"/auth/mobile/token/sms") //登录
#define HicityWxLogin                URL(@"/auth/mobile/token/social?mobile=WX@") //登录
#define HicityAdminMobile            URL(@"/admin/mobile/")         //短信发送
#define HicityOpenHot_city           URL(@"/admin/open/hot_city")   //热门城市

#pragma mark ===============================  搜索  ==================================
#define HicitySearch_user_org        URL(@"/admin/open/search_user_org") //搜索
#define HicitySearch_user            URL(@"/admin/open/search_user") //搜索用户
#define HicitySearch_org             URL(@"/admin/open/search_org") //搜索圈子


#define HicityTravelSearch_list         URL(@"/cms/travel/mobile/search_list")        //游记列表-搜索
#define HicityHeated_debateSearch_list  URL(@"/cms/heated_debate/mobile/search_list")        //热议列表-搜索
#define HicityRecruitPage_manage        URL(@"/dms/open/recruit/page")        //岗位分页列表(无城市区分)
#define HicityActivity_publish_page     URL(@"/dms/activity_publish/search/activity_page")        //活动分页查询-搜索
#define HicityOfficial_newsSearch       URL(@"/cms/open/search/official_news")        //资讯分页查询（普通用户-搜索）（官方新闻）
#define HicityNewsSearch                URL(@"/cms/open/news_search")        //资讯分页查询(普通用户)(热门新闻)-搜索

#pragma mark ===============================  个人中心  ==================================
#define HicityUserstyle_page        URL(@"/admin/open/style_page")   //用户风采页数据
#define HicityUser_detatils         URL(@"/admin/app/user/user_detatils")   //用户详情数据(我的-页面数据)


#define HicityPersonal_personal_list        URL(@"/cms/heated_debate/mobile/personal_list")   //个人风采页热议列表
#define HicityPersonal_styleList            URL(@"/cms/travel/personal_style/page_list")   //个人风采页游记列表)
#define HicityPersonal_CommentPage_list     URL(@"/cms/personal_style/comment/page_list")   //个人风采页评论列表
#define HicityPersonal_heated_debate_delete URL(@"/cms/heated_debate/delete/")   //热议删除

#define HicityUser_info             URL(@"/admin/app/user/user_info")    //登录用户个人信息
#define HicityUserUpdate_info       URL(@"/admin/app/user/update_info")  //更新用户基础信息
#define HicityUserWork_create       URL(@"/admin/app/user/work_create")  //工作经历-新增
#define HicityUserwork_update       URL(@"/admin/app/user/work_update")  //工作经历-修改
#define HicityUserWork_list         URL(@"/admin/open/work_list")    //工作经历-列表
#define HicityUserWork_del          URL(@"/admin/app/user/work_del")     //工作经历-删除（可批量）
#define HicityUserWork_tag          URL(@"/tms/relation/get_work_tags")  //工作经历-标签
#define HicityUserEdu_tag           URL(@"/tms/relation/get_teach_tags") //教育经历-标签

#define HicityUserTeach_create       URL(@"/admin/app/user/teach_create")//教育经历-新增
#define HicityUserTeach_update       URL(@"/admin/app/user/teach_update")//教育经历-更新
#define HicityUserTeach_list         URL(@"/admin/open/teach_list")  //教育经历-列表
#define HicityUserTeach_del          URL(@"/admin/app/user/teach_del")   //教育经历-删除（可批量）

/*************** 我的关注  */
#define HicityFollowPage            URL(@"/admin/follow/page")        //获取关注列表-分页
/*************** 我的关注  */
#define HicityFollowFans_page       URL(@"/admin/follow/fans_page")  //粉丝列表-分页


#pragma mark ===============================  首页 ==================================
#define HicityOpenModule            URL(@"/admin/open/module")       //获取模块

/*************** 头条  */
#define HicityOpenOfficial_home     URL(@"/cms/open/official_home")  //资讯分页信息查询（官方新闻）（首页中列）
#define HicityOpenOfficial_column   URL(@"/cms/open/official_column")//资讯栏目查询（官方新闻）
#define HicityOpenOfficial_news     URL(@"/cms/open/official_news")  //资讯分页查询（普通用户）（官方新闻）
#define HicityOpenOfficial_details  URL(@"/cms/open/official_details")//资讯管理-资讯详情(官方)
#define HicityOpenOfficial_label  URL(@"/cms/open/label/news_page")//资讯管理-资讯详情(官方)
/*************** 首页广告  */
#define HicityInfo_adList           URL(@"/cms/open/info_ad/list")               //通过城市和广告位编码查询广告

/*************** 活动  */
#define HicityActivity_home                 URL(@"/dms/activity_publish/activity_home/")//活动首页app端
#define HicityActivitie_page                URL(@"/dms/activity_publish/activity_page") //活动分页查询
#define HicityActivity_detial               URL(@"/dms/open/activity_publish/details_activity?")//活动详情
#define HicityActivity_activity_ticketing   URL(@"/dms/activity_publish/activity_ticketing?")//选择票种接口
#define HicityActivity_Get_form_config      URL(@"/dms/conference_config/get_form_config")//活动自定义表单数据获取
#define HicityActivity_Get_contacts_simple  URL(@"/dms/conference_enrole_form/contacts_simple")//活动自定义表单数据获取
#define HicityActivity_Post_create          URL(@"/dms/conference_enrole_form/all/create")//活动报名创建订单
#define HicityActivity_my_enrole_form       URL(@"/dms/conference_enrole_form/page")//报名列表-我的
#define HicityActivity_my_contacts_info     URL(@"/dms/conference_enrole_form/contacts_info")//联系人详细信息
#define HicityActivity_my_page              URL(@"/dms/conference_enrole_form/my/acticity_page")//新版我的活动
#define HicityActivity_sign_in_code         URL(@"/dms/conference_enrole_form/sign_in_code")//查询报名签到码
#define HicityActivity_scan_code            URL(@"/dms/conference_enrole_form/write_off/scan_code")//扫码核销签到码
//#define HicityActivity_contacts_by_enrole     URL(@"/dms/conference_enrole_form/contacts_by_enrole/page")//报名联系人信息(分页)
#define HicityActivity_contacts_by_enrole   URL(@"/dms/conference_enrole_form/get/enrole_by/tickek_id")//报名联系人信息(分页)
#define HicityActivity_contacts_simple      URL(@"/dms/conference_enrole_form/contacts_simple")//联系人简易列表（自定义表单）
#define HicityActivity_enrole_order         URL(@"/dms/conference_enrole_form/enrole_order")//签到信息查询
#define HicityActivity_frequent_contacts_select_by_id   URL(@"/dms/activity_frequent_contacts/select_by_id")//查询常用联系人
#define HicityActivity_frequent_contacts_delete         URL(@"/dms/activity_frequent_contacts/delete")//删除常用联系人

#define HicityActivity_conference_enrole_form_cancel         URL(@"/dms/conference_enrole_form/get/activity_id/cancel")//小程序签到


#define HicityActivity_Activity_distribution_relation         URL(@"/dms/activity_distribution_relation/create")//点击报名记录分销信息--分销
#define HicityActivity_Activity_distribution    URL(@"/dms/open/activity_distribution/create")//活动分享--分销

/*************** 消费通  */
#define HicityBrand_classificationList      URL(@"/mms/brand_classification/mobile/list")//消费通页面列表
#define HicityBrand_Urban_welfare           URL(@"/mms/open/store/mobile/urban_welfare")//根据定位获取就近店铺品牌信息

/*************** 领劵  */
#define HicityCouponsBusinesspage           URL(@"/mms/app/coupons/city/business/page")//当前城市全部商户券分页
#define NewHicityCouponsBusinesspage        URL(@"/mms/open/coupons/home/page")//当前城市全部商户券分页



//#define HicityCouponsSelectbusiness     URL(@"/mms/app/coupons/select/business")    //商户券置顶列表
#define NewHicityCouponsSelectbusiness  URL(@"/mms/open/coupons/recommend/page")    //商户券置顶列表
#define HiCityStoreDetails              URL(@"/mms/store/mobile/detail")    //商户券置顶列表
#define HiCityStoreCouponsList          URL(@"/mms/app/coupons/store/page")    //店铺券列表-分页
#define HiCityStoreCommentList          URL(@"/cms/common_comment/page")    //店铺口碑列表-分页
#define HiCitySearchCouponsPage         URL(@"/mms/open/coupons/search/page")  //券搜索/店铺搜索

#define HicityCouponsSelectplatform     URL(@"/mms/app/coupons/select/platform")    //平台券列表
#define HicityCouponsReceive            URL(@"/mms/app/coupons/receive")            //领取券
#define HicityCouponsSelect             URL(@"/mms/app/coupons/select")             //券详情
#define HicityCouponsSelectMy           URL(@"/mms/app/coupons/select/my_coupons")          //我的券列表    原接口地址 /mms/app/coupons/select/my
#define HicityCouponsClearMyQuan        URL(@"/mms/app/coupons/empty/my/invalid/coupons") //清空过期券

/*************** 城贝  */
#define HicityCowry_goods_list          URL(@"/fms/cowry_goods/mobile/list")   //花城贝商品列表-包含分类
#define HicityCowry_goods_page_list     URL(@"/fms/cowry_goods/mobile/page_list")   //城贝商品列表
#define HicityCowry_goods_detail        URL(@"/fms/cowry_goods/mobile/detail/")     //城贝商品详情
#define HicityCowry_goods_convert       URL(@"/fms/cowry_goods/convert/")     //城贝商品兑换
#define HicityCowry_flow_page_list      URL(@"/fms/cowry_flow/page_list")     //城贝账单
#define HicityCowry_task_list           URL(@"/fms/cowry_task/mobile/list")         //获取所有城贝任务
#define HicityCowry_task_cowry_task     URL(@"/fms/cowry_task/cowry_task")   //获取单个城贝任务
#define HicityCowry_task_save_record    URL(@"/fms/cowry_task/save_record/") //保存城贝任务用户记录
#define HicityCowry_task_receive_award  URL(@"/fms/cowry_task/receive_award") //城贝任务领取奖励
#define HicityCowry_account_user_amount URL(@"/fms/cowry_account/user_amount") //获取用户城贝


/*************** 就业易-标签页数据查询  */
#define PositionAbilityToTag                URL(@"/dms/open/recruit/lable_group")               //标签页数据查询
#define Position_Recruit_Create             URL(@"/dms/recruit/create")              //就业易发布岗位
#define Position_Recruit_Draft_Position     URL(@"/dms/recruit/draft_position")      //就业易岗位信息-草稿数据
#define Position_Recruit_Delete_Draft       URL(@"/dms/recruit/delete_draft")        //就业易岗位信息-删除草稿
#define Position_Recruit_Update             URL(@"/dms/recruit/update")              //就业易发布信息-编辑岗位
#define Position_Recruit_Detail             URL(@"/dms/open/recruit/detail")              //就业易发布信息-岗位详情
#define Position_Recruit_Other_Position     URL(@"/dms/recruit/other_position")      //就业易发布信息-发布的其他岗位

#define Position_Recruit_Screening_Conditions   URL(@"/dms/open/recruit/screening_conditions")  //就业易-筛选
#define Position_Recruit_Page_Manage            URL(@"/dms/recruit/page_manage")         //就业易-岗位分页列表(职位管理)
#define Position_Recruit_Position_Statistics    URL(@"/dms/recruit/position_statistics")   //就业易-岗位统计数据查询
#define Position_Recruit_Describe_Template      URL(@"/dms/open/recruit/describe_template")//就业易-岗位分页列表
#define Position_Share_Custom_Initiate          URL(@"/ims/msg/share/custom/initiate")   //就业易-立即沟通
#define Position_Recruit_Page_PositionPage      URL(@"/dms/open/recruit/page")     //就业易-岗位分页列表
#define Position_Recruit_Close                  URL(@"/dms/recruit/close")         //就业易-关闭岗位
#define Position_Recruit_Start                  URL(@"/dms/recruit/start")         //就业易-重启岗位
#define Position_Recruit_Submit_Audit           URL(@"/dms/recruit/submit_audit")  //就业易-提交岗位审核
#define Position_Recruit_Cancle_Audit           URL(@"/dms/recruit/cancel_audit")  //就业易-取消提交岗位审核
#define Position_Recruit_Communicate_User       URL(@"/dms/recruit/communicate_user")//就业易-沟通过用户列表
#define Position_Recruit_Interested_User        URL(@"/dms/recruit/interested_user") //就业易-感兴趣用户列表
#define Position_Recruit_Delete                 URL(@"/dms/recruit/delete")          //就业易-删除岗位
#define Position_Recruit_Save_Check             URL(@"/dms/recruit/save_check")            //就业易-保存查看用户风采页记录
#define Position_Recruit_Third_Position         URL(@"/admin/open/third_position")   //就业易-岗位库搜索

#pragma mark ===============================  生活  ==================================
/*************** 游记  */
#define HicityTravelPage_list           URL(@"/cms/travel/page_list")         //游记列表
#define HicityTravelDetail              URL(@"/cms/travel/detail/")           //游记详情
#define HicityTravelSave                URL(@"/cms/travel/save")               //游记新增
#define HicityTravelUpdate              URL(@"/cms/travel/update")             //游记修改
#define HicityTravelDelete              URL(@"/cms/travel/delete/")            //游记删除
#define HicityTravelClassifyPage_list   URL(@"/cms/travel/classify/page_list") //游记话题分类列表
#define HicityTravelTopicsPage_list     URL(@"/cms/travel/topics/page_list")   //游记话题列表
#define HicityTravelTopicsSave          URL(@"/cms/travel/topics/save")        //游记话题新增
#define HicityCommon_commentDelete          URL(@"/cms/common_comment/delete")  //删除评论
#define HicityComment_page                  URL(@"/cms/travel/comment_page")    //游记-评论列表-分页
#define HicityComment_official_comment_page URL(@"/cms/open/official_comment_page")   //官方资讯-评论列表-分页
#define HicityComment_news_comment_page     URL(@"/cms/open/news_comment_page")//热门资讯-评论列表-分页

/*************** 热议  */
#define HicityMobilePage                    URL(@"/cms/heated_debate/mobile/page")    //全城热议分页
#define HicityMobileDetail                  URL(@"/cms/heated_debate/mobile/detail")  //热议详情
#define HicityMobileHot_top                 URL(@"/cms/heated_debate/mobile/hot_top") //获取指定条数的热议话题
#define HicityMobileRecent_participation    URL(@"/cms/heated_debate/mobile/recent_participation") //获取指定条数的热议话题
#define HicityMobileSave                    URL(@"/cms/heated_debate/save")           //热议保存
#define HicityCommon_commentReply           URL(@"/cms/common_comment/reply")        //热议评论


#pragma mark ===============================  消息  ==================================
/*************** 圈子  */
#define HicityCircleCreate              URL(@"/admin/circle/create")        //圈子创建
#define HicityCircleUpdate              URL(@"/admin/circle/update")        //圈子更新
#define HicityCircleUpdate_nickname              URL(@"/admin/circle/update_nickname")        //圈子更新昵称
#define HicityCircleJoin_circle         URL(@"/admin/circle/join_circle")   //加入圈子
#define HicityCircleDetatil             URL(@"/admin/open/circle/detatil")  //圈子详情
#define HicityCircleList                URL(@"/admin/circle/list")          //用户圈子列表
#define HicityCircleOpenPage            URL(@"/admin/open/circle/page")     //开放圈子列表
#define HicityCircleUser_list           URL(@"/admin/circle/user_list")     //圈子用户列表
#define HicityCircleAssignment_user        URL(@"/admin/circle/assignment_user")  //转让群主
#define HicityCircleUpdate_admin        URL(@"/admin/circle/update_admin")  //设置/取消管理员
#define HicityCircleInvitationCircle    URL(@"/admin/circle/invitation_join_circle")//邀请加入圈子
#define HicityCircleKick_out            URL(@"/admin/circle/kick_out")      //踢出圈子用户（管理人员）
#define HicityCircleOut_circle          URL(@"/admin/circle/out_circle")    //退出圈子
#define HicityCircleDismiss_circle      URL(@"/admin/circle/dismiss_circle")//解散圈子

#define HicityCircleUser_apply_details  URL(@"/admin/circle/user_apply_details")//圈子申请详情（圈子开启审核后）
#define HicityCircleApply_pass          URL(@"/admin/circle/apply_pass")//圈子申请通过
#define HicityCircleApply_reject          URL(@"/admin/circle/apply_reject")//圈子申请拒绝


#define HicityFriendlist                URL(@"/admin/friend/search/list")//好友列表
#define HicityFriendpage                URL(@"/admin/friend/page")       //好友列表(分页)
#define HicityFrienddelete              URL(@"/admin/friend/delete")     //删除好友
#define HicityFriendcreate              URL(@"/admin/friend/create")     //添加好友
#define HicityFriendID                  URL(@"/admin/friend/")           //好友申请查询
#define HicityFriendpass                URL(@"/admin/friend/pass")       //同意好友申请
#define HicityFriendreject              URL(@"/admin/friend/reject")     //拒绝好友申请
#define HicityFriendAlias              URL(@"/admin/friend/alias")     //设置好友别名

#define HicityMessage_disturbingSave_message    URL(@"/ims/message_disturbing/save_message")        //消息免打扰-保存更新
#define Hicityim_info                           URL(@"/admin/app/user/im_info")        //获取聊天对象信息
#define HicityFriend_Apply                           URL(@"/admin/friend/apply/page")        //好友申请列表

#define HicityCreateNotice              URL(@"/admin/org/notice/create")       //发布通知
#define HicityUpdateNotice              URL(@"/admin/org/notice/update")       //更新通知
#define HicityNoticePage                URL(@"/admin/org/notice/page")         //通知列表
#define HicityNoticeDetatils            URL(@"/admin/org/notice/detatils")     //通知详情
#define HicityNoticeConfirm             URL(@"/admin/org/notice/confirm")      //确认通知
#define HicityNoticeStatus              URL(@"/admin/org/notice/status")       //获取用户在通知内状态
#define HicityNoticeIMconfirmList       URL(@"/admin/org/notice/not_confirm/list")  // 未确定通知-简易数据

//群相册列表
#define ORGALBUMLIST                    URL(@"/admin/org/album/list_page")

#define HicityHot_recommend             URL(@"/admin/open/circle/hot_recommend")//发现推荐
#define HicityFind_page                 URL(@"/admin/open/circle/find_page")//发现圈子
#define HicitySaveUserBlock             URL(@"/admin/block/user/save")      //拉黑好友
#define HicityDelUserBlock              URL(@"/admin/block/user/del")       //取消拉黑好友


#define HicityIMCustomShard             URL(@"/ims/msg/share/custom/share")  //自定义消息分享
#define HicityIMNewSearch_user             URL(@"/admin/app/user/stranger/search_user")  //新-按条件查找陌生人



#pragma mark ===============================  订单  ==================================
#define Hicityim_order_show     URL(@"/fms/order/show")             //订单收银台
#define Hicityim_order_wx_pay   URL(@"/fms/order/wx_pay")           //订单微信支付
#define Hicityim_order_page     URL(@"/fms/order/my/list")    //订单分页
#define Hicityim_order_detail   URL(@"/fms/order/info")           //订单详情
#define Hicityim_order_delete   URL(@"/fms/order/delete")           //订单删除
#define Hicityim_order_cancel   URL(@"/fms/order/cancel")           //订单取消
#define Hicityim_order_unpaid   URL(@"/fms/order/unpaid/list")           //亮码页面-获取未支付订单
#define Hicityim_order_success   URL(@"/fms/order/show/success")           //订单完成页面接口

#define Hicityim_payorder_sure   URL(@"/mms/app/merchant/transaction/confirm")//用户确认订单
#define Hicityim_payorder_merchant_order_detail   URL(@"/mms/store_manage/mobile/merchant_order_detail/")//APP用户端-亮码-订单确认页-基本信息
#define Hicityim_payorder_merchant_order_confirm_list   URL(@"/mms/store_manage/mobile/merchant_order_confirm_list")//APP用户端-亮码-订单确认页-优惠卷列表

#define Hicityim_payorder_merchant_order_payment_amount   URL(@"/mms/store_manage/mobile/merchant_order_payment_amount")//APP用户端-亮码-订单确认页-更新需支付金额

#define Hicityim_payorder_merchant_order_confirm URL(@"/mms/store_manage/mobile/merchant_order_confirm")//APP用户端-亮码-订单确认页-去支付

#define Hicityim_payorder_merchant_order_successful_callback URL(@"/mms/store_manage/mobile/merchant_order_successful_callback")//APP用户端-亮码-订单支付页-支付成功回调

#define Hicityim_payorder_merchant_order_successful_callback URL(@"/mms/store_manage/mobile/merchant_order_successful_callback")//APP用户端-亮码-订单支付页-支付成功回调

#define Hicityim_update_comment URL(@"/fms/order/update/comment")//更新订单评论状态

#define Hicityim_payorder_detail   URL(@"/mms/store_manage/mobile/merchant_order_success_detail")//APP用户端-亮码-支付成功详情
#define Hicitystore_order_detail   URL(@"/mms/store_order/mobile/order_detail")//我的订单-亮码二级详情

#define Hicityconference_enrole_formdetail   URL(@"/dms/conference_enrole_form/order_info")//活动订单详情（5月26版）

#pragma mark ===============================  获取推荐  ==================================
#define HicityRecommendTravel          URL(@"/cms/travel/mobile/recommend")           //推荐游记
#define HicityRecommendHeated_debate   URL(@"/cms/heated_debate/mobile/recommend")    //推荐热议
#define HicityRecommendOfficial_news   URL(@"/cms/open/official_news_recommend")      //资讯推荐（官方新闻）
#define HicityRecommendHot_label_list   URL(@"/cms/open/hot_label/list")      //资讯热门标签


#pragma mark ===============================  我的  ==================================
/**------------公共接口*/
/***************
 收藏列表-分页
    type 收藏类型 1-用户 2-圈子 3-活动 4-游记 5-热议 6-城市新闻 7-官方资讯 8-岗位 9-店铺 10-消费券
 */
#define HicityCommon_collectCollect_page URL(@"/cms/common_collect/collect_page")

/**
 关注、取消关注
    sign 关注类型(1-用户；2-组织；)
    type 关注标记(0-关注;1-取消关注)
 */
#define HicityFollowInfo          URL(@"/admin/follow/info")
/**
 收藏
    dataId 收藏数据ID
    type 收藏类型 1-用户 2-圈子 3-活动 4-游记 5-热议 6-城市新闻 7-官方资讯 8-岗位 9-店铺 10-消费券；)
 */
#define HicityCommon_collectCreate  URL(@"/cms/common_collect/create")
/**
 取消收藏
    dataId 收藏数据ID
    type 收藏类型 1-用户 2-圈子 3-活动 4-游记 5-热议 6-城市新闻 7-官方资讯 8-岗位 9-店铺 10-消费券；)
 */
#define HicityCommon_collectCancel  URL(@"/cms/common_collect/cancel")

/**
 用户点赞列表
 dataId     数据id
 type 点赞类型(1: 游记点赞, 2: 评论点赞, 3: 热议点赞, 4: 热门新闻资讯点赞,  5: 官方发布资讯点赞)
 */
#define HicityThumbs_upUsers  URL(@"/cms/thumbs_up/users")

/**
 点赞 和  取消点赞
 dataId     数据id
 type 点赞类型(1: 游记点赞, 2: 评论点赞, 3: 热议点赞, 4: 热门新闻资讯点赞,  5: 官方发布资讯点赞)
 */
#define Hicitythumbs_upcreate   URL(@"/cms/thumbs_up/create")
#define Hicitythumbs_upcancel   URL(@"/cms/thumbs_up/cancel")

/**
 发表评论
 type   数据类型 1-官方发布 2-热门新闻  3-游记 4-全城热议  5-订单评价
 dataId 数据ID
 content    评论内容
 cityId 定位城市ID
 commentAnnexes 评论附件集合
 */
#define HicityCommon_commentCreate      URL(@"/cms/common_comment/create")

/**
 评论列表
 type   数据类型 1-官方发布 2-热门新闻  3-游记 4-全城热议
 dataId 数据ID
 maxId 当前数据版本的最大id(非第一页查询 maxId 必传, maxId值是查询第一页数据时后台返回)
 sortType 排序类型 不传默认是按时间降序, 1: 代表按照顶级评论回复量降序(最热)
 */

#define HicityCommentList  URL(@"/cms/common_comment/page")
/**
 评论列表
 commentId 数据ID
 maxId 当前数据版本的最大id(非第一页查询 maxId 必传, maxId值是查询第一页数据时后台返回)
 */

#define HicityCommentReplyList  URL(@"/cms/common_comment/reply_page")

#define HicityCommentCancellation  URL(@"/admin/app/user/cancellation")


/**
 顶级评论数量
 type 1-官方发布 2-热门新闻 3-游记  4-热议
 dataId 数据id
 */

#define HicityCommenttop_num  URL(@"/cms/open/comment/top_num")



#pragma mark ===============================  举报  ==================================
/**
 举报
 prosecuteType  举报功能分类            例如：       user-用户；
                                    circle-圈子；
                                    activity-活动；
                                    travel-游记；
                                    heatedDebate-全城热议；
                                    officialNews-官方发布新闻；
                                    news-城市新闻；
                                    recruit-就业易
 prosecuteReason 举报分类 字典：PROSECUTE_REASON
                            例如：垃圾广告，黄色信息，抄袭侵权，诈骗信息，人身攻击，其他类型
 prosecuteReasonDetails     举报详细说明
 prosecuteContentId             举报内容对应id（例举报说说即存说说id）
 prosecuteContent               举报内容（例如：用户就是用户名、说说就是说说内容）
 */
#define HicityProsecuteCreate URL(@"/cms/prosecute/create") //提交举报信息


/**全局获取字典
 CIRCLE_TYPE  圈子类型

 */
#define PositionAdmin_Dict_Item             URL(@"/admin/dict/item/")                //就业易获取字典项



#pragma mark ===============================  上传图片  ==================================
#define HicityTransactionDetail  URL(@"/mms/app/merchant/transaction/detail")    //根据ID获取交易详情


#pragma mark ===============================  上传图片  ==================================

#define AppOssToken            URL(@"/admin/sys_file/oss/token?type=jpg")  //获取oss的token信息
#define AppUploadImg           URL(@"/sys_file/sftp/upload")               //图片上传



#endif /* PrefixHeader_pch */
