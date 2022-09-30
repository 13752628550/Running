<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rule14.aspx.cs" Inherits="WeiXinCqe.rule14" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>跳大绳比赛规则</title>
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
                跳大绳比赛规则</div>
            <div class="weui_panel_bd">
                <div class="weui_media_box weui_media_text">
                    <h4 class="weui_media_title">
                        1. 报名：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        各部门选手向本部门领队报名，每队参赛12 人。</p>
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
                        秒表1 个，哨子1 个、大绳4 条。</p>
                    <br />
                    <h4 class="weui_media_title">
                        3. 裁判：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        主裁判1 名，负责宣布比赛开始、计时、宣布比赛结束。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        裁判员4 名，负责各参赛队跳绳计数。</p>
                    <br />
                    <h4 class="weui_media_title">
                        4. 工作人员：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        无</p>
                    <br />
                    <h4 class="weui_media_title">
                        5. 比赛分组：</h4>
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
                        6.2 超时未检录者不计比赛成绩。检录时人员不齐者视为弃权。</p>
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
                        7.4 队同时比赛，每队12 人，其中2 人摇绳，其余10 人跳绳，男女比例不限。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.5 每队试跳3 次，以10 人同时起跳、顺利过绳为有效跳绳1 次。每试跳不超过1 分 钟。取成绩最好的一次如比赛成绩。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7.6 加赛时每队可试跳1 次。</p>
                    <br />
                    <h4 class="weui_media_title">
                        8. 成绩：</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        8.1 比赛完成后，由计数裁判宣布各队的比赛名次，各参赛队队长对比赛结果无疑义 后，在《比赛结果统计表》（附表1）签名。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        8.2 2 组比赛完成后，按总成绩排名，取前3 名进行奖励。如果前4 名存在成绩相同 的状况，成绩相同的两队需要加赛一场，以确定名次。</p>
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
                        <img alt="" src="141.png" width="99%" /></p>
                    <br />
                    <h4 class="weui_media_title">
                        附图1
                    </h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <img alt="" src="142.png" width="99%" /></p>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
