<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="li_portar_linha.aspx.vb" Inherits="conteltelecom.li_portar_linha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <fieldset> 
      <legend>FILTRO</legend> 
         <div class="form-inline">

       <div class="col-lg-12 form-group"> 
                     <asp:Label ID="Label2" Font-Bold="true" CssClass="col-lg-2 control-label"  runat="server" Text="CÓD/CLINETE:" ></asp:Label>
                <div class="col-lg-4">
                       <asp:TextBox ID="TextBoxCodini" CssClass ="form-control"  runat="server" ></asp:TextBox>
                    </div>
                <telerik:RadAutoCompleteBox ID="RadAutoCompleteBoxCliente" DataModelID="SqlDataSourceCliente" OnTextChanged="RadAutoCompleteBoxCliente_TextChanged" DataTextField="desc_PS_PESSOA" DataValueField="id_PS_PESSOA" runat="server" Skin="Bootstrap"></telerik:RadAutoCompleteBox>
                    <div class="col-lg-6">
                      
                </div> 
           </div>
             </div>
        </fieldset>

    <asp:SqlDataSource ID="SqlDataSourceCliente" runat="server" CancelSelectOnNullParameter="false"   ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="RadAutoCompleteBoxPs_Juridica" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxCodini" Name="id_PS_PESSOA" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
