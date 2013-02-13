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

namespace GuestBook.Admin
{
    public partial class commentDetails : System.Web.UI.Page
    {
        private int commentID = -99;
        private DataSet ds = new DataSet();
        private DateTime timeStamp = new DateTime();

        protected void Page_Load(object sender, EventArgs e)
        {
            BizClass bizClass = new BizClass();

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["CommentID"] != null)
                {
                    commentID = Convert.ToInt32(Request.QueryString["CommentID"]);
                    ViewState["CommentID"] = commentID;
                }
                headerLabel.Text = "<b>Edit Comment:</b> " + "<b>" + "#" + commentID.ToString() + "</b>";

                try
                {
                    ds = bizClass.GetCommentById(commentID);

                    nameTxtBox.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    emailTxtBox.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    urlTxtBox.Text = ds.Tables[0].Rows[0]["Website"].ToString();
                    locationTxtBox.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                    commentTxtBox.Text = ds.Tables[0].Rows[0]["Comment"].ToString();
                    liveChkBox.Checked = (bool)ds.Tables[0].Rows[0]["Live"];

                    // Time stamp to be used to handle possible concurrency issues
                    timeStamp = (DateTime)ds.Tables[0].Rows[0]["PostDate"];
                    ViewState["TimeStamp"] = timeStamp;
                }
                catch
                {
                    // Handle gracefully :-)
                }
            }
        }


        protected void SubmitBtn_Clicked(object sender, EventArgs e)
        {
            timeStamp = (DateTime)ViewState["TimeStamp"];
        
            // If URL text box does not have the "http://", append it.
            if ((urlTxtBox.Text != "") && (!urlTxtBox.Text.Contains("http://")))
            {
                urlTxtBox.Text = "http://" + urlTxtBox.Text.Trim();
            }

            if (Page.IsValid)
            {
                BizClass bizClass = new BizClass();

                // Handle any concurrency issue in stored procedure using timeStamp
                // Update comment record using passed commentId parameter stored in ViewState
                try
                {
                    bizClass.UpdateComment(
                        Convert.ToInt32(ViewState["CommentID"].ToString()),
                        nameTxtBox.Text.Trim(),
                        emailTxtBox.Text.Trim(),
                        urlTxtBox.Text,
                        locationTxtBox.Text.Trim(),
                        commentTxtBox.Text.Trim(),
                        timeStamp,
                        liveChkBox.Checked);
                }
                catch
                {
                    // Handle gracefully :-)
                }
            }
            commentPanel.Visible = false;
            successPanel.Visible = true;
        }


        protected void DeleteBtn_Clicked(object sender, EventArgs e)
        {
            BizClass bizClass = new BizClass();

            try
            {
                bizClass.DeleteComment(Convert.ToInt32(ViewState["CommentID"].ToString()));
            }
            catch
            {
                // Handle gracefully :-)
            }
            commentPanel.Visible = false;
            successPanel.Visible = true;

        }


        protected void CancelBtn_Clicked(object sender, EventArgs e)
        {
            Response.Redirect("guestbookAdmin.aspx", true);
        }
    }
}
