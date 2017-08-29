using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAO;
using DTO;

namespace BUL
{
    public class AccountBUL
    {
        
        #region Singleton
        private static AccountBUL instance;
        public static AccountBUL Instance
        {
            get
            {
                if (instance == null)
                    instance = new AccountBUL();
                return AccountBUL.instance;
            }

            private set
            {
                instance = value;
            }
        }

        private AccountBUL() { }
        #endregion

        /// <summary>
        /// Lấy tất cả dữ liệu trong bảng Account
        /// </summary>
        /// <returns></returns>
        public DataTable getAllAccount ()
        {
            string sqlQuery = @"select * from Account";

            return DBConnect.Instance.Select(sqlQuery, false);
        }

        /// <summary>
        /// Lấy dữ liệu từ một hàng trong DataTable đẩy vào một đối tượng
        /// </summary>
        /// <param name="dr">Row in DataTable</param>
        /// <returns>Một đối tượng</returns>
        private Account MakeAccount (DataRow dr)
        {
            //Account ac = new Account();
            string Name = dr["UserName"].ToString();
            string DisplayName = dr["DisplayName"].ToString();
            string Password = dr["PassWord"].ToString();
            int Type = int.Parse(dr["Type"].ToString());

            return new Account (Name, DisplayName, Password, Type);
        }

        /// <summary>
        /// Tạo một List object ( danh sách các đối tượng ) từ một DataTable
        /// </summary>
        /// <param name="dt">DataTable in Database</param>
        /// <returns>Danh sách đối tượng</returns>
        private IList<Account> MakeListAcc (DataTable dt)
        {
            IList<Account> lsAcc = new List<Account>();
            foreach (DataRow i in dt.Rows)
            {
                Account acc = MakeAccount(i);
                lsAcc.Add(acc);
            }
            return lsAcc;
        }

        //private IList<Account> MakeListAcc ()
        //{
        //    string sqlQuery = @"select * from Account";
        //    IList<Account> lsAcc = new List<Account>();

        //    DataTable dt = DBConnect.Instance.Select(sqlQuery, false);

        //    foreach (DataRow i in dt.Rows)
        //    {
        //        Account acc = MakeAccount(i);
        //        lsAcc.Add(acc);
        //    }
        //    return lsAcc;

        //}


        /// <summary>
        /// Đăng nhập 
        /// </summary>
        /// <param name="user">Tên người dùng</param>
        /// <param name="pass">Mật khẩu</param>
        /// <returns>True - Đúng || False - Sai</returns>
        public bool Login (string user, string pass)
        {
            string sqlQuery = @" if exists (select * from Account where UserName=@user) ";
            sqlQuery += " select * from Account where UserName=@user and PassWord=@pass ";

            Dictionary<string, object> paras = new Dictionary<string, object>();
            paras.Add("@user", user);
            paras.Add("@pass", pass);

            DataTable dt = DBConnect.Instance.Select(sqlQuery, false, paras);

            if (dt.Rows.Count > 0)
            //if (MakeListAcc(dt).Count > 0)
                return true;

            return false;
        }


        
    }
}
