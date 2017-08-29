using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Menu
    {
        private float _price;
        private int _count;
        private float _totalPrice;
        private string _foodName;

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

        public int Count
        {
            get
            {
                return _count;
            }

            set
            {
                _count = value;
            }
        }

        public float TotalPrice
        {
            get
            {
                return _totalPrice;
            }

            set
            {
                _totalPrice = value;
            }
        }

        public string FoodName
        {
            get
            {
                return _foodName;
            }

            set
            {
                _foodName = value;
            }
        }

        public Menu (DataRow row)
        {
            Price = float.Parse(row["price"].ToString());
            Count = int.Parse(row["count"].ToString());
            TotalPrice = float.Parse(row["totalprice"].ToString());
            FoodName = row["name"].ToString();
        }
    }
}
