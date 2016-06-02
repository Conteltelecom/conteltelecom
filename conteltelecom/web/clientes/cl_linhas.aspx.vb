Imports Telerik.Web.UI
Imports conteltelecom.Validacoes
Public Class cl_linhas
    Inherits System.Web.UI.Page
    Dim retornoInsert As Integer

       Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Function mascaraFone(fone As Object)

        Return TelefoneFormat(fone)


    End Function
    Private Sub RadGridLinhas_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridLinhas.ItemCommand

        Select Case e.CommandName
            Case "Edit", "detalhes"

                Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)

                Dim hyperLink As HyperLink = DirectCast(dataItem("id_LI_LINHAS").Controls(0), HyperLink)
                HttpContext.Current.Response.Redirect("~/web/clientes/cl_linhas_detalhes.aspx?id_cliente=" & Session("id_PS_CLIENTES") & "&id_LI_LINHAS=" & hyperLink.Text & "&modo=" & e.CommandName & "&consultaMatriz=2")

            Case "PerformInsert"

                Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
                Dim codLinha_LI_LINHASTextBox As TextBox = DirectCast(dataItem.FindControl("codLinha_LI_LINHASTextBox"), TextBox)
                Dim numLinha_LI_LINHASRadMaskedTextBox As RadMaskedTextBox = DirectCast(dataItem.FindControl("numLinha_LI_LINHASRadMaskedTextBox"), RadMaskedTextBox)
                Dim numContrato_LI_LINHAS As TextBox = DirectCast(dataItem("numContrato_LI_LINHAS").Controls(0), TextBox)
                Dim st_LI_LINHAS As CheckBox = DirectCast(dataItem("st_LI_LINHAS").Controls(0), CheckBox)


                SqlDataSourceLinhasCliente.InsertParameters("st_LI_LINHAS").DefaultValue = If(st_LI_LINHAS.Checked = False, 0, 1)
                SqlDataSourceLinhasCliente.InsertParameters("codLinha_LI_LINHAS").DefaultValue = codLinha_LI_LINHASTextBox.Text
                SqlDataSourceLinhasCliente.InsertParameters("numLinha_LI_LINHAS").DefaultValue = numLinha_LI_LINHASRadMaskedTextBox.Text

                SqlDataSourceLinhasCliente.InsertParameters("numContrato_LI_LINHAS").DefaultValue = numContrato_LI_LINHAS.Text
                SqlDataSourceLinhasCliente.Insert()
                HttpContext.Current.Response.Redirect("~/web/clientes/cl_linhas_detalhes.aspx?id_cliente=" & Session("id_PS_CLIENTES") & "&id_LI_LINHAS=" & retornoInsert & "&modo=" & e.CommandName & "&consultaMatriz=2")

        End Select




    End Sub

    Private Sub RadGridLinhas_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridLinhas.ItemDataBound

        If e.Item.ItemType = GridItemType.Item OrElse e.Item.ItemType = GridItemType.AlternatingItem Then
            Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            'get the Hyperlink using the Column uniqueName
            Dim hyperLink As HyperLink = DirectCast(dataItem("id_LI_LINHAS").Controls(0), HyperLink)
            hyperLink.NavigateUrl = ("~/web/clientes/cl_linhas_detalhes.aspx?id_cliente=" & Session("id_PS_CLIENTES") & "&id_LI_LINHAS=" & hyperLink.Text & "&modo=Detalhes&consultaMatriz=2")
        End If
    End Sub




    Private Sub SqlDataSourceLinhasCliente_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceLinhasCliente.Inserted
        retornoInsert = e.Command.Parameters("@Id").Value
    End Sub
    Public Function FCnpjFormat(Cnpj As Object) As String

        Return CNPJFormat(Cnpj)

    End Function
    Private Sub RadGridLinhas_PreRender(sender As Object, e As EventArgs) Handles RadGridLinhas.PreRender


        If IsNothing(Request.QueryString("codMatriz_PS_CLIENTES")) = False Then

            RadGridLinhas.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None
            RadGridLinhas.Rebind()
        Else
            RadGridLinhas.MasterTableView.GetColumn("CNPJ_PS_JURIDICA").Visible = False
            RadGridLinhas.Rebind()

        End If

    End Sub
End Class