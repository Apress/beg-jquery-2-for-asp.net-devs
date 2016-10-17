using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EffectsAnimations
{
    public class ProcessingHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //add your processing here and remove the Sleep() call

            System.Threading.Thread.Sleep(10000);
            context.Response.ContentType = "text/plain";
            context.Response.Write("Processing is over!");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}