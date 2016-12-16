<%@ Page Title="" Language="C#" MasterPageFile="Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Tailspin Toys: Shipping</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<div id="bdy">
    <h1 class="section-header">Shipping</h1>
	<div class="product-wrapper">
        <div class="product-detail-top"></div><!--end product-detail-top-->
        <div class="product-detail">
        	<div class="product-overview">          
                  <%if (User.Identity.IsAuthenticated) { %>
                  <div class="addressBook">
                    <%foreach (Address add in this.CurrentCustomer().AddressBook) { %>
                        <%using(Html.BeginForm()){ %>
                        
                        <input type="hidden" name="id" value="<%=add.AddressID %>" />
                        
                        <div>
                            <b><%=add.FullName%></b><br />
                            <%=add.Street1%><br />
                            <%if (!String.IsNullOrEmpty(add.Street2)) { %>
                            <%=add.Street2%><br />
                            <%} %>
                            <%=add.City%>, <%=add.StateOrProvince%><br />
                            <%=add.Country%><br />
                            
                            <input type="submit" value="Use this address" />
                        </div>
                        
                        <%} %>
                    <% } %>
                  </div>
                 <%} %>
                <form action="<%=Url.Action("Shipping") %>" method="post">
                    <%this.RenderAddressEntry(); %>
                    <input type="submit" value="Billing &gt;&gt;&gt;" />
                </form>
            </div>
        </div>
</div>
</div>

</asp:Content>
