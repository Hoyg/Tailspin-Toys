using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tailspin.Infrastructure;
using Tailspin.Model;
using System.Runtime.Serialization;

namespace Microsoft.Web.Commerce.Plugins {
    
    public class FakePaymentGateway:TailspinPlugin {

        public Transaction AuthorizeCreditCard(Order order) {
            
            //this is a fake processor for testing...
            //if there are transaction errors, 
            //pop them into the TransactionErrors on the Transaction object
            //for display to the end user
            string authCode = System.Guid.NewGuid().ToString().Substring(0, 10);
            
            Transaction t = new Transaction(order.ID, order.Total, authCode, "FakePaymentGateway");

            return t;

        }

    }
}
