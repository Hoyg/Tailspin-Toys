using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tailspin.Infrastructure;
using Tailspin.Model;

namespace Microsoft.Web.Commerce.Plugins {
    public class USTaxCalculator : Plugin {


        public decimal CalculateTax(ShoppingCart cart) {

            Dictionary<string, decimal> TaxTable = new Dictionary<string, decimal>();
            TaxTable.Add("HI", .0512M);
            TaxTable.Add("CA", .0815M);
            TaxTable.Add("WA", .0612M);


            decimal result = 0;
            decimal rate = 0;
            //check the rates against the shipping address
            if(TaxTable.ContainsKey(cart.ShippingAddress.StateOrProvince))
                rate = TaxTable[cart.ShippingAddress.StateOrProvince];

            result = rate * cart.SubTotal;

            return result;

        }

    }
}
