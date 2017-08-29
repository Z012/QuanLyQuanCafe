using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Bill
    {
        private int _id;
        private DateTime? _dateCheckIn;
        private DateTime? _dateCheckOut;
        private int _idTable;
        private int _status;
        private int _discount;

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

        public DateTime? DateCheckIn
        {
            get
            {
                return _dateCheckIn;
            }

            set
            {
                _dateCheckIn = value;
            }
        }

        public DateTime? DateCheckOut
        {
            get
            {
                return _dateCheckOut;
            }

            set
            {
                _dateCheckOut = value;
            }
        }

        public int Status
        {
            get
            {
                return _status;
            }

            set
            {
                _status = value;
            }
        }

        public int IdTable
        {
            get
            {
                return _idTable;
            }

            set
            {
                _idTable = value;
            }
        }

        public int Discount
        {
            get
            {
                return _discount;
            }

            set
            {
                _discount = value;
            }
        }

        public Bill() { }

        public Bill (DataRow dr)
        {
            Id = int.Parse(dr["id"].ToString());
            DateCheckIn = DateTime.Parse(dr["DateCheckIn"].ToString());

            string dateCheckOutTemp = dr["DateCheckOut"].ToString();
            //CultureInfo provider = CultureInfo.InvariantCulture;


            if (dateCheckOutTemp.ToString() != " " && !string.IsNullOrEmpty(dateCheckOutTemp))
                DateCheckOut = DateTime.Parse(dr["DateCheckOut"].ToString());

            IdTable = int.Parse(dr["idTable"].ToString());
            Status = int.Parse(dr["status"].ToString());
            Discount = int.Parse(dr["discount"].ToString());
        }
    }
}
