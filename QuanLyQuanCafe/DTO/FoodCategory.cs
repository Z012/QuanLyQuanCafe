using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace DTO
{
    public class FoodCategory
    {
        private int _id;
        private string _name;

        public int Id
        {
            get
            {
                return _id;
            }

            set
            {
                _id = value;
            }
        }

        public string Name
        {
            get
            {
                return _name;
            }

            set
            {
                _name = value;
            }
        }


        public FoodCategory() { }
        public FoodCategory (DataRow row)
        {
            Id = int.Parse(row["id"].ToString());
            Name = row["name"].ToString();
        }


    }
}
