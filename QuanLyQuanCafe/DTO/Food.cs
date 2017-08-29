using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace DTO
{
    public class Food
    {

        private int _id;
        private string _name;
        private int _idcategory;
        private float _price;

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

        public int Idcategory
        {
            get
            {
                return _idcategory;
            }

            set
            {
                _idcategory = value;
            }
        }

        public float Price
        {
            get
            {
                return _price;
            }

            set
            {
                _price = value;
            }
        }

        public Food() { }

        public Food (DataRow row)
        {
            Id = int.Parse(row["id"].ToString());
            Name = row["name"].ToString();
            Idcategory = int.Parse(row["idCategory"].ToString());
            Price = float.Parse(row["price"].ToString());
        }


    }
}
