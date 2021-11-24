//using Newtonsoft.Json;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nemiro.OAuth;
using static FYP_EATERYINFO.Login;
using System.Diagnostics;
using MySql.Data.MySqlClient;
using System.Data;

namespace FYP_EATERYINFO
{
    public partial class LoggedIn : System.Web.UI.Page
    {
        string connectionString = @"server=localhost;user id=root;database=user_auth;password=87507837;";
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = OAuthWeb.GetAuthorizationUrl("google");
            var result = OAuthWeb.VerifyAuthorization();

            //Response.Write(String.Format("Provider: {0}<br />", result.ProviderName));

            if (result.IsSuccessfully)
            {
                // successfully
                var user = result.UserInfo;
                var user_email = user.Email;
                var user_img_url = user.Userpic;
                if(!DoesEmailExists(user_email))
                {
                    tb_new_name.Visible = true;
                    btnAddName.Visible = true;
                    InsertNewEmail(user_email);
                }
                else
                {
                    Response.Write("<img src='" + user_img_url + "'/>");
                    Response.Write(String.Format("Email:    {0}", user_email));
                }
                Debug.WriteLine("user data", result);
                Debug.WriteLine("Access token: {0}", result.AccessTokenValue);
                //Response.Write(String.Format("User ID:  {0}<br />", user.UserId));
                //Response.Write(String.Format("Display Name:     {0}<br />", user.DisplayName));
                //Response.Write(String.Format("Full Name:     {0}<br />", user.FullName));
                //Response.Write(String.Format("First Name:     {0}<br />", user.FirstName));
                //Response.Write(String.Format("Last Name:     {0}<br />", user.LastName));
                //Response.Write(String.Format("Gender:     {0}<br />", user.Sex));
                //Response.Write(String.Format("Birthday:     {0}<br />", user.Birthday));

                
                //Response.Write(String.Format("Picture:  {0}<br /r>",user.Userpic));
                
            }
            else
            {
                // error
                Response.Write(result.ErrorInfo.Message);
            }

        }
        protected void btnAddName_Click(object sender, EventArgs e)
        {
            InsertNewName(tb_new_name.Text);
        }
        public void InsertNewName(string name)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
                {
                    sqlcon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("insert_name", sqlcon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;

                    sqlCmd.Parameters.AddWithValue("_username", name);

                    sqlCmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

        }
        public void InsertNewEmail(string email)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
                {
                    sqlcon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("insert_email", sqlcon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;

                    sqlCmd.Parameters.AddWithValue("_email", email);

                    sqlCmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

        }
        public bool DoesEmailExists(string email)
        {
            string e = null;
            using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
            {
                //sqlcon.Open();
                //MySqlDataAdapter sqlDa = new MySqlDataAdapter("", sqlcon);
                //sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                //MySqlCommand sqlCmd = new MySqlCommand("login_process", sqlcon);
                //sqlCmd.CommandType = CommandType.StoredProcedure;
                //sqlCmd.ExecuteNonQuery();
                string sqlstmt = "SELECT email FROM user_credentials WHERE email = @email;";
                MySqlCommand cmd = new MySqlCommand(sqlstmt, sqlcon);
                cmd.Parameters.AddWithValue("@email", email);
                try
                {
                    sqlcon.Open();
                    MySqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        if (reader["email"] != null)
                        {
                            if (reader["email"] != DBNull.Value)
                            {
                                e = reader["email"].ToString();
                            }
                        }
                    }
                    Console.WriteLine(e);
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.ToString());
                }
                finally
                {
                    sqlcon.Close();
                }
                if (e != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            //Session.Remove("LoggedIn");
            //Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        
    }
}