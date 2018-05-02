using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;
using MySql.Data.MySqlClient;

namespace DTcms.DAL
{
    /// <summary>
    /// 数据库访问层
    /// </summary>
    public partial class manager_role_value
    {
        private string column;
        private string databaseprefix;
        public manager_role_value(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
            this.column = "id,role_id,nav_name,action_type";
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        /// <param name="Top">数量</param>
        /// <param name="strWhere">条件</param>
        /// <param name="filedOrder">排序</param>
        /// <returns>DataTable</returns>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            strSql.Append(this.column + " from " + databaseprefix + "manager_role_value");
            if ("" != strWhere.Trim())
            {
                strSql.Append(" where " + strWhere);
            }
            if ("" != filedOrder.Trim())
            {
                strSql.Append(" order by " + filedOrder);
            }
            if (Top > 0)
            {
                strSql.Append(" limit " + Top.ToString() + " ");
            }
            return MysqlHelper.Query(strSql.ToString());
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        /// <param name="model">Model.manager_role_value</param>
        /// <returns>ID</returns>
        public int Add(Model.manager_role_value model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into " + databaseprefix + "manager_role_value(");
            strSql.Append("role_id,nav_name,action_type");
            strSql.Append(") values(");
            strSql.Append("@role_id,@nav_name,@action_type)");
            MySqlParameter[] parameters = {
                new MySqlParameter("@role_id",  MySqlDbType.Int32,4),
                new MySqlParameter("@nav_name", MySqlDbType.VarString,100),
				new MySqlParameter("@action_type", MySqlDbType.VarString,50)
            };
            parameters[0].Value = model.role_id;
            parameters[1].Value = model.nav_name;
            parameters[2].Value = model.action_type;
            object obj = MysqlHelper.ExecuteSql(strSql.ToString(), parameters);
            if (null != obj)
            {
                return Convert.ToInt32(obj);
            }
            else
            {
                return 0;
            }
        }
    }
}
