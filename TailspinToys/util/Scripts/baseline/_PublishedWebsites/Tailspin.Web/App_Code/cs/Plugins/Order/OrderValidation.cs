using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tailspin.Infrastructure;
using Tailspin.Model;

namespace Microsoft.Web.Commerce.Plugins {
    public class OrderValidation:TailspinPlugin {

        public bool ValidateOrder(Order order) {
            bool result = true;
            
            //make sure there are more than one item
            result = order.Items.Count > 0;

            //we have a credit card
            if (result)
                result = order.CreditCard != null;
            
            //valid number?
            if (result)
                result = order.CreditCard.IsValid();

            //everything adds up
            if (result)
                result = order.SubTotal + order.ShippingAmount + order.TaxAmount == order.Total;


            return result;


        }

    }
}
