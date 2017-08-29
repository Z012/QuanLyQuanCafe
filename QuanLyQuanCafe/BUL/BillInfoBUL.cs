using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

using DAO;
using DTO;


namespace BUL
{
    public class BillInfoBUL
    {
        private static BillInfoBUL instance;

        public static BillInfoBUL Instance
        {
            get
            {
                if (instance == null)
                    instance = new BillInfoBUL();
                return BillInfoBUL.instance;
            }

            private set
            {
                instance = value;
            }
        }

        private BillInfoBUL() { }


        private BillInfo MakeBill (DataRow dr)
        {
            int id = int.Parse(dr["id"].ToString());
            int idBill = int.Parse(dr["idBill"].ToString());
            int idFood = int.Parse(dr["idFood"].ToString());
            int count = int.Parse(dr["count"].ToString());

            return new BillInfo() {Id=id, IdBill=idBill, IdFood=idFood, Count=count };
        }

        public List<BillInfo> GetListBillInfo (int id)
        {
            List<BillInfo> lsBillInfo = new List<BillInfo>();

            string sqlQuery = @"select * from BillInfo where idBill=@idBill ";
            Dictionary<string, object> para = new Dictionary<string, object>();
            para.Add("@idBill", id);

            DataTable dt = DBConnect.Instance.Select(sqlQuery, false, para);

            foreach (DataRow row in dt.Rows)
            {
                lsBillInfo.Add(MakeBill(row));
            }

            return lsBillInfo;
        }

        public bool InsertBillInfo (int idBill, int idFood , int count)
        {
            string sqlQuery = @"execute Dsp_BillInfo @idBill, @idFood, @count";

            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("@idBill", idBill);
            parameters.Add("@idFood", idFood);
            parameters.Add("@count", count);

            if (DBConnect.Instance.InsertUpdateDelete(sqlQuery, false, parameters))
                return true;
            return false;
        }


    }
}
