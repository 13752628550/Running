<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rule25.aspx.cs" Inherits="WeiXinCqe.Weixin.rule.rule25" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>  CQE第三届运动会比赛结果</title>
  
        <style type="text/css">
        .title
        {
            height: 30px;
            width: 95%;
            float: left;
            font-size: 12.0pt;
            font-weight:bold;
            color:Navy;
        }
        .rank
        {
            height: auto;
            width: 95%;
            float: left;
            font-size: 10.0pt;
            font-weight:bold;
            color:Maroon;
        }
        .contex
        {
            height: auto;
            width: 95%;
            float: left;
            font-size: 8.0pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  <div style="text-align: center; font-family: 微软雅黑; ">
        <div class="title" style="font-size: 16.0pt; height: 45px;">
            CQE第三届运动会比赛结果</div>
        <div class="title">
            --------100米短跑 女子组--------</div>
        <div class="rank">
            第1名 SCC5队</div>
        <div class="contex">
            &nbsp; (140126)王春蕊</div>
        <div class="rank">
            第2名 SCC3队</div>
        <div class="contex">
            &nbsp; (024944)徐丽梅</div>
        <div class="rank">
            第3名 SCC4队</div>
        <div class="contex">
            &nbsp; (131007)单秀玲</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------100米短跑 男子组--------</div>
        <div class="rank">
            第1名 SCC4队</div>
        <div class="contex">
            &nbsp; (160302)李东光</div>
        <div class="rank">
            第2名 SCC5队</div>
        <div class="contex">
            &nbsp; (760012)孟祥龙</div>
        <div class="rank">
            第3名 AMM1队</div>
        <div class="contex">
            &nbsp; (760360)张志鹏</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------袋鼠跳--------</div>
        <div class="rank">
            第1名 SCC1队</div>
        <div class="contex">
            &nbsp; (025198)苏克兵&nbsp;&nbsp; (032330)丁位华&nbsp;&nbsp;  (981269)代娜娜&nbsp;&nbsp;  (001478)孙凤杰</div>
        <div class="rank">
            第2名 间接部门队</div>
        <div class="contex">
            &nbsp; (160227)高欣&nbsp;&nbsp;  (041152)梁燕&nbsp;&nbsp;  (962085)张丽&nbsp;&nbsp;  (052859)赵隽</div>
        <div class="rank">
            第3名 SCC5队</div>
        <div class="contex">
            &nbsp; (160080)姜国香&nbsp;&nbsp;  (160214)马菲菲&nbsp;&nbsp;  (150116)曾天&nbsp;&nbsp;  (150075)孙振岳</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            ----4×100米接力 科长经理混合组----</div>
        <div class="rank">
            第1名 间接部门队</div>
        <div class="contex">
            &nbsp; (720130)仁平浩&nbsp;&nbsp;  (971651)&nbsp; 何磊 &nbsp; (951602)韩文学&nbsp; &nbsp; (545200)横須賀芳光</div>
        <div class="rank">
            第2名 SCC5队</div>
        <div class="contex">
            &nbsp; (951723)殷世海&nbsp;&nbsp;  (971977)周世光&nbsp;&nbsp;  (022904)张景峰&nbsp;&nbsp;  (022341)张夕柱</div>
        <div class="rank">
            第3名 SCC2队</div>
        <div class="contex">
            &nbsp; (943241)杨庆力 &nbsp; (951719)董梦飞 &nbsp; (931324)解文军 &nbsp; (051413)崔国鹏</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------夺宝奇兵--------</div>
        <div class="rank">
            第1名 SCC4队</div>
        <div class="contex">
            &nbsp; (130493)刘玉凤 &nbsp; (032249)李兆英 &nbsp; (041487)孙立萍 &nbsp; (140027)钟铭 &nbsp; (760595)刘绪征</div>
        <div class="contex">
            &nbsp; (752115)王贵生 &nbsp; (160103)巨敬堂 &nbsp; (971449)赵传梅 &nbsp; (023740)孙秀芹 &nbsp; (072181)王红</div>
        <div class="rank">
            第2名AMM1 队</div>
        <div class="contex">
            &nbsp; (760772)苗传昕 &nbsp; (751006)王洪涛 &nbsp; (760853)谢青 &nbsp; (752368)徐国建 &nbsp; (760773)韩子栋</div>
        <div class="contex">
            &nbsp; (150229)纪爽 &nbsp; (160018)尹美英 &nbsp; (160158)张晓 &nbsp; (160406)刘玲玲 &nbsp; (760980)张雅晗</div>
        <div class="rank">
            第3名 SCC1队</div>
        <div class="contex">
            &nbsp; (760648)李友君 &nbsp; (760616)徐英泉 &nbsp; (760403)褚衍耀 &nbsp; (130419)周国军 &nbsp; (760808)孔伟</div>
        <div class="contex">
            &nbsp; (160435)张玲玲 &nbsp; (160310)田秀丽 &nbsp; (160362)刘英瑛 &nbsp; (150194)丁亚平 &nbsp; (101438)温晓娜</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------4×100米接力 男子组--------</div>
        <div class="rank">
            第1名 SCC1队</div>
        <div class="contex">
            &nbsp; (025191)韩敬鹏 &nbsp; (760956)张昊祥 &nbsp; (130584)孙全龙 &nbsp; (041150)孙卫滨</div>
        <div class="rank">
            第2名SCC4队</div>
        <div class="contex">
            &nbsp; (942308)杨德光 &nbsp; (071124)王寅琪 &nbsp; (971968)吴明飞 &nbsp; (160525)陈锴</div>
        <div class="rank">
            第3名 AMM1队</div>
        <div class="contex">
            &nbsp; (760358)张津赫 &nbsp; (760898)崔雅孟 &nbsp; (760831)邢本俊 &nbsp; (760899)韩诚</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------摸石过河 男子组 --------</div>
        <div class="rank">
            第1名 SCC1 队</div>
        <div class="contex">
            &nbsp; (111296)陈培普</div>
        <div class="rank">
            第2名 SCC4队</div>
        <div class="contex">
            &nbsp; (752115)王贵生</div>
        <div class="rank">
            第3名 AMM2队</div>
        <div class="contex">
            &nbsp; (760958)吴学涛</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------400米短跑 男子组--------</div>
        <div class="rank">
            第1名 SCC4队</div>
        <div class="contex">
            &nbsp; (942308)杨德光</div>
        <div class="rank">
            第2名 SCC2队</div>
        <div class="contex">
            &nbsp; (760936)周毅</div>
        <div class="rank">
            第3名 间接部门队</div>
        <div class="contex">
            &nbsp; (971651)何磊</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------拔河--------</div>
        <div class="rank">
            第1名 SCC2队</div>
        <div class="contex">
            &nbsp; (951409)葛效青 &nbsp; (130133)王醒 &nbsp; (760716)郭军 &nbsp; (111296)陈培普 &nbsp; (131062)高登</div>
        <div class="contex">
            &nbsp; (041399)于晨光 &nbsp; (951774)孟庆国 &nbsp; (160568)王泽钰 &nbsp; (031868)刘润艳 &nbsp; (084667)赵莉莉</div>
        <div class="contex">
            &nbsp; (150100)王社敏 &nbsp; (942837)陈金凤 &nbsp; (921991)郑启春 &nbsp; (941805)沈洪秀 &nbsp; (150062)赵光红</div>
        <div class="rank">
            第2名 SCC1队</div>
        <div class="contex">
            &nbsp; (032890)李守化 &nbsp; (025193)魏然良 &nbsp; (760340)张宁宁 &nbsp; (061664)姜伟伟 &nbsp; (071116)李光</div>
        <div class="contex">
            &nbsp; (760564)王佰酉 &nbsp; (760590)王凯 &nbsp; (951464)王珍 &nbsp; (760576)付海燕 &nbsp; (921365)杨风玲</div>
        <div class="contex">
            &nbsp; (140324)王春草 &nbsp; (160391)李照静 &nbsp; (150148)郭延妹 &nbsp; (032893)蔡静 &nbsp; (140019)王瑞雪</div>
        <div class="rank">
            第3名 AMM2队</div>
        <div class="contex">
            &nbsp; (760737)曹伟 &nbsp; (760763)赵楠 &nbsp; (760965)韩佳成 &nbsp; (160619)李闯 &nbsp; (760490)候立君</div>
        <div class="contex">
            &nbsp; (160070)范晓雷 &nbsp; (160648)陈瑞升 &nbsp; (941566)徐凤霞 &nbsp; (082455)薛文 &nbsp; (942785)赵启翠</div>
        <div class="contex">
            &nbsp; (981160)于翠艳 &nbsp; (160050)姜欢 &nbsp; (011897)鲍素芳 &nbsp; (160423)逄艺伟 &nbsp; (160455)邵蕾</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------4×100米接力 女子组--------</div>
        <div class="rank">
            第1名 AMM1队</div>
        <div class="contex">
            &nbsp; (160012)史爱红 &nbsp; (160019)朱艳荣 &nbsp; (160007)杨玉霞 &nbsp; (150213)侯晓燕</div>
        <div class="rank">
            第2名 SCC3队</div>
        <div class="contex">
            &nbsp; (140076)薛洋 &nbsp; (981484)张梅 &nbsp; (024944)徐丽梅 &nbsp; (022515)王亮霞</div>
        <div class="rank">
            第3名 间接部门队</div>
        <div class="contex">
            &nbsp; (962085)张丽 &nbsp; (130010)曹晶 &nbsp; (942581)薛成嫘 &nbsp; (160644)吕宏雪</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------慢骑自行车 女子组--------</div>
        <div class="rank">
            第1名 SCC4队</div>
        <div class="contex">
            &nbsp; (130663)赵妍</div>
        <div class="rank">
            第2名 AMM2队</div>
        <div class="contex">
            &nbsp; (942235)王淑艳</div>
        <div class="rank">
            第3名 SCC5队</div>
        <div class="contex">
            &nbsp; (081251)朱维红</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------跳大绳--------</div>
        <div class="rank">
            第1名 SCC1队</div>
        <div class="contex">
            &nbsp; (130955)孙美荣 &nbsp; (150170)冯甜甜 &nbsp; (084749)丁志刚 &nbsp; (160363)张恒</div>
        <div class="contex">
            &nbsp; (150134)李萌娇 &nbsp; (760618)王基雪 &nbsp; (760309)姜婷婷 &nbsp; (160467)李倩</div>
        <div class="contex">
            &nbsp; (130985)赵瑞景 &nbsp; (951774)孟庆国 &nbsp; (760094)庄洪亮 &nbsp; (961129)王英</div>
        <div class="rank">
            第2名 AMM2队</div>
        <div class="contex">
            &nbsp; (943105)赵光金 &nbsp; (931138)王会亮 &nbsp; (052791)张文利 &nbsp; (943301)薛继翠</div>
        <div class="contex">
            &nbsp; (102635)朱军 &nbsp; (991478)徐乐霞 &nbsp; (943393)付迅芳 &nbsp; (931790)刘玉平</div>
        <div class="contex">
            &nbsp; (981454)王焕霞 &nbsp; (981140)薛梅 &nbsp; (130049)徐敏 &nbsp; (012585)刘相霞</div>
        <div class="rank">
            第3名 SCC3队</div>
        <div class="contex">
            &nbsp; (962300)李新丽 &nbsp; (024215)赵衍菲 &nbsp; (921702)王秀巧 &nbsp; (022515)王亮霞</div>
        <div class="contex">
            &nbsp; (130833)王丹 &nbsp; (101131)蒋晓琳 &nbsp; (962571)崔铭梅 &nbsp; (021857)孟凡芳</div>
        <div class="contex">
            &nbsp; (033113)徐妍梅 &nbsp; (051413)周忠龙 &nbsp; (160497)马丛林 &nbsp; (041143)房中华</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------慢骑自行车男子组--------</div>
        <div class="rank">
            第1名 SCC5队</div>
        <div class="contex">
            &nbsp; (150088)殷志强</div>
        <div class="rank">
            第2名 SCC3队</div>
        <div class="contex">
            &nbsp; (130478)王希伟</div>
        <div class="rank">
            第3名 SCC2队</div>
        <div class="contex">
            &nbsp; (160122)李洋洋</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------400米短跑 女子组--------</div>
        <div class="rank">
            第1名 间接部门队</div>
        <div class="contex">
            &nbsp; (051506)刘芳</div>
        <div class="rank">
            第2名 AMM1队</div>
        <div class="contex">
            &nbsp; (760748)白晓迪</div>
        <div class="rank">
            第3名 AMM2队</div>
        <div class="contex">
            &nbsp; (160186)尹文文</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------齐头并进--------</div>
        <div class="rank">
            第1名 AMM1队</div>
        <div class="contex">
            &nbsp; (160613)刘群 &nbsp; (942806)董清州 &nbsp; (760670)邵李伟 &nbsp; (760959)万绪 &nbsp; (760354)杨旭才</div>
        <div class="contex">
            &nbsp; (130666)牟德展 &nbsp; (971487)薛清红 &nbsp; (140011)李梦娟 &nbsp; (130016)薛清玲 &nbsp; (130170)郭琳</div>
        <div class="rank">
            第2名 SCC2队</div>
        <div class="contex">
            &nbsp; (760516)郭文文 &nbsp; (140325)郭海英 &nbsp; (150107)戚燕 &nbsp; (131090)马晓璟 &nbsp; (942616)王玉凤</div>
        <div class="contex">
            160600)张祥明 &nbsp; (160547)姚龙 &nbsp; (160598)于德源 &nbsp; (160546)庄亚飞 &nbsp; (160432)樊明坤</div>
        <div class="rank">
            第3名 SCC3队</div>
        <div class="contex">
            &nbsp; (941615)张爱芹 &nbsp; (943286)宋洁 &nbsp; (961819)王继真 &nbsp; (921136)孙丽 &nbsp; (961947)远立娟</div>
        <div class="contex">
            &nbsp; (971245)齐永红 &nbsp; (022999)孙明伟 &nbsp; (001703)张迁 &nbsp; (101439)温晓双 &nbsp; (130206)管翠旭</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------4×400米接力 男子组--------</div>
        <div class="rank">
            第1名 SCC4队</div>
        <div class="contex">
            &nbsp; (942308)杨德光 &nbsp; (160302)李东光 &nbsp; (150180)公高飞 &nbsp; (150145)田开月</div>
        <div class="rank">
            第2名 SCC1队</div>
        <div class="contex">
            &nbsp; (130584)孙全龙 &nbsp; (025191)韩敬鹏 &nbsp; (025193)魏然良 &nbsp; (760858)董震</div>
        <div class="rank">
            第3名 间接部门队</div>
        <div class="contex">
            &nbsp; (720130)仁平浩 &nbsp; (971651)何磊 &nbsp; (951730)王蓬 &nbsp; (931251)王军</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------指压板跳绳--------</div>
        <div class="rank">
            第1名 SCC2队</div>
        <div class="contex">
            &nbsp; (160522)杨振 &nbsp; (951464)王珍</div>
        <div class="rank">
            第2名 SCC3队</div>
        <div class="contex">
            &nbsp; (951493)程健鸿 &nbsp; (033113)徐妍梅</div>
        <div class="rank">
            第3名 SCC5队</div>
        <div class="contex">
            &nbsp; (131030)封志洁 &nbsp; (760125)李军娥</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------二龙戏珠--------</div>
        <div class="rank">
            第1名 SCC5队</div>
        <div class="contex">
            &nbsp; (150011)刘雪 &nbsp; (752167)张廷福</div>
        <div class="rank">
            第2名 AMM1队</div>
        <div class="contex">
            &nbsp; (931371)侯彩红 &nbsp; (760484)杨重杰</div>
        <div class="rank">
            第3名 SCC4队</div>
        <div class="contex">
            &nbsp; (160104)韩欣 &nbsp; (160103)巨敬堂</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------摸石过河 女子组--------</div>
        <div class="rank">
            第1名 SCC5队</div>
        <div class="contex">
            &nbsp; (961557)张霞</div>
        <div class="rank">
            第2名 间接部门队</div>
        <div class="contex">
            &nbsp; (150090)厉建霞</div>
        <div class="rank">
            第3名 SCC3队</div>
        <div class="contex">
            &nbsp; (111127)陈杰</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------倒跑接力--------</div>
        <div class="rank">
            第1名 SCC4队</div>
        <div class="contex">
            &nbsp; (140137)孟潇潇 &nbsp; (041135)陈悦娇 &nbsp; (760595)刘绪征 &nbsp; (961851)魏秀梅</div>
        <div class="rank">
            第2名 SCC5队</div>
        <div class="contex">
            &nbsp; (130032)管磊 &nbsp; (751877)仉超 &nbsp; (741070)代卫下 &nbsp; (932222)张美凤</div>
        <div class="rank">
            第3名 AMM2队</div>
        <div class="contex">
            &nbsp; (071788)尉纳 &nbsp; (111114)薛爽 &nbsp; (102283)崔兵选 &nbsp; (160271)于文港</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------托球跑 女子组--------</div>
        <div class="rank">
            第1名 SCC5队</div>
        <div class="contex">
            &nbsp; (025137)朱亚楠</div>
        <div class="rank">
            第2名 SCC3队</div>
        <div class="contex">
            &nbsp; (001464)刘桂娟</div>
        <div class="rank">
            第3名 间接部门队</div>
        <div class="contex">
            &nbsp; (931839)刘红</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------腿夹球接力--------</div>
        <div class="rank">
            第1名 间接部门队</div>
        <div class="contex">
            &nbsp; (991355)吕春诺 &nbsp; (150087)王滨 &nbsp; (150111)李芳 &nbsp; (150295)邢相凤</div>

        <div class="rank">
            第2名 SCC2队</div>
        <div class="contex">
            &nbsp; (942481)殷华 &nbsp; (140022)李树梅 &nbsp; (160122)李洋洋 &nbsp; (760552)褚文龙</div>
        <div class="rank">
            第3名 SCC5队</div>
        <div class="contex">
            &nbsp; (111316)李秦 &nbsp; (131019)谢运红 &nbsp; (760784)刘关朝 &nbsp; (160695)索晓帅</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------托球跑 男子组--------</div>
        <div class="rank">
            第1名 AMM1队</div>
        <div class="contex">
            &nbsp; (760770)杜巍</div>
        <div class="rank">
            第2名 间接部门队</div>
        <div class="contex">
            &nbsp; (961879)张立江</div>
        <div class="rank">
            第3名 AMM2队</div>
        <div class="contex">
            &nbsp; (932672)徐德新</div>
        <div class="contex">&nbsp; </div>
        <div class="title">
            --------优胜团队奖--------</div>
        <div class="rank">
            SCC5队</div>
    </div>
    </form>
</body>
</html>
