using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class DBConnect
    {
        private static DBConnect instance;

        public static DBConnect Instance
        {
            get
            {
                if (instance == null)
                    instance = new DBConnect();
                return DBConnect.instance;
            }

            private set
            {
                instance = value;
            }
        }

        private DBConnect() { }

        public DataTable Select(string sqlQuery, bool isProc, Dictionary<string, object> parameters = null)
        {
            using (SqlConnection con = new SqlConnection(StrConneting.conStr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                {
                    if (isProc)
                        cmd.CommandType = CommandType.StoredProcedure;
                    else
                        cmd.CommandType = CommandType.Text;

                    if (parameters != null)
                    {
                        foreach (var i in parameters)
                        {
                            cmd.Parameters.Add(new SqlParameter(i.Key, i.Value));
                        }
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            da.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        public bool InsertUpdateDelete(string sqlQuery, bool isProc, Dictionary<string, object> parameters)
        {
            using (SqlConnection con = new SqlConnection(StrConneting.conStr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                {
                    if (parameters != null)
                    {
                        if (isProc)
                            cmd.CommandType = CommandType.StoredProcedure;
                        else
                            cmd.CommandType = CommandType.Text;

                        foreach (var i in parameters)
                            cmd.Parameters.Add(new SqlParameter(i.Key, i.Value));

                        if (cmd.ExecuteNonQuery() > 0)
                            return true;
                        else
                            return false;
                    }
                    else
                        return false;

                }
            }


        }

        public bool ExecuteNoQuery (string sqlQuery , Dictionary<string, object> parameters = null)
        {
            using (SqlConnection con = new SqlConnection(StrConneting.conStr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                {
                    if (parameters != null)
                        foreach (var item in parameters)
                            cmd.Parameters.Add(new SqlParameter(item.Key, item.Value));

                    if (cmd.ExecuteNonQuery() > 0)
                        return true;
                    else
                        return false;
                }
            }
        }

        //public int 
    }
}
