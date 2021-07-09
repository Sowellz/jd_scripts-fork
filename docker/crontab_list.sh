#燃动夏季脚本更新_做任务
12 0,6-23/2 * * * wget -O /scripts/jd_summer_movement.js https://raw.githubusercontent.com/smiek2221/scripts/master/jd_summer_movement.js
#燃动夏季脚本更新_助力
12 7-23 * * * wget -O /scripts/jd_summer_movement_help.js https://raw.githubusercontent.com/smiek2221/scripts/master/jd_summer_movement_help.js

# 默认定时任务
52 */1 * * * docker_entrypoint.sh |ts >> /scripts/logs/default_task.log 2>&1
# 每3天的23:50分清理一次日志(互助码不清理，proc_file.sh对该文件进行了去重)
50 23 */3 * * find /scripts/logs -name '*.log' | grep -v 'sharecodeCollection' | xargs -i rm -rf {}
# 收集助力码
30 * * * * sh /scripts/docker/auto_help.sh collect |ts >> /scripts/logs/auto_help_collect.log 2>&1

##############短期活动##############
# 京东零食街
0 11 * * * node /scripts/jd_lsj.js >> /scripts/logs/jd_lsj.log 2>&1
# 燃动夏季
12 9,11,13,15,17 * * * node /scripts/jd_summer_movement.js >> /scripts/logs/jd_summer_movement.log 2>&1
#来客有礼小程序 送豆得豆
45 4 * * * node /scripts/jd_senbeans.js >> /scripts/logs/jd_senbeans.log 2>&1

# 女装盲盒 活动时间：2021-05-24到2021-06-22
35 1,22 * * * node /scripts/jd_nzmh.js |ts >> /scripts/logs/jd_nzmh.log 2>&1
# 京东极速版红包(活动时间：2021-6-1至2021-6-30)
45 0,23 * * * node /scripts/jd_speed_redpocke.js |ts >> /scripts/logs/jd_speed_redpocke.log 2>&1
# 超级直播间红包雨(活动时间不定期，出现异常提示请忽略。红包雨期间会正常)
# 1,31 0-23/1 * * * node /scripts/jd_live_redrain.js |ts >> /scripts/logs/jd_live_redrain.log 2>&1
# 环球挑战赛 第三季(活动时间：2021-04-28 至 2021-05-28)
35 6,22 * * * node /scripts/jd_global.js >> /scripts/logs/jd_global.log 2>&1
# 每日抽奖(活动时间：2021-05-01至2021-05-31)
13 1,22,23 * * * node /scripts/jd_daily_lottery.js |ts >> /scripts/logs/jd_daily_lottery.log 2>&1
# 金榜创造营 活动时间：2021-05-21至2021-12-31
0 1,22 * * * node /scripts/jd_gold_creator.js |ts >> /scripts/logs/jd_gold_creator.log 2>&1
# 5G超级盲盒(活动时间：2021-06-2到2021-07-31)
0 0-23/4 * * * node /scripts/jd_mohe.js |ts >> /scripts/logs/jd_mohe.log 2>&1
# 酷跑零食街
18 7,12,20 * * * node /scripts/jd_foodRunning.js |ts >> /scripts/logs/jd_foodRunning.log 2>&1
#翻翻乐
1 0-23/1 * 6 * node /scripts/jd_flipcards.js >> /scripts/logs/jd_flipcards.log 2>&1
#京享值pk
15 0,6,13,19,21 * 6 * node /scripts/jd_pk.js >> /scripts/logs/jd_pk.log 2>&1
#限时盲盒
30 7,19 1-18 6 * node /scripts/jd_limitBox.js >> /scripts/logs/jd_limitBox.log 2>&1
#京喜牧场
20 0-23/3 * * * node /scripts/jd_jxmc.js >> /scripts/logs/jd_jxmc.log 2>&1
#京喜领红包
1 5,20 * 6 * node /scripts/jd_jxlhb.js >> /scripts/logs/jd_jxlhb.log 2>&1
#东东电竞经理
47 10 * * * node /scripts/jd_djjl.js >> /scripts/logs/jd_djjl.log 2>&1
# 环球挑战赛 第三季(活动时间：2021-04-28 至 2021-05-28)
35 6,22 * * * node /scripts/jd_global.js >> /scripts/logs/jd_global.log 2>&1
#jd_shoplottery
10 15 * * * node /scripts/jd_shoplottery.js >> /scripts/logs/jd_shoplottery.log 2>&1
# jd_super_redrain
0 0,1-23/1 * * * node /scripts/jd_super_redrain.js >> /scripts/logs/jd_super_redrain.log 2>&1
# jd_half_redrain
30 0,1-23/1 * * * node /scripts/jd_half_redrain.js >> /scripts/logs/jd_half_redrain.log 2>&1
#jd_daily_lottery
13 1,22,23 * * * node /scripts/jd_daily_lottery.js >> /scripts/logs/jd_daily_lottery.log 2>&1
#jd_beauty
1 7,12,19 * * * node /scripts/jd_beauty.js >> /scripts/logs/jd_beauty.log 2>&1
#金榜创造营
40 9,21 * * * node /scripts/jd_gold_creator.js >> /scripts/logs/jd_gold_creator.log 2>&1
#新潮品牌狂欢
30 9,10 1-18 6 * node /scripts/jd_mcxhd_brandcity.js >> /scripts/logs/jd_mcxhd_brandcity.log 2>&1
#品牌狂欢城
30 10 1-18 6 * node /scripts/jd_brandcarnivalcity.js >> /scripts/logs/jd_brandcarnivalcity.log 2>&1

