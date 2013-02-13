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

using GuestBook.Layers.Business;

namespace GuestBook
{
    public partial class addComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void SubmitBtn_Clicked(object sender, EventArgs e)
        {
            // If Website textbox does not have the "http://", append it.
            if ((urlTxtBox.Text != "") && (!urlTxtBox.Text.Contains("http://")))
            {
                urlTxtBox.Text = "http://" + urlTxtBox.Text.Trim();
            }

            if (Page.IsValid)
            {
                BizClass bizClass = new BizClass();

                try
                {
                    bizClass.CreateComment(
                        nameTxtBox.Text.Trim(),
                        emailTxtBox.Text.Trim(),
                        urlTxtBox.Text.Trim(),
                        locationTxtBox.Text.Trim(),
                        commentTxtBox.Text.Trim(),
                        DateTime.Now,
                        false
                        );

                    commentPanel.Visible = false;
                    errorPanel.Visible = false;
                    successPanel.Visible = true;
                }
                catch
                {
                    // Handle gracefully :-)
                }
            }
        }


        protected void ResetBtn_Clicked(object sender, EventArgs e)
        {
            nameTxtBox.Text = "";
            emailTxtBox.Text = "";
            urlTxtBox.Text = "";
            locationTxtBox.Text = "";
            commentTxtBox.Text = "";
        }


        protected void CancelBtn_Clicked(object sender, EventArgs e)
        {
            Response.Redirect("GuestBook.aspx", true);
        }
    }
}
