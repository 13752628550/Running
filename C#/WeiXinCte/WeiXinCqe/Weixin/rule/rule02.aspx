<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rule02.aspx.cs" Inherits="WeiXinCqe.role02" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>CQE 第三届运动会竞赛规程</title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="weui_panel">
            <div class="style1" style="font-size: large; font-weight: bold;">
                CQE 第三届运动会竞赛规程</div>
            <div class="weui_panel_bd">
                <div class="weui_media_box weui_media_text">
                    <h4 class="weui_media_title">
                        一.目的</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        为丰富职工业余文化生活，加强企业文化建设，由公司、工会、食堂（青岛宏康酒店管理有限公司）共同出资，举办第三届运动会。</p>
                    <br />
                    <h4 class="weui_media_title">
                        二. 竞赛时间、地点</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        报名时间：2016年9月29日 - 2016年10月12日</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        比赛时间：2016 年10 月16 日上午08:30-12:00</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        比赛地点：开发区实验中学田径运动场</p>
                    <br />
                    <h4 class="weui_media_title">
                        三. 参加单位</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        根据在职人员大概比例，划分为8 支参赛队。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <strong>间接部门队</strong>：由总务部、品质环境部、贸易部、资材部、MPS 事务局、CSR事务局、工会人员组成；</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <strong>AMM1 队</strong>：由AMM 制造部组成IPD 人员组成；</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <strong>AMM2 队</strong>：由AMM 制造部其他人员组成；</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <strong>SCC1 队</strong>：由SCC制造部SW B/L班人员组成；</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <strong>SCC2 队</strong>：由SCC制造部SW Ｃ/Ｎ班人员组成；（10/16M班正常出勤）</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <strong>SCC3 队</strong>：由SCC制造部SW A班/设备开发/技术/生产管理/品质科等人员组成；</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <strong>SCC4 队</strong>：由SCC 制造部COIL B 班/品质/技术/生产管理/加工科人员组成；</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <strong>SCC5 队</strong>：由SCC 制造部COIL A/ C 班/设备开发/CON/人员组成。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        1. 各参赛队需指定一名领队，负责对本队观众、运动员进行统一管理，及与会务组沟通等工作。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        2. 各参赛队可按实际情况，构建必要的管理团队，协助领队进行相关工作。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        3. 为控制秩序、方便沟通，领队及其管理团队应就坐于观众席最前排。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        4. 领队对本队成员参赛秩序、区域卫生负全部责任。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        5. 领队对本队运动员报名、检录负通知、汇总和管理责任。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        6. “优胜团队奖”、“文明团队奖”获奖团队由领队代领奖牌。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7. 各参赛队请于9 月28 日之前确定领队人选，下午3:10 到总务部开会（1 次会议）。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        8. 各领队于10 月12 日下午3:10 将报名情况提交到总务部，并开会（2 次会议）。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        9. 各领队于10 月13 日下午3:10 到总务部抽签确定赛道，并开会（3 次会议）。</p>
                    <br />
                    <h4 class="weui_media_title">
                        四. 竞赛项目</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        竞赛项目及参赛人数见附表1。</p>
                    <br />
                    <h4 class="weui_media_title">
                        五. 报名办法</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        1. 运动员须仔细阅读拟参赛项目比赛规则，充分理解并认可后，将正文打印签字交给领队。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        2. 各部门领队应于10 月13 日下午3 点10 分前将本队报名汇总表及队员签字交到会务组。</p>
                    <br />
                    <h4 class="weui_media_title">
                        六. 竞赛办法</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        1. 各队报名人数不得超过上限。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        2. 报名后运动员离职时，参赛队可于10 月14 日前申请增补或弃权。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        3. 报名后运动员移籍时，按原部门参加。不占用新部门名额，原部门不增补名额，比赛成绩团体分计入原部门。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        4. 各项目参数人员除接力赛外，不得兼报其他项目。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        5. 为确保赛会服务质量，会务组成员不得兼报比赛项目。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        6. 各项目参赛人员须按大会广播公布的时间到检录处检录。逾期未到者，拔河、夺宝奇兵两项按实到人数参赛或弃权处理，其他项目按弃权处理。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        7. 按各项目比赛规则按竞赛手册执行。</p>
                    <br />
                    <h4 class="weui_media_title">
                        七. 录取名次及奖励办法</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        1. 各项比赛设立冠军、亚军、季军，每项比赛按比赛成绩取前三名进行奖励。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        2. 竞赛设“优胜团队奖”1 名，授予团体分合计最高的参赛队。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp;2.1 单项赛第1 至8 名，分别计团体分9 分、7 分、6 分、5 分、4 分、3 分、2 分、1 分。拔河、夺宝奇兵两项第5-8
                        名均记4 分。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp;2.2 各参赛项目弃权者记0 分。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp; 2.3 因犯规取消比赛成绩者，按犯规先后顺序记入有效名次的最后一名，按名次记录团体分。（第1 位犯规取消成绩者记第8
                        名，第2 位犯规取消成绩者记第7 名……）</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        3. 竞赛设“文明团队奖”1 名，授予团体精神风尚最佳的参赛队。评选办法：</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp; 3.1 分数由基础分及表现分构成。总分（A）=基础分（B）- 表现分（C）</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp;3.2 总经理、工会主席、SCC 部经理、AMM 部经理、管理部经理（代表间接部门）1 人，共计5 人根据各参赛队的入场式、观众秩序、精神风貌等方面，以不记名方式评基础分。满分为100
                        分，分值间隔为10 分。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp;3.3 取5 名评委平均分记入各队基础分。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp;3.4 会务组监督各参赛队秩序及卫生状况，发现不按指定线路行走、不遵守会场秩序、擅自进入比赛场地、破坏会场环境卫生等不良行为时，拍照并记录，每例扣2
                        分。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp;3.5 会务组制止不良行为时，不配合、不服从或态度恶劣者，每例扣5 分。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp;3.6 争吵、打架斗殴者每例扣10 分。</p>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        &nbsp;&nbsp;&nbsp;&nbsp;3.7 该奖项授予总分最高的参赛队，授奖前公布各参赛队分数。</p>
                    <br />
                    <h4 class="weui_media_title">
                        附表1：竞赛项目</h4>
                    <p style="color: #333333; font-size: 13px; line-height: 1.2; overflow: hidden; text-overflow: ellipsis;
                        display: -webkit-box; -webkit-box-orient: vertical;">
                        <img alt="" src="21.png" width="99%" /></p>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