##############长期活动##############
# 签到
7 0,17 * * * cd /scripts && node jd_bean_sign.js |ts >> /scripts/logs/jd_bean_sign.log 2>&1
# 东东超市兑换奖品
59 23 * * * node /scripts/jd_blueCoin.js |ts >> /scripts/logs/jd_blueCoin.log 2>&1
# 摇京豆
6 0,23 * * * node /scripts/jd_club_lottery.js |ts >> /scripts/logs/jd_club_lottery.log 2>&1
# 东东农场
15 6-18/6 * * * node /scripts/jd_fruit.js |ts >> /scripts/logs/jd_fruit.log 2>&1
# 宠汪汪
45 */2,23 * * * node /scripts/jd_joy.js |ts >> /scripts/logs/jd_joy.log 2>&1
# 宠汪汪积分兑换京豆
59 7,15,23 * * * node /scripts/jd_joy_reward.js |ts >> /scripts/logs/jd_joy_reward.log 2>&1
# 宠汪汪喂食
35 */1 * * * node /scripts/jd_joy_feedPets.js |ts >> /scripts/logs/jd_joy_feedPets.log 2>&1
# 宠汪汪偷好友积分与喂食
10 0-21/3 * * * node /scripts/jd_joy_steal.js |ts >> /scripts/logs/jd_joy_steal.log 2>&1
# 宠汪汪邀请助力
10 13-20/1 * * * node /scripts/jd_joy_run.js |ts >> /scripts/logs/jd_joy_run.log 2>&1
# 摇钱树
23 */2 * * * node /scripts/jd_moneyTree.js |ts >> /scripts/logs/jd_moneyTree.log 2>&1
# 东东萌宠
35 6-18/6 * * * node /scripts/jd_pet.js |ts >> /scripts/logs/jd_pet.log 2>&1
# 京东种豆得豆
10 7-22/1 * * * node /scripts/jd_plantBean.js |ts >> /scripts/logs/jd_plantBean.log 2>&1
# 京东全民开红包
12 0-23/4 * * * node /scripts/jd_redPacket.js |ts >> /scripts/logs/jd_redPacket.log 2>&1
# 进店领豆
6 0 * * * node /scripts/jd_shop.js |ts >> /scripts/logs/jd_shop.log 2>&1
# 东东超市
31 0,1-23/2 * * * node /scripts/jd_superMarket.js |ts >> /scripts/logs/jd_superMarket.log 2>&1
# 取关京东店铺商品
45 */6 * * * node /scripts/jd_unsubscribe.js |ts >> /scripts/logs/jd_unsubscribe.log 2>&1
# 京豆变动通知
20 10 * * * node /scripts/jd_bean_change.js |ts >> /scripts/logs/jd_bean_change.log 2>&1
# 京东抽奖机
0 0,12,23 * * * node /scripts/jd_lotteryMachine.js |ts >> /scripts/logs/jd_lotteryMachine.log 2>&1
# 京东排行榜
21 9 * * * node /scripts/jd_rankingList.js |ts >> /scripts/logs/jd_rankingList.log 2>&1
# 天天提鹅
28 * * * * node /scripts/jd_daily_egg.js |ts >> /scripts/logs/jd_daily_egg.log 2>&1
# 金融养猪
32 0-23/6 * * * node /scripts/jd_pigPet.js |ts >> /scripts/logs/jd_pigPet.log 2>&1
# 京喜工厂
50 * * * * node /scripts/jd_dreamFactory.js |ts >> /scripts/logs/jd_dreamFactory.log 2>&1
# 东东小窝
33 6,23 * * * node /scripts/jd_small_home.js |ts >> /scripts/logs/jd_small_home.log 2>&1
# 东东工厂
26 * * * * node /scripts/jd_jdfactory.js |ts >> /scripts/logs/jd_jdfactory.log 2>&1
# 赚京豆(微信小程序)
12 * * * * node /scripts/jd_syj.js |ts >> /scripts/logs/jd_syj.log 2>&1
# 京东快递签到
47 1 * * * node /scripts/jd_kd.js |ts >> /scripts/logs/jd_kd.log 2>&1
# 京东汽车(签到满500赛点可兑换500京豆)
0 0 * * * node /scripts/jd_car.js |ts >> /scripts/logs/jd_car.log 2>&1
# 领京豆额外奖励(每日可获得3京豆)
23 1,12,22 * * * node /scripts/jd_bean_home.js |ts >> /scripts/logs/jd_bean_home.log 2>&1
# 微信小程序京东赚赚
6 0-5/1,11 * * * node /scripts/jd_jdzz.js |ts >> /scripts/logs/jd_jdzz.log 2>&1
# 京东汽车旅程赛点兑换金豆
0 0 * * * node /scripts/jd_car_exchange.js |ts >> /scripts/logs/jd_car_exchange.log 2>&1
# 导到所有互助码
23 7 * * * node /scripts/jd_get_share_code.js |ts >> /scripts/logs/jd_get_share_code.log 2>&1
# 口袋书店
20 8,12,18 * * * node /scripts/jd_bookshop.js |ts >> /scripts/logs/jd_bookshop.log 2>&1
# 京喜农场
30 9,12,18 * * * node /scripts/jd_jxnc.js |ts >> /scripts/logs/jd_jxnc.log 2>&1
# 签到领现金
10 */4 * * * node /scripts/jd_cash.js |ts >> /scripts/logs/jd_cash.log 2>&1
# 闪购盲盒
47 8,22 * * * node /scripts/jd_sgmh.js |ts >> /scripts/logs/jd_sgmh.log 2>&1
# 京东秒秒币
10 6,21 * * * node /scripts/jd_ms.js |ts >> /scripts/logs/jd_ms.log 2>&1
# 美丽研究院
30 8,13,20 * * * node /scripts/jd_beauty.js |ts >> /scripts/logs/jd_beauty.log 2>&1
# 京东保价
41 0,23 * * * node /scripts/jd_price.js |ts >> /scripts/logs/jd_price.log 2>&1
# 京东价格保护
10 0 */3 * *  node /scripts/jd_priceProtect.js >> /scripts/logs/jd_priceProtect.log 2>&1
# 京东极速版
48 0,12,18 * * *  node /scripts/jd_speed_sign.js >> /scripts/logs/jd_speed_sign.log 2>&1
# 京东抽奖机
22 0,12,18 * * *  node /scripts/jd_lotteryMachine.js >> /scripts/logs/jd_lotteryMachine.log 2>&1
# 京东极速版签到+赚现金任务
21 1,6 * * * node /scripts/jd_speed_sign.js |ts >> /scripts/logs/jd_speed_sign.log 2>&1
# 京喜财富岛
5 7,12,18 * * * node /scripts/jd_cfd.js |ts >> /scripts/logs/jd_cfd.log 2>&1
# 京喜财富岛提现
0 0 * * *  node /scripts/jx_cfdtx.js >> /scripts/logs/jx_cfdtx.log 2>&1
# 删除优惠券(默认注释，如需要自己开启，如有误删，已删除的券可以在回收站中还原，慎用)
# 20 9 * * 6 node /scripts/jd_delCoupon.js |ts >> /scripts/logs/jd_delCoupon.log 2>&1
# 家庭号
30 6,15 * * * node /scripts/jd_family.js |ts >> /scripts/logs/jd_family.log 2>&1
# 京东直播（又回来了）
30-50/5 12,23 * * * node /scripts/jd_live.js |ts >> /scripts/logs/jd_live.log 2>&1
# 京东健康社区
13 1,6,22 * * * node /scripts/jd_health.js |ts >> /scripts/logs/jd_health.log 2>&1
# 京东健康社区收集健康能量
5-45/20 * * * * node /scripts/jd_health_collect.js |ts >> /scripts/logs/jd_health_collect.log 2>&1
# 幸运大转盘
10 10,23 * * * node /scripts/jd_market_lottery.js |ts >> /scripts/logs/jd_market_lottery.log 2>&1
# 领金贴
5 0 * * * node /scripts/jd_jin_tie.js |ts >> /scripts/logs/jd_jin_tie.log 2>&1
# 跳跳乐瓜分京豆
15 0,12,22 * * * node /scripts/jd_jump.js |ts >> /scripts/logs/jd_jump.log 2>&1
# 京喜牧场
15 0-23/3 * * * node /scripts/jd_jxmc.js |ts >> /scripts/logs/jd_jxmc.log 2>&1
# 点点券
10 0,1,20 * * * node /scripts/jd_necklace.js |ts >> /scripts/logs/jd_necklace.log 2>&1
# 京小鸽
30 2,20 * * * node /scripts/jd_jxg.js |ts >> /scripts/logs/jd_jxg.log 2>&1
# 天天加速
30 12 * * * node /scripts/jd_speed.js |ts >> /scripts/logs/jd_speed.log 2>&1
# 电竞经理
30 3,12,22 * * * node /scripts/jd_esManager.js |ts >> /scripts/logs/jd_esManager.log 2>&1
# 送豆得豆
24 0 * * * node /scripts/jd_sendBeans.js |ts >> /scripts/logs/jd_sendBeans.log 2>&1
# 京东摇一摇
0 1,17 * * *   node /scripts/jd_shake.js >> /scripts/logs/jd_shake.log 2>&1
# 店铺签到
0 1,17 * * *   node /scripts/jd_ShopSign.js >> /scripts/logs/jd_ShopSign.log 2>&1
# 欧洲杯签到
55 59 9  * * * node /scripts/jd_europeancup.js >> /scripts/logs/jd_europeancup.log 2>&1
#东东电竞经理
0 0-23/2 * * * node /scripts/jd_EsportsManager.js >> /scripts/logs/jd_EsportsManager.log 2>&1
#星系牧场
30 7 * * * node /scripts/jd_qqxing.js >> /scripts/logs/jd_qqxing.log 2>&1
#京喜签到
5 0 * * * node /scripts/jd_jx_sign.js >> /scripts/logs/jd_jx_sign.log 2>&1