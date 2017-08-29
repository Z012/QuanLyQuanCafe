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
    public class TableBUL
    {
        #region
        public static int TableWidth = 100;
        public static int TableHeight = 100;
        #endregion

        #region Singleton
        private static TableBUL instance;

        public static TableBUL Instance
        {
            get
            {
                if (instance == null)
                    instance = new TableBUL();
                return TableBUL.instance;
            }

            private set
            {
                instance = value;
            }
        }

        private TableBUL() { }
        #endregion


        /// <summary>
        /// Lấy toàn bộ dữ liệu trong bảng TableFood 
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable getAllTable ()
        {
            string sqlQuery = @" select * from TableFood ";

            return DBConnect.Instance.Select(sqlQuery, false, null);
        }

        /// <summary>
        /// Tạo một đối tượng Table từ hàng trong bảng TableFood
        /// </summary>
        /// <param name="dr">DataRow</param>
        /// <returns>Table</returns>
        public Table MakeTable  (DataRow dr)
        {
            int id = int.Parse(dr["id"].ToString());
            string name = dr["name"].ToString();
            string status = dr["status"].ToString();

            return new Table() { Id = id, Name = name, Status = status };
        }


        /// <summary>
        /// Tạo một danh sách Table từ bảng TableFood
        /// </summary>
        /// <returns>List<Table></Table></returns>
        public List<Table> MakeListTable()
        {
            List<Table> lsTable = new List<Table>();
            string sqlQuery = @" select * from TableFood ";
            DataTable dt = DBConnect.Instance.Select(sqlQuery, false);

            foreach (DataRow row in dt.Rows)
                lsTable.Add(MakeTable(row));

            return lsTable;
        }

        public bool SwitchTable (int id1, int id2)
        {
            string query = @" execute usp_switchTable  @id1, @id2 ";
            Dictionary<string, object> paras = new Dictionary<string, object>();
            paras.Add("@id1", id1);
            paras.Add("@id2", id2);

            //if (DBConnect.Instance.ExecuteNoQuery(query, paras))
            //    return true;
            //else
            //    return false;

            if (DBConnect.Instance.InsertUpdateDelete(query, false, paras))
                return true;
            return false;
        }
    }
}
