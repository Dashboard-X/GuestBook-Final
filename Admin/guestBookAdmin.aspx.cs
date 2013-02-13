using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace GuestBook.Admin
{
    public partial class guestBookAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        // Just a stub - need to find more elegant way of doing this!
        protected string GetShortTitle(object fullTitle, int numChars)
        {
            string shortTitle = fullTitle.ToString();

            if (shortTitle.Length < numChars)
            {
                for (int i = shortTitle.Length; i < numChars; i++)
                {
                    shortTitle += " ";
                }
            }
            else
            {
                shortTitle = shortTitle.Substring(0, numChars);
            }

            return shortTitle;
        }
    }
}
