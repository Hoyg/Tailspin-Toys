<%@ Page Title="" Language="C#" MasterPageFile="Template.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Tailspin Toys: Billing</title>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<div id="bdy">
<h1 class="section-header">Billing</h1>
	<div class="product-wrapper">
        <div class="product-detail-top"></div><!--end product-detail-top-->
        <div class="product-detail">
        	<div class="product-overview">
    
                <%if (this.SiteData().AcceptCreditCards) { %>
                  <%using (Html.BeginForm("Billing", "Order")) { %>           
                      <%this.RenderAddressEntry();%>
                      <input type="submit" value="Finalize &gt;&gt;&gt;" />
                    <%} %>
                <%} %>
            </div>
        </div>
    </div>
 </div>
</asp:Content>
