using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Online_Shopping_Backup
{
    interface IManager
    {
            bool Edit();
            bool Delete();
            bool Insert();
            List<String> GetAll();

        
    }
}
