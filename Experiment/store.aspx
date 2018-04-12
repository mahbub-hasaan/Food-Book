<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="store.aspx.cs" Inherits="Experiment.store" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    STORE
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col">
              <div class="input-group mb-5 col-form-label">
              <div class=" input-group-addon p-5">
         
                              <table class="table table-dark">
                                <tr>
                                    <td>
                       
                                        <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="form-control input-group"  BorderStyle="Dashed"  Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                               <tr>
                                    <td>
                       
                                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control input-group"  BorderStyle="Dashed"  Width="100%"  placeholder="Price"></asp:TextBox>
                                    </td>
                                </tr>
                               <tr>
                                    <td>
                        
                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control input-group"  BorderStyle="Dashed"  Width="100%" placeholder="Quantity"></asp:TextBox>
                                    </td>
                                </tr>
                               <tr>
                                    <td>
                        
                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control input-group"  BorderStyle="Dashed"  Width="100%" />
                        
                        
                                    </td>
                   
                                </tr>
                               <tr>
                                   <td>
                                       <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-dark" OnClick="btnSave_Click" />
                                   </td>
                               </tr>
                                  <tr>
                                      <td>
                                          <asp:Label ID="lblSuccess" runat="server" Text="" CssClass="text-success"></asp:Label>
                                          <asp:Label ID="lblFaild" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                      </td>
                                  </tr>
                                   
                           </table>
                  </div>
                 
               </div>
            </div>
            <div class="col">
               <img src="images/icons/restaurant-menu-icon-png-28.png" class="rounded" style="height:450px;width:450px;" />
                <asp:Image ID="Image2" runat="server" />
            </div>
        </div>
    </div>


    <div class="container" style="margin-bottom:100px">
        
        <div class="row bg-dark">
          <div class="h1 text-xl-center text-light justify-content-center">
             <h1 class="justify-content-center"> FOOD LIST</h1>
          </div>      
        </div>
        <div class="row">
             <div class="h1 align-items-center d-xl-block text-center">
                 <asp:GridView ID="GridFood" runat="server" Width="1140px" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnPageIndexChanging="GridFood_PageIndexChanging" OnRowCancelingEdit="GridFood_RowCancelingEdit" OnRowDeleting="GridFood_RowDeleting" OnRowEditing="GridFood_RowEditing" OnRowUpdating="GridFood_RowUpdating">
                     <Columns>
                         <asp:TemplateField HeaderText="Name">
                             <EditItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("FoodName") %>'></asp:Label>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("FoodName") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Price">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FoodPrice") %>' Width="150px"></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("FoodPrice") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Stock">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("foodStock") %>' Width="150px"></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("foodStock") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Image">
                             <EditItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("FoodImg") %>' Width="150px" Height="70px"/>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("FoodImg") %>' Width="150px" Height="70px"/>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:CommandField ShowEditButton="True" />
                         <asp:CommandField ShowDeleteButton="True" />
                     </Columns>
                     <FooterStyle BackColor="#CCCCCC" />
                     <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                     <RowStyle BackColor="White" />
                     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#808080" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#383838" />
                 </asp:GridView>       
             </div>
        </div>
    </div>

</asp:Content>
