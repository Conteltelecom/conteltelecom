<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Complemento.aspx.vb" Inherits="conteltelecom.Complemento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
       <script src="https://code.jquery.com/jquery.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataSourcePreco" runat="server" ConnectionString="<%$ ConnectionStrings:bitnami_prestashopConnectionString %>" ProviderName="<%$ ConnectionStrings:bitnami_prestashopConnectionString.ProviderName %>" SelectCommand="SELECT id_product FROM ps_product_shop" UpdateCommand="UPDATE ps_product_shop SET price = @price WHERE (id_product = @id_product)">
            <UpdateParameters>
                <asp:Parameter Name="price" />
                <asp:Parameter Name="id_product" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceUpdateQuantidade" runat="server" ConnectionString="<%$ ConnectionStrings:bitnami_prestashopConnectionString %>" ProviderName="<%$ ConnectionStrings:bitnami_prestashopConnectionString.ProviderName %>" SelectCommand="SELECT ps_product.id_product, ps_stock_available.id_product AS id_product_estoque FROM ps_product LEFT OUTER JOIN ps_stock_available ON ps_product.id_product = ps_stock_available.id_product WHERE (ps_product.ean13 = @ean13)" UpdateCommand="UPDATE ps_stock_available SET quantity = @quantity WHERE (id_product = @id_product)" InsertCommand="INSERT INTO ps_stock_available(id_product, id_product_attribute, id_shop, id_shop_group, quantity, depends_on_stock, out_of_stock) VALUES (@id_product, 0, 0, 1, @quantity, 0, 0)">
            <SelectParameters>
                <asp:Parameter Name="ean13"/>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter  Name="id_product" />
                  <asp:Parameter  Name="quantity" />
            </UpdateParameters>
            <InsertParameters>
                  <asp:Parameter  Name="id_product" />
                  <asp:Parameter  Name="quantity" />
            </InsertParameters>
        </asp:SqlDataSource>
    <div>
        Select a file: <asp:FileUpload ID="fu1" runat="server" />

        <br />
        <br />

        <asp:Button ID="btnSubmit" runat="server" Text="Upload to sql" />

    </div>
        <fieldset>

<div class="panel panel-default">
    <div class="panel-body">
    
            </div>
    
        <legend>FILTRO</legend> 
        FILTRO</legend> 
        
       <div class="form-horizontal"><br />


            <div class="form-group"> 
               
                <div class="col-lg-4">
                   
                </div>
                <asp:Button ID="ButtonAjustarCodBarras" runat="server" Text="Button" />
               
            </div> 


    </div>
        </div>  <!-- fim panel-body -->
</div> <!-- fim panel panel-default -->
        
</fieldset>
        <asp:SqlDataSource ID="SqlDataSourceAjustarCodBarras" runat="server" ConnectionString="<%$ ConnectionStrings:bitnami_prestashopConnectionString %>" ProviderName="<%$ ConnectionStrings:bitnami_prestashopConnectionString.ProviderName %>" SelectCommand="SELECT ps_product_lang.id_product, ps_product_lang.description, ps_product_lang.id_shop, ps_product_lang.id_lang, ps_product.ean13 FROM ps_product_lang INNER JOIN ps_product ON ps_product_lang.id_product = ps_product.id_product WHERE (ps_product_lang.id_lang = 1) ORDER BY ps_product.ean13" UpdateCommand="UPDATE ps_product SET ean13 = @ean13 WHERE (id_product = @id_product)">
            <UpdateParameters >
                <asp:Parameter name="ean13" />
                  <asp:Parameter name="description" />
                  <asp:Parameter name="id_product" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    </body>
</html>
