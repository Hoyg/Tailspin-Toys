using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tailspin.Infrastructure;
using Tailspin.Model;
namespace Microsoft.Web.Commerce.Plugins {
    
    
    public class AkismetSpamBlocker:Plugin {
        
        public string AkismetKey { get; set; }
        public string RobSetting {get; set;}
        public int SpamBlockedCounter {get; set;}

        public bool IsSpam(string text) {

            //stuff
            return false;
        }
    
    }
}
