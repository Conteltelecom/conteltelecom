Imports Telerik.Web.UI

Public Class cl_linhas_virtuais
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridLinhasVirtuais_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridLinhasVirtuais.ItemCommand


        If e.CommandName = "PerformInsert" Then
            Dim numContrato_LI_LINHASTextBox As New RadTextBox
            Dim codLinha_LI_LINHASTextBox As New RadTextBox
            Dim RadComboBoxOPeradoras As New RadComboBox
            Dim RadComboBoxTiposLInhas As New RadComboBox
            Dim CheckBoxST As New CheckBox
            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)

            numContrato_LI_LINHASTextBox = DirectCast(eitem.FindControl("numContrato_LI_LINHASTextBox"), RadTextBox)
            codLinha_LI_LINHASTextBox = DirectCast(eitem.FindControl("codLinha_LI_LINHASTextBox"), RadTextBox)
            RadComboBoxOPeradoras = DirectCast(eitem.FindControl("RadComboBoxOPeradoras"), RadComboBox)
            RadComboBoxTiposLInhas = DirectCast(eitem.FindControl("RadComboBoxTiposLInhas"), RadComboBox)
            CheckBoxST = DirectCast(eitem.FindControl("CheckBoxST"), CheckBox)
            SqlDataSourceLinhasCliente.InsertParameters("numContrato_LI_LINHAS").DefaultValue = numContrato_LI_LINHASTextBox.Text
            SqlDataSourceLinhasCliente.InsertParameters("codLinha_LI_LINHAS").DefaultValue = codLinha_LI_LINHASTextBox.Text
            SqlDataSourceLinhasCliente.InsertParameters("id_OP_OPERADORAS").DefaultValue = RadComboBoxOPeradoras.SelectedValue
            SqlDataSourceLinhasCliente.InsertParameters("id_LI_TIPOS").DefaultValue = 1
            SqlDataSourceLinhasCliente.Insert()


        End If
        If e.CommandName = "Delete" Then
            ' Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            ' Dim hyperLink As HyperLink = DirectCast(dataItem("id_LI_LINHAS").Controls(0), HyperLink)
            '   SqlDataSourceLinhasCliente.DeleteParameters("id_LI_LINHAS").DefaultValue = hyperLink.Text

            '  SqlDataSourceLinhasCliente.Delete()
        End If
        If e.CommandName = "Edit" Then
            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            Dim hyperLink As HyperLink = DirectCast(eitem("id_LI_LINHAS").Controls(0), HyperLink)
            HttpContext.Current.Response.Redirect(Replace(hyperLink.NavigateUrl, "&modo=Detalhes", "&modo=Edit"))
        End If
    End Sub

    Private Sub RadGridLinhasVirtuais_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridLinhasVirtuais.ItemDataBound
        If e.Item.ItemType = GridItemType.Item OrElse e.Item.ItemType = GridItemType.AlternatingItem Then
            Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            'get the Hyperlink using the Column uniqueName
            Dim hyperLink As HyperLink = DirectCast(dataItem("id_LI_LINHAS").Controls(0), HyperLink)
            hyperLink.NavigateUrl = ("~/web/clientes/cl_linhas_virtuais_detalhes.aspx?id_cliente=" & Session("id_PS_CLIENTES") & "&id_LI_LINHAS=" & hyperLink.Text & "&modo=Detalhes")
        End If
    End Sub

    Private Sub SqlDataSourceLinhasCliente_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceLinhasCliente.Inserted
        HttpContext.Current.Response.Redirect("~/web/clientes/cl_linhas_virtuais_detalhes?id_LI_LINHAS=" & e.Command.Parameters("@ID").Value & "&modo=Edit")
    End Sub
End Class