<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rule15.aspx.cs" Inherits="WeiXinCqe.rule15" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>腿夹球接力比赛规则</title>
    <link rel="stylesheet" href="/style/weui.css" />
    <style type="text/css">
        .style1
        {
            padding: 14px 15px 10px;
            color: #333333;
            font-size: 13px;
            position: relative;
            text-align: center;
        }
        .style2
        {
            text-decoration: underline;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="weui_panel">
            <div class="style1" style="font-size: large; font-weight: bold;">
                腿夹球接力比赛规则</div>
            <div class="weui_panel_bd">
                <div class="weui_media_box weui_media_text">
                    <h4 class="weui_media_title">
                        1. 报名：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        各部门选手向本部门领队报名，每队参赛4 人，男女各2 人。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        选手需在本规则后签字，以示充分理解并认可比赛规则。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        各队报名时，应指定队长1 人。</p>
                    <br />
                    <h4 class="weui_media_title">
                        2. 物资：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        发令枪1 把、塑身球8 个,终点绳1 条。</p>
                    <br />
                    <h4 class="weui_media_title">
                        3. 裁判：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        起点/终点1 名、接力区3 名。</p>
                    <br />
                    <h4 class="weui_media_title">
                        4. 工作人员：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        道具管理担当1 名。</p>
                    <br />
                    <h4 class="weui_media_title">
                        5. 比赛分组、赛道：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        各参赛队领队于10 月13 日下午3:10 到总务部抽签确定赛道。</p>
                    <br />
                    <h4 class="weui_media_title">
                        6. 检录：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        6.1 运动员须按广播指示的时间，按附图1 所示路线前往检录处进行登记。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        6.2 超时未检录者不计比赛成绩。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        6.3 检录后按指示列队，并跟随引导员进入比赛场地指定位置。</p>
                    <br />
                    <h4 class="weui_media_title">
                        7. 竞赛：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.1 运动员须按第5 条确定的分组及赛道参赛，否则不计比赛成绩。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.2 运动员须按登记的身份参赛，顶替参赛者不计比赛成绩。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.3 运动员须服从裁判员指令，不服从裁判员指挥者取消比赛成绩。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.4 运动员需将球放在两腿之间夹住，出发后可跳可走，如途中球脱离身体须在落球处 把球捡起夹好后继续比赛(可以用双手捡球）。运球时，双手必须放至身体两侧， 不可用手扶球。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.5 一组比赛只允许抢跑（未发令起跑）1 次，发生抢跑现象时，裁判员中止比赛，重 新发令。一组比赛发生2 次（含2 次）以上抢跑时，无论抢跑者是否与之前抢跑者
                        为同一人，取消本次抢跑者比赛资格，裁判员中止比赛，重新发令。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.6 各赛道运动员不得侵占其他赛道。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.7 任何人掉了球，必须由其本人拾回，而且要在不影响别人的情况下，方可越出自己 的跑道拾回接力棒。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.8 所有接力赛事，必须在接力区内完成交接，否则取消比赛成绩。</p>
                    <br />
                    <h4 class="weui_media_title">
                        8. 成绩：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        8.1 比赛不计时间，由终点裁判员宣布各赛道选手的比赛名次。参赛选手对比赛结果 无异议后，由每队的最后一棒成员确认成绩并在《比赛结果统计表》（附表1）签 名。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        8.2 比赛结果仅可改判1 次，改判后不再受理相关申诉。</p>
                    <br />
                    <h4 style="font-weight: normal; text-align: right;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 部门：<span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</span></h4>
                    <h4 style="font-weight: normal; text-align: right;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 运动员：<span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</span></h4>
                    <br />
                    <h4 class="weui_media_title">
                        附表1
                    </h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <img alt="" src="151.png" width="99%" /></p>
                    <br />
                    <h4 class="weui_media_title">
                        附图1
                    </h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <img alt="" src="152.png" width="99%" /></p>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
