using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeiXinCqe
{
    public class OracleUser
    {
        /// <summary>
        /// 企业内微信编码
        /// </summary>
        public string WeiXin_ID { get; set; }
        /// <summary>
        /// 关联工号(旧)
        /// </summary>
        public string Staffid { get; set; }
        /// <summary>
        /// 关联工号(新)
        /// </summary>
        public string NewStaffid { get; set; }
        /// <summary>
        /// 新工号开始日期
        /// </summary>
        public string NewStaffDate{ get; set; }
        /// <summary>
        /// 关联姓名
        /// </summary>
        public string Staffname { get; set; }
        /// <summary>
        /// 是否三美员工
        /// </summary>
        public string CQE { get; set; }
        /// <summary>
        /// 微信状态
        /// </summary>
        public string WeiXin_Status { get; set; }
    }
}