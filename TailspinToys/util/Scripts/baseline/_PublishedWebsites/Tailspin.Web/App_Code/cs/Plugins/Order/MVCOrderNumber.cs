using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tailspin.Infrastructure;
using Tailspin.Model;

namespace Microsoft.Web.Commerce.Plugins {
    public class MVCOrderNumber:TailspinPlugin {

        public string CreateOrderNumber(Order order) {
            return  "MVC-"+Guid.NewGuid().ToString().Substring(0, 8);
        }

    }
}
