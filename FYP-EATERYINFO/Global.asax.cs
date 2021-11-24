using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using Nemiro.OAuth;
using Nemiro.OAuth.Clients;

namespace FYP_EATERYINFO
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            OAuthManager.RegisterClient
            ("google",
            "17835569399-oqb8gnhh98930eca1qt6pvlrorlf82lk.apps.googleusercontent.com",
            "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"
            );
        }
    }
}