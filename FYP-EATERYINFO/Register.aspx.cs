using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
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

namespace FYP_EATERYINFO
{
    public partial class Register : System.Web.UI.Page
    {
        static string finalHash;
        static string salt;
        byte[] Key;
        byte[] IV;
        string connectionString = @"server=localhost;user id=root;database=user_auth;password=87507837;";
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_name_err.Text = "";
            lbl_emailrg_err.Text = "";
            lbl_pwd1_err.Text = "";
            lbl_pwd2_err.Text = "";
        }

        private bool ValidateInput()
        {
            if (!ValidateNames(tbName.Text))
            {
                lbl_name_err.Text = "Please enter a valid name for your account";
            }
            if (!ValidateEmail(tbEmail.Text))
            {
                lbl_emailrg_err.Text = "The email you entered is invalid, please try again";
            }
            if (!PwdValidation(tbPwd.Text))
            {
                lbl_pwd1_err.Text = "The password you entered is invalid, please try again";
            }
            if (!ValidateRepeatPwd(tbRepeatPwd.Text))
            {
                lbl_pwd2_err.Text = "The password you entered is invalid, please try again";
            }
            if (tbPwd.Text != tbRepeatPwd.Text)
            {
                lbl_pwd1_err.Text = "The password you entered does not match the one entered below";
                lbl_pwd2_err.Text = "The password you entered does not match the one entered above";
            }
            if (String.IsNullOrEmpty(lbl_emailrg_err.Text) && String.IsNullOrEmpty(lbl_pwd1_err.Text)
                && String.IsNullOrEmpty(lbl_pwd2_err.Text))
            {
                
                Console.WriteLine("Validated");
                return true;
            }
            else
            {
                Console.WriteLine("Not Validated");
                return false;
            }
        }
        public bool ValidateNames(string name)
        {
            if (string.IsNullOrEmpty(name))
                return false;
            try
            {
                return Regex.IsMatch(name,
                    @"^[A-Za-z.\s_-]+$",
                    RegexOptions.IgnoreCase);
            }
            catch (RegexMatchTimeoutException)
            {
                return false;
            }


        }

        public bool ValidateRepeatPwd(string pwd)
        {
            //string password = tbPwd.Text;
            if (string.IsNullOrEmpty(pwd))
            {
                return false;
            }
            try
            {
                return Regex.IsMatch(pwd, @"(?-i)(?=^.{8,}$)((?!.*\s)(?=.*[A-Z])(?=.*[a-z]))(?=(1)(?=.*\d)|.*[^A-Za-z0-9])^.*$", RegexOptions.None);
            }
            catch (RegexMatchTimeoutException)
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

        public void PwdHash()
        {
            string pwd = tbPwd.Text.ToString().Trim(); ;
            //Generate random "salt"
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] saltByte = new byte[8];
            //Fills array of bytes with a cryptographically strong sequence of random values.
            rng.GetBytes(saltByte);
            salt = Convert.ToBase64String(saltByte);
            SHA512Managed hashing = new SHA512Managed();
            string pwdWithSalt = pwd + salt;
            byte[] plainHash = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwd));
            byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
            finalHash = Convert.ToBase64String(hashWithSalt);
            RijndaelManaged cipher = new RijndaelManaged();
            cipher.GenerateKey();
            Key = cipher.Key;
            IV = cipher.IV;
        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {

            bool validInput = ValidateInput();
            if (validInput == true)
            {
                PwdHash();
                ValidateCaptcha();

                try
                {
                    using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
                    {
                        sqlcon.Open();
                        MySqlCommand sqlCmd = new MySqlCommand("register_save", sqlcon);
                        sqlCmd.CommandType = CommandType.StoredProcedure;

                        sqlCmd.Parameters.AddWithValue("_username", tbName.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("_email", tbEmail.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("_passwordhash", finalHash.Trim());
                        sqlCmd.Parameters.AddWithValue("_passwordsalt", salt.Trim());
                        sqlCmd.ExecuteNonQuery();

                        //GridFill();

                        //Clear();

                        lbl_sql_err.ForeColor = System.Drawing.Color.Green;
                        lbl_sql_err.Text = "Submitted Successfully";

                        Response.Redirect("Home.aspx");
                    }
                }
                catch (Exception)
                {

                    lbl_sql_err.Text = "Error cannot submit";
                }
            }

        }
    }
}