using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Online_Shopping_Backup
{
    interface ISendEmail
    {
        bool SendEmail(List<string> to, string subject, string body);
        void SendEmail(string email, string subject, string body);
    }
}
