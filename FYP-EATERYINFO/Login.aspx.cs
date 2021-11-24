using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Nemiro.OAuth;
using Nemiro.OAuth.Clients;

namespace FYP_EATERYINFO
{
    
    public partial class Login : System.Web.UI.Page
    {
        static string finalHash;
        static string salt;
        byte[] Key;
        byte[] IV;
        string connectionString = @"server=localhost;user id=root;database=user_auth;password=87507837;";
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_email_err.Text = "";
            lbl_pwd_err.Text = "";

            //var google = new GoogleClient("17835569399-oqb8gnhh98930eca1qt6pvlrorlf82lk", "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");
        }
        protected void RedirectToLogin_Click(object sender, EventArgs e)
        {
            //string url = OAuthWeb.GetAuthorizationUrl("google");
            // gets a provider name from the data-provider
            string provider = "google";
            // build the return address
            string returnUrl = new Uri(Request.Url, "LoggedIn.aspx").AbsoluteUri;
            // redirect user into external site for authorization
            OAuthWeb.RedirectToAuthorization(provider, returnUrl);
        }

        private bool ValidateInput()
        {
            bool result;
            if (!ValidateEmail(tbEmail.Text))
            {
                lbl_email_err.Text = "The email you entered is invalid, please try again";
            }
            if (!DoesEmailExists(tbEmail.Text))
            {
                lbl_email_err.Text = "The email you entered does not exist in our system, please register";
            }
            if (!PwdValidation(tbPwd.Text))
            {
                lbl_pwd_err.Text = "The password you entered is invalid, please try again";
            }
            if (!IsPasswordCorrect(tbEmail.Text, tbPwd.Text))
            {
                lbl_pwd_err.Text = "The password is incorrect";
            }
            if (String.IsNullOrEmpty(lbl_email_err.Text) && String.IsNullOrEmpty(lbl_pwd_err.Text))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool ValidateEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                return false;

            try
            {
                // Normalize the domain
                email = Regex.Replace(email, @"(@)(.+)$", DomainMapper,
                                        RegexOptions.None, TimeSpan.FromMilliseconds(200));

                // Examines the domain part of the email and normalizes it.
                string DomainMapper(Match match)
                {
                    // Use IdnMapping class to convert Unicode domain names.
                    var idn = new IdnMapping();

                    // Pull out and process domain name (throws ArgumentException on invalid)
                    string domainName = idn.GetAscii(match.Groups[2].Value);

                    return match.Groups[1].Value + domainName;
                }
            }
            catch (RegexMatchTimeoutException e)
            {
                return false;
            }
            catch (ArgumentException e)
            {
                return false;
            }
            try
            {
                return Regex.IsMatch(email,
                    @"^[^@\s]+@[^@\s]+\.[^@\s]+$",
                    RegexOptions.IgnoreCase);
            }
            catch (RegexMatchTimeoutException)
            {
                return false;
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


        public class MyObject
        {
            public string success { get; set; }
            public List<string> ErrorMessage { get; set; }
        }

        public bool ValidateCaptcha()
        {
            bool result = true;

            string captchaResponse = Request.Form["g-captcha-response"];

            HttpWebRequest req = (HttpWebRequest)WebRequest.Create("https://www.google.com/recaptcha/api/siteverify?secret=6LedoPscAAAAAF9HMHJtwBaQ6s8CheNdFFEZ2aEK &response" + captchaResponse);


            try
            {
                using (WebResponse wResponse = req.GetResponse())
                {
                    using (StreamReader readStream = new StreamReader(wResponse.GetResponseStream()))
                    {
                        string jsonResponse = readStream.ReadToEnd();
                        lbl_gScore.Text = jsonResponse.ToString();

                        JavaScriptSerializer js = new JavaScriptSerializer();

                        MyObject jsonObject = js.Deserialize<MyObject>(jsonResponse);

                        result = Convert.ToBoolean(jsonObject.success);
                    }
                }

                return result;
            }
            catch (WebException ex)
            {
                throw ex;
            }

        }

        public bool PwdValidation(string pwd)
        {
            if (string.IsNullOrEmpty(pwd))
                return false;

            try
            {
                return Regex.IsMatch(pwd, @"(?-i)(?=^.{8,}$)((?!.*\s)(?=.*[A-Z])(?=.*[a-z]))(?=(1)(?=.*\d)|.*[^A-Za-z0-9])^.*$", RegexOptions.None);
            }
            catch (RegexMatchTimeoutException)
            {
                return false;
            }
        }

        public bool IsPasswordCorrect(string email, string pass)
        {
            SHA512Managed hashing = new SHA512Managed();
            string dbHash = getDBHash(email);
            string dbSalt = getDBSalt(email);
            if (dbSalt != null && dbSalt.Length > 0 && dbHash != null && dbHash.Length > 0)
            {
                string pwdWithSalt = pass + dbSalt;
                byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
                string userHash = Convert.ToBase64String(hashWithSalt);
                if (userHash.Equals(dbHash))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

            else
            {
                return false;
            }
        }

        protected string getDBHash(string email)
        {
            string h = null;
            using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
            {
                //sqlcon.Open();
                //MySqlCommand sqlCmd = new MySqlCommand("login_process", sqlcon);
                //sqlCmd.CommandType = CommandType.StoredProcedure;
                //sqlCmd.ExecuteNonQuery();
                string sqlstmt = "SELECT passwordhash FROM user_credentials WHERE email = @email;";
                MySqlCommand cmd = new MySqlCommand(sqlstmt, sqlcon);
                cmd.Parameters.AddWithValue("@email", email);
                try
                {
                    sqlcon.Open();
                    MySqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        if (reader["passwordhash"] != null)
                        {
                            if (reader["passwordhash"] != DBNull.Value)
                            {
                                h = reader["passwordhash"].ToString();
                            }
                        }
                    }
                    Console.WriteLine(h);
                    
                }

                catch (Exception ex)
                {
                    throw new Exception(ex.ToString());
                }
                finally
                {
                  sqlcon.Close();  
                }
                return h;
                
            }
        }
        protected string getDBSalt(string email)
        {
            string s = null;
            using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
            {
                //sqlcon.Open();
                //MySqlCommand sqlCmd = new MySqlCommand("login_process", sqlcon);
                //sqlCmd.CommandType = CommandType.StoredProcedure;
                //sqlCmd.ExecuteNonQuery();
                string sqlstmt = "SELECT passwordsalt FROM user_credentials WHERE email = @email;";
                MySqlCommand cmd = new MySqlCommand(sqlstmt, sqlcon);
                cmd.Parameters.AddWithValue("@email", email);
                try
                {
                    sqlcon.Open();
                    MySqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        if (reader["passwordsalt"] != null)
                        {
                            if (reader["passwordsalt"] != DBNull.Value)
                            {
                                s = reader["passwordsalt"].ToString();
                            }
                        }
                    }
                    Console.WriteLine(s);
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.ToString());
                }
                finally
                {
                    sqlcon.Close();
                }
                return s;
            }
        }
        protected void btnSignin_Click(object sender, EventArgs e)
        {
            bool validInput = ValidateInput();
            if (validInput == true)
            {
                ValidateCaptcha();
                DoesEmailExists(tbEmail.Text);
                getDBHash(tbEmail.Text);
                getDBSalt(tbEmail.Text);
                lbl_sql_err.ForeColor = System.Drawing.Color.Green;
                lbl_sql_err.Text = "Submitted Successfully";
                Session["LoggedIn"] = tbEmail.Text.Trim();
                string guid = Guid.NewGuid().ToString();
                Session["AuthToken"] = guid;

                Response.Cookies.Add(new HttpCookie("AuthToken", guid));

                //Response.Redirect("LoggedIn.aspx?Username=" + "&UserEmail=" + "&UserImg="+ );
            }
            else
            {
                lbl_sql_err.Text = "SQL failed";
            }
        }
    }
}