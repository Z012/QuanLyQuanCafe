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
    public class FoodBUL
    {
        private static FoodBUL instance;

        public static FoodBUL Instance
        {
            get
            {
                if (instance == null)
                    instance = new FoodBUL();
                return FoodBUL.instance;
            }

            private set
            {
                instance = value;
            }
        }

        private FoodBUL() { }


        //public List<Food> GetListFood ()
        //{
        //    List<Food> lsFood = new List<Food>();
        //    string sqlQuery = @" select * from Food ";

        //    DataTable dt = DBConnect.Instance.Select(sqlQuery, false, null);

        //    foreach (DataRow dr in dt.Rows)
        //        lsFood.Add(new Food(dr));

        //    return lsFood;
        //}

        public List<Food> GetListFoodByCategoryID (int id)
        {
            List<Food> lsFood = new List<Food>();

            string sqlQuery = @" select * from Food where idCategory = @id ";
            Dictionary<string, object> para = new Dictionary<string, object>();
            para.Add("@id", id);

            DataTable dt = DBConnect.Instance.Select(sqlQuery, false, para);

            foreach (DataRow row in dt.Rows)
                lsFood.Add(new Food(row));

            return lsFood;
        }

        public DataTable GetListAllFood ()
        {
            string sqlQuery = @" select * from Food ";

            return DBConnect.Instance.Select(sqlQuery, false);
        }

    }
}
