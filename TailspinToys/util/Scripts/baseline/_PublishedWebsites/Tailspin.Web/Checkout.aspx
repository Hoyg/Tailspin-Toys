<%@ Page Title="" Language="C#" MasterPageFile="Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Tailspin Toys: Checkout</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">


<div id="bdy">
<h1 class="section-header">Checkout</h1>
	<div class="product-wrapper">
        <div class="product-detail-top"></div><!--end product-detail-top-->
        <div class="product-detail">
        	<div class="product-overview">
                <h2>An Account is Not Required</h2>
                <table class="shopping-cart">
                    <tr>
                        <td>
                            If you are a new customer and would like to create an AdventureWorks account, <a href="#">Start here.</a> 
                            If you would like to check out as a guest, click the Continue button to complete your purchase. 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            With an <%=this.SiteData().SiteName%> account you can:
                                <ul class="simpleList">
                                <li>Save time - checking out is faster.</li> 
                                <li>Access your order history.</li>
                                </ul>
                        </td>
                    <tr>
                    </tr>
                        <td>
                            <input type="button" name="anon" value="Continue &gt;&gt;&gt;" onclick="location.href='<%=Url.Action("Shipping","Order") %>'" />
                        </td>
                    </tr>
                </table>
             
                <h2>Or login with an Email address and Password</h2>
                <table class="shopping-cart">
                    <tr>
                        <td>
                            <form method="post" action="<%=Url.Action("Login","Authentication")%>?ReturnUrl=<%=Url.GetSiteUrl()+"/"+Url.Action("Shipping","Order")%>">
                                <input type="hidden" name="ReturnUrl" value="<%=Url.AbsoluteAction("Shipping")%>" />
                                <table>
                                    <tr>
                                        <td>Email:</td><td><%= Html.TextBox("login") %></td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td><td><%= Html.Password("password") %></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><input type="checkbox" name="rememberMe" value="true" /> Remember me?</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="submit" value="Login" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </td>
                    </tr>
                </table>
            </div><!--product-overview-->
            </div>
            <div class="product-detail-btm"></div><!--end product-detail-btm-->
        <div class="clear"></div><!--end clear-->
    </div><!--end product-wrapper-->
    <div class="product-wrapper-btm"></div><!--end product-wrapper-btm-->
    </div>
</div>

</asp:Content>
