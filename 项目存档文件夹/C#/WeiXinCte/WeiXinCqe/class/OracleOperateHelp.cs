using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data.OracleClient;
using System.Data;
using WeiXinWebApp;
using System.Configuration;

namespace WeiXinCqe
{
    public class OracleOperateHelp
    {
          private static string db_user = "CTE";
        private static string db_pwd = "wechat2021";
        public static readonly string ConnectionStringLocalTransaction = "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=172.25.65.242)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=ORCL.EXAS.AD.LOCAL)));" +
           "Persist Security Info=True;User ID=" + db_user + ";Password=" + db_pwd + ";";

        // 哈希表用来存储缓存的参数信息，哈希表可以存储任意类型的参数。
        private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());

       
        /// <summary>
        /// 判断连接字符串是否正确
        /// </summary>
        /// <returns>验证结果，正确返回true 错误返回 false</returns>
      public static bool isSuccessful()
        {
            OracleConnection connection = new OracleConnection(ConnectionStringLocalTransaction);
            try
            {
                connection.Open();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                LogTextHelper.Error(string.Format("手工测试数据库连接失败")  + "错误原因:" + ex.ToString().Trim());
                return false;
            }
        }
      /// <summary>
      /// 返回datatable
      /// </summary>
      /// <param name="sql">sql语句</param>
      /// <returns>datatable</returns>
        public static DataTable getDataTable(string sql)
        {
            DataTable dt = new DataTable();
            dt.Clear();

            try
            {
                dt = ExecuteDataTable(ConnectionStringLocalTransaction, CommandType.Text, sql, null);

            }
            catch (Exception e)
            {
                LogTextHelper.Error(string.Format("获取数据库DataTable失败")+"SQL语句为:"+sql+"错误原因:"+e.ToString().Trim());
            }
            return dt;
        }
     
        /// <summary>
        /// 执行一条返回DataTable的OracleCommand命令，通过专用的连接字符串。
        /// 使用参数数组提供参数
        /// </summary>
        /// /// <remarks>
        /// 使用示例：  
        ///  DataTable dt = ExecuteDataSet(connString, CommandType.StoredProcedure, "PublishOrders", new OracleParameter(":prodid", 24));
        /// </remarks>
        /// <param name="connectionString">一个有效的数据库连接字符串</param>
        /// <param name="commandType">OracleCommand命令类型 (存储过程， T-SQL语句， 等等。)</param>
        /// <param name="commandText">存储过程的名字或者 T-SQL 语句</param>
        /// <param name="commandParameters">以数组形式提供OracleCommand命令中用到的参数列表</param>
        /// <returns>返回一个包含结果的DataSe</returns>
      public static DataTable ExecuteDataTable(string connectionString, CommandType cmdType, string cmdText, params OracleParameter[] commandParameters)
        {
            OracleCommand cmd = new OracleCommand();
            OracleConnection conn = new OracleConnection(connectionString);

            // 在这里使用try/catch处理是因为如果方法出现异常，DataSet就不存在，触发的异常由catch捕获。
            //关闭数据库连接，并通过throw再次引发捕捉到的异常。
            try
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                cmd.Connection = conn;
                cmd.CommandType = cmdType;
                cmd.CommandText = cmdText;
                if (commandParameters != null)
                {
                    foreach (OracleParameter parm in commandParameters)
                        cmd.Parameters.Add(parm);
                }
                OracleDataAdapter da = new OracleDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                
                da.Fill(dt);
                conn.Close();
                return dt;
            }
            catch
            {
                conn.Close();
                throw;
            }

        }
      


    }
   
}
