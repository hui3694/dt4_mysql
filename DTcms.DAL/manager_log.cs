﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;
using MySql.Data.MySqlClient;

namespace DTcms.DAL
{
    /// <summary>
    /// 数据访问类:管理员日志
    /// </summary>
    public partial class manager_log
    {
        private string databaseprefix; //数据库表名前缀
        public manager_log(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }

        #region 基本方法==============================
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "manager_log");
            strSql.Append(" where id=@id ");
            MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32,4)};
            parameters[0].Value = id;
            return MysqlHelper.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 返回数据数
        /// </summary>
        public int GetCount(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(*) as H from " + databaseprefix + "manager_log ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return Convert.ToInt32(MysqlHelper.GetSingle(strSql.ToString()));
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.manager_log model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into " + databaseprefix + "manager_log(");
            strSql.Append("user_id,user_name,action_type,remark,user_ip,add_time)");
            strSql.Append(" values (");
            strSql.Append("@user_id,@user_name,@action_type,@remark,@user_ip,@add_time)");
            strSql.Append(";select @@IDENTITY");
            MySqlParameter[] parameters = {
					new MySqlParameter("@user_id", MySqlDbType.Int32,4),
					new MySqlParameter("@user_name", MySqlDbType.VarString,100),
					new MySqlParameter("@action_type", MySqlDbType.VarString,100),
					new MySqlParameter("@remark", MySqlDbType.VarString,255),
					new MySqlParameter("@user_ip", MySqlDbType.VarString,30),
					new MySqlParameter("@add_time", MySqlDbType.DateTime)};
            parameters[0].Value = model.user_id;
            parameters[1].Value = model.user_name;
            parameters[2].Value = model.action_type;
            parameters[3].Value = model.remark;
            parameters[4].Value = model.user_ip;
            parameters[5].Value = model.add_time;

            object obj = MysqlHelper.GetSingle(strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.manager_log GetModel(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,user_id,user_name,action_type,remark,user_ip,add_time");
            strSql.Append(" from " + databaseprefix + "manager_log ");
            strSql.Append(" where id=@id limit 1");
            MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32,4)};
            parameters[0].Value = id;

            Model.manager_log model = new Model.manager_log();
            DataSet ds = MysqlHelper.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return DataRowToModel(ds.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.manager_log DataRowToModel(DataRow row)
        {
            Model.manager_log model = new Model.manager_log();
            if (row != null)
            {
                if (row["id"] != null && row["id"].ToString() != "")
                {
                    model.id = int.Parse(row["id"].ToString());
                }
                if (row["user_id"] != null && row["user_id"].ToString() != "")
                {
                    model.user_id = int.Parse(row["user_id"].ToString());
                }
                if (row["user_name"] != null)
                {
                    model.user_name = row["user_name"].ToString();
                }
                if (row["action_type"] != null)
                {
                    model.action_type = row["action_type"].ToString();
                }
                if (row["remark"] != null)
                {
                    model.remark = row["remark"].ToString();
                }
                if (row["user_ip"] != null)
                {
                    model.user_ip = row["user_ip"].ToString();
                }
                if (row["add_time"] != null && row["add_time"].ToString() != "")
                {
                    model.add_time = DateTime.Parse(row["add_time"].ToString());
                }
            }
            return model;
        }

        /// <summary>
        /// 根据用户名返回上一次登录记录
        /// </summary>
        public Model.manager_log GetModel(string user_name, int top_num, string action_type)
        {
            int rows = GetCount("user_name='" + user_name + "'");
            if (top_num == 1)
            {
                rows = 2;
            }
            if (rows > 1)
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("select id from (select id from " + databaseprefix + "manager_log");
                strSql.Append(" where user_name=@user_name and action_type=@action_type order by id desc limit " + top_num + " ) as T ");
                strSql.Append(" order by id asc limit 1 ");
                MySqlParameter[] parameters = {
					new MySqlParameter("@user_name", MySqlDbType.VarString,100),
                    new MySqlParameter("@action_type", MySqlDbType.VarString,100)};
                parameters[0].Value = user_name;
                parameters[1].Value = action_type;

                object obj = MysqlHelper.GetSingle(strSql.ToString(), parameters);
                if (obj != null)
                {
                    return GetModel(Convert.ToInt32(obj));
                }
            }
            return null;
        }

        ///// <summary>
        ///// 删除7天前的日志数据
        ///// </summary>
        public int Delete(int dayCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from " + databaseprefix + "manager_log ");
            strSql.Append(" where DATEDIFF(day, add_time, getdate()) > " + dayCount);

            return MysqlHelper.ExecuteSql(strSql.ToString());
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            strSql.Append(" id,user_id,user_name,action_type,remark,user_ip,add_time ");
            strSql.Append(" FROM " + databaseprefix + "manager_log ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            if (Top > 0)
            {
                strSql.Append(" limit " + Top.ToString());
            }
            return MysqlHelper.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,user_id,user_name,action_type,remark,user_ip,add_time FROM " + databaseprefix + "manager_log");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(MysqlHelper.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return MysqlHelper.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        #endregion
    }

}
