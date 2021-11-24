using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_EATERYINFO
{
    public partial class HomeReal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn1_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.facebook.com/yummochowsg/");
        }

        protected void btn2_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15955.187067419862!2d103.8553899!3d1.2965847!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x587a5e1019a52078!2sYummo%20Chow!5e0!3m2!1sen!2ssg!4v1637481176063!5m2!1sen!2ssg");
        }

        protected void btn3_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("http://charlies.com.sg/charliestapas/menu/");
        }

        protected void btn4_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.81311670492!2d103.84762355048225!3d1.2861665621300398!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da190bcfef1d0f%3A0x6d2e614b2f5327eb!2sCharlie&#39;s%20Restaurant%20%26%20Bar%20(Boat%20Quay)!5e0!3m2!1sen!2ssg!4v1637482149555!5m2!1sen!2ssg");
        }

        protected void btn5_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.hongdaeoppa.com/");
        }

        protected void btn6_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.7905296543227!2d103.84304155048223!3d1.3005370620891405!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da1948522efbf9%3A0x4d14d0b85b9a4350!2sHongdae%20Oppa%20Korean%20Dining%20House%20(Plaza%20Singapura)!5e0!3m2!1sen!2ssg!4v1637482319029!5m2!1sen!2ssg");
        }

        protected void btn7_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://brewerkz.com/outlet/singapore-indoor-stadium/");
        }

        protected void btn8_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.7914017447993!2d103.87213765048229!3d1.2999851620907263!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da184e9966355d%3A0x221d404a8ad39453!2sBrewerkz!5e0!3m2!1sen!2ssg!4v1637482410272!5m2!1sen!2ssg");
        }

        protected void btn9_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.anjappar.com.sg/");
        }

        protected void btn10_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.7771953533347!2d103.84915505048221!3d1.3089466620650643!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da19c7381620f1%3A0x3e054cdd13db77e6!2sAnjappar%20Chettinad%20Restaurant!5e0!3m2!1sen!2ssg!4v1637482516356!5m2!1sen!2ssg");
        }

        protected void btn11_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.facebook.com/RestaurantManchurianLamb/");
        }

        protected void btn12_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.8191539007526!2d103.84232345048235!3d1.2822982621409873!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da1972d5f8956b%3A0x76edcb3627f62f92!2z5ruh5peP5YWo576K6ZO6IE1hbmNodXJpYW4gTGFtYiBIb3RQb3QgLSDnvorogonmsaTngavplIU!5e0!3m2!1sen!2ssg!4v1637482602444!5m2!1sen!2ssg");
        }
    }
}