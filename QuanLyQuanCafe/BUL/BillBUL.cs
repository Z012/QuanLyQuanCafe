using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAO;
using DTO;
using System.Data;

namespace BUL
{
    public class BillBUL
    {
        private static BillBUL instance;

        public static BillBUL Instance
        {
            get
            {
                if (instance == null)
                    instance = new BillBUL();
                return BillBUL.instance;
            }

            private set
            {
                instance = value;
            }
        }

        private BillBUL() { }


        public DataTable GetAllBill ()
        {
            string sqlQuery = @" select * from Bill";

            return DBConnect.Instance.Select(sqlQuery, false);
        }

        /// <summary>
        /// Lấy id của bill với điều kiện status = 0
        /// </summary>
        /// <param name="id">Id của Table</param>
        /// <returns>id = -1 thất bại != -1 thành công</returns>
        public int getUncheckBillIdByTableId (int id)
        {
            string sqlQuery = @"select * from Bill where idTable=@idTable and status=0";

            Dictionary<string, object> para = new Dictionary<string, object>();
            para.Add("@idTable", id);

            DataTable dt = DBConnect.Instance.Select(sqlQuery, false, para);

            if (dt.Rows.Count > 0)
            {
                Bill bill = new Bill(dt.Rows[0]);
                return bill.Id;
            }
            return -1;
        }

        public bool CheckOut (int id, int discount)
        {
            string query = @"Update Bill set status=1, discount = @discount where id =@id";

            Dictionary<string, object> para = new Dictionary<string, object>();
            para.Add("@id", id);
            para.Add("@discount", discount);

            return DBConnect.Instance.InsertUpdateDelete(query, false, para);
        }

        public bool InsertBill (int idTable) 
        {
            string sqlQuery = @" insert into Bill (DateCheckIn, DateCheckOut, idTable, status, discount) ";
            sqlQuery += " values (getdate(), null, @idTable, 0 , 0)";

            Dictionary<string, object> para = new Dictionary<string, object>();
            para.Add("@idTable", idTable);

            if (DBConnect.Instance.InsertUpdateDelete(sqlQuery, false, para))
                return true;
            return false;
        }

        public int GetMaxIdBill ()
        {
            try
            {
                string sqlQuery = @" select Max(id) from Bill ";

                DataRow dr = DBConnect.Instance.Select(sqlQuery, false).Rows[0];
                Object ax = dr;
                return int.Parse(ax.ToString());
            }
            catch(Exception )
            {
                return 1;
            }
        }

         
    }
}
