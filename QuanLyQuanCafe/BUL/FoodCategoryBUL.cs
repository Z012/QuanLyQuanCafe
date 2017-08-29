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
    public class FoodCategoryBUL
    {

        #region Sengleton
        private static FoodCategoryBUL instance;

        public static FoodCategoryBUL Instance
        {
            get
            {
                if (instance == null)
                    instance = new FoodCategoryBUL();
                return FoodCategoryBUL.instance;
            }

            private set
            {
                instance = value;
            }
        }

        private FoodCategoryBUL() { }

        #endregion

        public List<FoodCategory> GetListCategory ()
        {
            List<FoodCategory> lsCa = new List<FoodCategory>();

            string sqlQuery = @" select * from FoodCategory ";
            DataTable dt = DBConnect.Instance.Select(sqlQuery, false, null);

            foreach (DataRow row in dt.Rows)
                lsCa.Add(new FoodCategory(row));

            return lsCa;
        }

        
    }
}
