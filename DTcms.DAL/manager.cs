using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using DTcms.DBUtility;
using DTcms.Common;
using MySql.Data.MySqlClient;

namespace DTcms.DAL
{
    /// <summary>
    /// ���ݷ�����:����Ա
    /// </summary>
    public partial class manager
    {
        private string databaseprefix; //���ݿ����ǰ׺
        public manager(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }

        #region ��������=============================
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        public bool Exists(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "manager");
            strSql.Append(" where id=@id ");
            MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32,4)};
            parameters[0].Value = id;

            return MysqlHelper.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// ��ѯ�û����Ƿ����
        /// </summary>
        public bool Exists(string user_name)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "manager");
            strSql.Append(" where user_name=@user_name ");
            MySqlParameter[] parameters = {
					new MySqlParameter("@user_name", MySqlDbType.VarString,100)};
            parameters[0].Value = user_name;

            return MysqlHelper.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// �����û���ȡ��Salt
        /// </summary>
        public string GetSalt(string user_name)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select salt from " + databaseprefix + "manager");
            strSql.Append(" where user_name=@user_name limit 1 ");
            MySqlParameter[] parameters = {
                    new MySqlParameter("@user_name", MySqlDbType.VarString,100)};
            parameters[0].Value = user_name;
            string salt = Convert.ToString(MysqlHelper.GetSingle(strSql.ToString(), parameters));
            if (string.IsNullOrEmpty(salt))
            {
                return "";
            }
            return salt;
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public int Add(Model.manager model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into " + databaseprefix + "manager(");
            strSql.Append("role_id,role_type,user_name,password,salt,real_name,telephone,email,is_lock,add_time)");
            strSql.Append(" values (");
            strSql.Append("@role_id,@role_type,@user_name,@password,@salt,@real_name,@telephone,@email,@is_lock,@add_time)");
            strSql.Append(";select @@IDENTITY");
            MySqlParameter[] parameters = {
					new MySqlParameter("@role_id", MySqlDbType.Int32,4),
					new MySqlParameter("@role_type", MySqlDbType.Int32,4),
					new MySqlParameter("@user_name", MySqlDbType.VarString,100),
					new MySqlParameter("@password", MySqlDbType.VarString,100),
					new MySqlParameter("@salt", MySqlDbType.VarString,20),
					new MySqlParameter("@real_name", MySqlDbType.VarString,50),
					new MySqlParameter("@telephone", MySqlDbType.VarString,30),
					new MySqlParameter("@email", MySqlDbType.VarString,30),
					new MySqlParameter("@is_lock", MySqlDbType.Int32,4),
					new MySqlParameter("@add_time", MySqlDbType.DateTime)};
            parameters[0].Value = model.role_id;
            parameters[1].Value = model.role_type;
            parameters[2].Value = model.user_name;
            parameters[3].Value = model.password;
            parameters[4].Value = model.salt;
            parameters[5].Value = model.real_name;
            parameters[6].Value = model.telephone;
            parameters[7].Value = model.email;
            parameters[8].Value = model.is_lock;
            parameters[9].Value = model.add_time;

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
        /// ����һ������
        /// </summary>
        public bool Update(Model.manager model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update " + databaseprefix + "manager set ");
            strSql.Append("role_id=@role_id,");
            strSql.Append("role_type=@role_type,");
            strSql.Append("user_name=@user_name,");
            strSql.Append("password=@password,");
            strSql.Append("real_name=@real_name,");
            strSql.Append("telephone=@telephone,");
            strSql.Append("email=@email,");
            strSql.Append("is_lock=@is_lock,");
            strSql.Append("add_time=@add_time");
            strSql.Append(" where id=@id");
            MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32,4),
					new MySqlParameter("@role_id", MySqlDbType.Int32,4),
					new MySqlParameter("@role_type", MySqlDbType.Int32,4),
					new MySqlParameter("@user_name", MySqlDbType.VarString,100),
					new MySqlParameter("@password", MySqlDbType.VarString,100),
					new MySqlParameter("@real_name", MySqlDbType.VarString,50),
					new MySqlParameter("@telephone", MySqlDbType.VarString,30),
					new MySqlParameter("@email", MySqlDbType.VarString,30),
					new MySqlParameter("@is_lock", MySqlDbType.Int32,4),
					new MySqlParameter("@add_time", MySqlDbType.DateTime)};
            parameters[0].Value = model.id;
            parameters[1].Value = model.role_id;
            parameters[2].Value = model.role_type;
            parameters[3].Value = model.user_name;
            parameters[4].Value = model.password;
            parameters[5].Value = model.real_name;
            parameters[6].Value = model.telephone;
            parameters[7].Value = model.email;
            parameters[8].Value = model.is_lock;
            parameters[9].Value = model.add_time;

            int rows = MysqlHelper.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// ɾ��һ������
        /// </summary>
        public bool Delete(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from " + databaseprefix + "manager ");
            strSql.Append(" where id=@id");
            MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32,4)};
            parameters[0].Value = id;

            int rows = MysqlHelper.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        public Model.manager GetModel(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,role_id,role_type,user_name,password,salt,real_name,telephone,email,is_lock,add_time from " + databaseprefix + "manager ");
            strSql.Append(" where id=@id limit 1");
            MySqlParameter[] parameters = {
					new MySqlParameter("@id", MySqlDbType.Int32,4)};
            parameters[0].Value = id;

            Model.manager model = new Model.manager();
            DataSet ds = MysqlHelper.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["id"].ToString() != "")
                {
                    model.id = int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["role_id"].ToString() != "")
                {
                    model.role_id = int.Parse(ds.Tables[0].Rows[0]["role_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["role_type"].ToString() != "")
                {
                    model.role_type = int.Parse(ds.Tables[0].Rows[0]["role_type"].ToString());
                }
                model.user_name = ds.Tables[0].Rows[0]["user_name"].ToString();
                model.password = ds.Tables[0].Rows[0]["password"].ToString();
                model.salt = ds.Tables[0].Rows[0]["salt"].ToString();
                model.real_name = ds.Tables[0].Rows[0]["real_name"].ToString();
                model.telephone = ds.Tables[0].Rows[0]["telephone"].ToString();
                model.email = ds.Tables[0].Rows[0]["email"].ToString();
                if (ds.Tables[0].Rows[0]["is_lock"].ToString() != "")
                {
                    model.is_lock = int.Parse(ds.Tables[0].Rows[0]["is_lock"].ToString());
                }
                if (ds.Tables[0].Rows[0]["add_time"].ToString() != "")
                {
                    model.add_time = DateTime.Parse(ds.Tables[0].Rows[0]["add_time"].ToString());
                }
                return model;
            }
            else
            {
                return null;
            }
        }
    
        /// <summary>
        /// �����û������뷵��һ��ʵ��
        /// </summary>
        public Model.manager GetModel(string user_name, string password)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id from " + databaseprefix + "manager");
            strSql.Append(" where user_name=@user_name and password=@password and is_lock=0");
            MySqlParameter[] parameters = {
					new MySqlParameter("@user_name", MySqlDbType.VarString,100),
                    new MySqlParameter("@password", MySqlDbType.VarString,100)};
            parameters[0].Value = user_name;
            parameters[1].Value = password;

            object obj = MysqlHelper.GetSingle(strSql.ToString(), parameters);
            if (obj != null)
            {
                return GetModel(Convert.ToInt32(obj));
            }
            return null;
        }

        /// <summary>
        /// ���ǰ��������
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            strSql.Append(" id,role_id,role_type,user_name,password,salt,real_name,telephone,email,is_lock,add_time ");
            strSql.Append(" FROM " + databaseprefix + "manager ");
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
        /// ��ò�ѯ��ҳ����
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,role_id,role_type,user_name,password,salt,real_name,telephone,email,is_lock,add_time FROM " + databaseprefix + "manager");
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