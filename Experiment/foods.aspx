<%@ Page Title="" Language="C#" MasterPageFile="~/Food.Master" AutoEventWireup="true" CodeBehind="foods.aspx.cs" Inherits="Experiment.foods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    FOODS
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container list-inline" style="margin-bottom:100px;">
     
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound" >
                <HeaderTemplate>
                  <div class="row list-inline">
                  <ul class="list-inline" style="list-style-type:none;margin-bottom:30px;margin-top:10px;">
                </HeaderTemplate>
                <ItemTemplate>
                    <li class="list-inline-item" style="margin-bottom:30px;margin-top:10px;" >
                       <div class="col-sm">               
                          <div class="card" style="width:300px">
                              <asp:Image ID="FoodImg" runat="server" ImageUrl='<%# Eval("FoodImg") %>' CssClass="card-img-top" Height="300px"/>
                              <div class="card-body">
                                <h4 class="card-title text-center text-danger text-uppercase"><%#Eval("FoodName") %> </h4>
                                <p class="card-text text-center text-uppercase"><spen class="span-right"><%#Eval("FoodPrice") %></spen> Taka</p>
                                  <asp:Button ID="btnADD" runat="server" Text="ADD TO CART" CssClass="btn btn-outline-dark btn-block"  OnClick="btnADD_Click"  CommandArgument='<%#Eval("FoodName") %>' CommandName="Add_To_Cart"/>                                
                              </div>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                    </div>
                </FooterTemplate>
           </asp:Repeater>
         </div>
   
</asp:Content>
