using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeiXinCqe.Cams
{
    public class VersionInfo
    {
        public string errcode { get; set; }
        /// <summary>
        /// 返回值消息errmsg
        /// </summary>
        public string errmsg { get; set; }
        public double versioncode { get; set; }
        public string productname { get; set; }
        public string updateurl { get; set; }    
        public string updatecontent { get; set; }
        public string serverip { get; set; }
    }
}