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
    public class MenuBUL
    {
        private static MenuBUL instance;

        public static MenuBUL Instance
        {
            get
            {
                if (instance == null)
                    instance = new MenuBUL();
                return MenuBUL.instance;
            }

            private set
            {
                instance = value;
            }
        }

        private MenuBUL() { }

        public List<Menu> GetListMenuByTable (int id)
        {
            List<Menu> lsMenu = new List<Menu>();

            string sqlQuery = @"select f.name, bf.count, f.price, f.price*bf.count as totalprice";
            sqlQuery += " from BillInfo bf ";
            sqlQuery += " join Bill b on bf.idBill = b.id ";
            sqlQuery += " join Food f on bf.idFood = f.id ";
            sqlQuery += " where b.idTable = @idTable and b.status = 0 ";

            Dictionary<string, object> para = new Dictionary<string, object>();
            para.Add("@idTable", id);

            DataTable dt = DBConnect.Instance.Select(sqlQuery, false, para);

            foreach (DataRow row in dt.Rows)
                lsMenu.Add(new Menu(row));
            return lsMenu;
        }
    }
}
