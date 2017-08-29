using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Account
    {
        public Account() { }
        public Account(string name, string displayName, string password, int type)
        {
            Name = name;
            DisplayName = displayName;
            Password = password;
            Type = type;
        }

        public string Name { get; set; }
        public string DisplayName { get; set; }
        public string Password { get; set; }
        public int Type { get; set; }



    }
}
