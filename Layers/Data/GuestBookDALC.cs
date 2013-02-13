using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;


namespace GuestBook.Layers.Data
{
    public class GuestBookDALC
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["guestBookConn"].ConnectionString;
        static SqlConnection dbConnection = new SqlConnection(connectionString);


        #region insert methods
        public static void CreateComment(
            string name,
            string email,
            string website,
            string location,
            string comment,
            DateTime postDate,
            Boolean live
            )
        {
            SqlParameter[] parameters = new SqlParameter[7];

            parameters[0] = new SqlParameter("@Name", System.Data.SqlDbType.VarChar, 100);
            parameters[0].Value = name;

            parameters[1] = new SqlParameter("@Email", System.Data.SqlDbType.VarChar, 100);
            parameters[1].Value = email;

            parameters[2] = new SqlParameter("@Website", System.Data.SqlDbType.VarChar, 100);
            parameters[2].Value = website;

            parameters[3] = new SqlParameter("@Location", System.Data.SqlDbType.VarChar, 100);
            parameters[3].Value = location;

            parameters[4] = new SqlParameter("@Comment", System.Data.SqlDbType.VarChar, 600);
            parameters[4].Value = comment;

            parameters[5] = new SqlParameter("@PostDate", System.Data.SqlDbType.DateTime);
            parameters[5].Value = postDate;

            parameters[6] = new SqlParameter("@Live", System.Data.SqlDbType.Bit);
            parameters[6].Value = Convert.ToInt32(live);


            try
            {
            SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, 
                    "CreateGuestBookComment", parameters);
        }

        catch
        {
                // (SqlException err)
                // Log error, email webmaster and display friendly error message to user.
            }
            finally
            {
                dbConnection.Close();
            }
        }
        #endregion


        #region Update Methods
        public static void DeleteComment(int commentID)
        {
            SqlParameter[] parameters = new SqlParameter[1];

            parameters[0] = new SqlParameter("@CommentID", System.Data.SqlDbType.Int, 8, "commentID");
            parameters[0].Value = commentID;

            try
            {
                SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "DeleteComment", parameters);
            }
            catch
            {
                // (SqlException err)
                // Log error, email webmaster and display friendly error message to user.
                
            }
            finally
            {
                dbConnection.Close();
            }
        }


        public static void UpdateComment(
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
            SqlParameter[] parameters = new SqlParameter[8];

            parameters[0] = new SqlParameter("@CommentID", System.Data.SqlDbType.Int, 8, "CommentID");
            parameters[0].Value = commentId;

            parameters[1] = new SqlParameter("@Name", System.Data.SqlDbType.VarChar, 100);
            parameters[1].Value = name;

            parameters[2] = new SqlParameter("@Email", System.Data.SqlDbType.VarChar, 100);
            parameters[2].Value = email;

            parameters[3] = new SqlParameter("@Website", System.Data.SqlDbType.VarChar, 100);
            parameters[3].Value = website;

            parameters[4] = new SqlParameter("@Location", System.Data.SqlDbType.VarChar, 100);
            parameters[4].Value = location;

            parameters[5] = new SqlParameter("@Comment", System.Data.SqlDbType.VarChar, 600);
            parameters[5].Value = comment;

            parameters[6] = new SqlParameter("@PostDate", System.Data.SqlDbType.DateTime);
            parameters[6].Value = postDate;

            parameters[7] = new SqlParameter("@Live", System.Data.SqlDbType.Bit);
            parameters[7].Value = Convert.ToInt32(live);

            try
            {
                SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, "UpdateComment", parameters);
            }
            catch 
            {
                // (SqlException err)
                // Log error, email webmaster and display friendly error message to user.
            }
            finally
            {
                dbConnection.Close();
            }
        }
        #endregion


        #region get methods
        public static DataSet GetComments()
        {
            DataSet ds = new DataSet();

            try
            {
                ds = (SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure,
                    "GetGuestBookComments"));
            }
            catch
            {
                // (SqlException err)
                // Log error, email webmaster and display friendly error message to user.
            }
            return ds;
        }


        public static DataSet GetCommentById(int commentId)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            DataSet ds = new DataSet();

            parameters[0] = new SqlParameter("@CommentID", System.Data.SqlDbType.Int, 8, "commentId");
            parameters[0].Value = commentId;

            try
            {
               ds = (SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure,
                   "GetCommentById", parameters));
            }
            catch
            {
                // (SqlException err)
                // Log error, email webmaster and display friendly error message to user.
            }
            return ds;
        }


        // Used by the guestbookAdmin page
        public static DataSet GetCommentsSummary()
        {
            DataSet ds = new DataSet();

            try
            {
                ds = (SqlHelper.ExecuteDataset(connectionString, CommandType.StoredProcedure,
                    "GetCommentsSummary"));
            }
            catch
            {
                // (SqlException err)
                // Log error, email webmaster and display friendly error message to user.
            }
            return ds;
        }
        #endregion
    }
}
