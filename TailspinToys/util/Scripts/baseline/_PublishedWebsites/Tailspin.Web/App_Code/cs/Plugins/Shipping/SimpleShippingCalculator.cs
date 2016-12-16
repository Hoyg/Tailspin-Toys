using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tailspin.Infrastructure;
using Tailspin.Model;

namespace Microsoft.Web.Commerce.Plugins {
    
    public class SimpleShippingCalculator:TailspinPlugin {
        
        public IList<ShippingMethod> CalculateShipping(ShoppingCart cart) {
            //pull the rates
            var shippingMethods=OrderRepository.GetShippingMethods().ToList();
            //get the total weight of the order
            decimal totalWeight = cart.Items.Sum(x => x.Product.WeightInPounds * x.Quantity);
            //loop the methods and set the cost
            shippingMethods.ForEach(x => x.Cost = x.BaseRate + (x.RatePerPound * totalWeight));
            return shippingMethods;
        }
    }
}
