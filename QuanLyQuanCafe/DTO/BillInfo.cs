using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class BillInfo
    {
        private int _id;
        private int _count;
        private int _idFood;
        private int _idBill;

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

        public int IdFood
        {
            get
            {
                return _idFood;
            }

            set
            {
                _idFood = value;
            }
        }

        public int IdBill
        {
            get
            {
                return _idBill;
            }

            set
            {
                _idBill = value;
            }
        }



    }
}
