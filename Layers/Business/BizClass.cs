using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using GuestBook.Layers.Data;

namespace GuestBook.Layers.Business
{
    public class BizClass
    {
        /// <summary>
        ///  Use this class to create custom business rules, etc :-)
        /// </summary>

        public BizClass()
        {
        }


        #region insert methods
        public void CreateComment(
            string name,
            string email,
            string website,
            string location,
            string comment,
            DateTime datePosted,
            Boolean live)
        {
            GuestBookDALC.CreateComment(name, email, website, location, comment, datePosted, live);
        }
        #endregion


        #region Update Methods
        public void DeleteComment(int commentID)
        {
            GuestBookDALC.DeleteComment(commentID);
        }


        public void UpdateComment(
          int commentId,
          string name,
          string email,
          string website,
          string location,
          string comment,
          DateTime postDate,
          bool live
          )
        {
            // Call data layer access method
            GuestBookDALC.UpdateComment(
                commentId,
                name,
                email,
                website,
                location,
                comment,
                postDate,
                live
                );
        }
        #endregion


        #region get methods
        public DataSet GetComments()
        {
            return GuestBookDALC.GetComments();
        }


        public DataSet GetCommentById(int commentId)
        {
            return GuestBookDALC.GetCommentById(commentId);
        }



        public DataSet GetCommentsSummary()
        {
            return GuestBookDALC.GetCommentsSummary();
        }
        #endregion

    }
}
