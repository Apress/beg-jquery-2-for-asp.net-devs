using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SelectorsWebForms
{
    public class Download
    {
        public Download()
        {
        }

        public Download(string title, string url)
        {
            this.Title = title;
            this.URL = url;
        }
        public string Title { get; set; }
        public string URL { get; set; }
    }
}