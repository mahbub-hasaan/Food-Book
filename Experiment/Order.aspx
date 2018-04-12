<%@ Page Title="" Language="C#" MasterPageFile="~/Food.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Experiment.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
       <div class="row">
           <div class="col-sm-3">
               <img src="images/icons/restaurant-menu-icon-png-28.png"  height="650px" width="600px" />
           </div>
           <div class="col-sm-3 text-center">
              
           </div>
           <div class="col-sm text-center">
           <asp:Repeater ID="Repeater1" runat="server">
          
               <HeaderTemplate>
                       
                       <ul style="list-style-type: none;">
                        <li style="margin-top: 10px; ">
                               <div class="container bg-dark rounded">
                                   <div class="row" style="height:75px">
                                       <div class="col text-center text-light">
                                           <asp:Label ID="LabelName" runat="server" Text="FOOD NAME" CssClass="h2"></asp:Label>    
                                       </div>
                                       <div class="col text-light text-center">
                                           <asp:Label ID="LabelPrice" runat="server" Text="PRICE" CssClass="h2"></asp:Label>
                                       </div>
                                   </div>
                               </div>
                           </li>
               </HeaderTemplate>
               <ItemTemplate>
                           <li style="margin-bottom: 1px; margin-top: 1px;">
                               <div class="container bg-secondary rounded">
                                   <div class="row" style="height:53px;">
                                       <div class="col text-center text-light mx-auto">
                                           <asp:Label ID="LabelName" runat="server" Text='<%#Eval("FoodName")%>' CssClass="h4 p-5 mx-auto"></asp:Label>    
                                       </div>
                                       <div class="col text-light text-center mx-auto">
                                           <asp:Label ID="LabelPrice" runat="server" Text='<%#Eval("FoodPrice")%>' CssClass="h4 p-5 mx-auto"></asp:Label>
                                       </div>
                                   </div>
                               </div>
                           </li >                  
               </ItemTemplate>
               <FooterTemplate>
                       </ul>
                       
               </FooterTemplate>
           
            </asp:Repeater>
             <ul style="list-style-type: none;">
                             <li>
                               <div class="container bg-dark rounded">
                                   <div class="row" style="margin-bottom:200px; height:75px">
                                       <div class="col text-center text-light">
                                            <asp:Label ID="LabelName" runat="server" Text="TOTAL PRICE" CssClass="h2"></asp:Label>  
                                       </div>
                                       <div class="col text-light text-center">
                                           <asp:Label ID="Label2" runat="server" Text="" CssClass="h2 "></asp:Label>
                                           
                                       </div>
                                   </div>
                               </div>
                           </li >
             </ul>
           </div>


       </div>
   </div>

</asp:Content>
