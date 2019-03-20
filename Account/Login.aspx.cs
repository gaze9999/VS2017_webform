using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace test2.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = UserName.Text.Trim();
            string pwd = Password.Text;
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CM_Connection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                //  cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SELECT registeruser_id,registeruser_username, registeruser_email,registeruser_password FROM Table1 where registeruser_email='" + email + "' and registeruser_password='" + pwd + "' and registeruser_rowstate<3 ";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session.Add("UserID", dt.Rows[0][0].ToString());
                    Session.Add("Username", dt.Rows[0][1].ToString());
                    Session.Add("UserEmail", dt.Rows[0][2].ToString());
                    Response.Redirect("~/Default.aspx", false);
                }
                else
                {
                    FailureText.Text = "使用者信箱或密碼錯誤";
                }
            }
        }
    }
}