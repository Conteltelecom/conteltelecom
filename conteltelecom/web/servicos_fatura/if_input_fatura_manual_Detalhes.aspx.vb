Imports Telerik.Web.UI

Public Class if_input_fatura_manual_Detalhes
    Inherits System.Web.UI.Page
    Dim idRetorno As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridServicosXFaturas_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridServicosXFaturas.ItemCommand


        If e.CommandName = "Duplicar" Then
            SqlDataSourceDuplicarSF_SERVICOS_FATURA.InsertParameters("id_SF_SERVICOS_FATURA").DefaultValue = Request.QueryString("id_SF_SERVICOS_FATURA")
            SqlDataSourceDuplicarSF_SERVICOS_FATURA.Insert()
            Session("NovaURL") = "~/web/servicos_fatura/if_input_fatura_manual_Detalhes.aspx?mesAnoRefereincia_SF_SERVICOS_FATURA=" & Request.QueryString("mesAnoRefereincia_SF_SERVICOS_FATURA") & "&id_LI_LINHAS=" & Request.QueryString("id_LI_LINHAS") & "&id_SF_SERVICOS_FATURA=" & idRetorno
            'USO
            SqlDataSourceDuplicaruso.SelectParameters("id_SF_SERVICOS_FATURA").DefaultValue = Request.QueryString("id_SF_SERVICOS_FATURA")

            Dim dvSql1 As DataView = CType(SqlDataSourceDuplicaruso.Select(DataSourceSelectArguments.Empty), DataView)
            If dvSql1 IsNot Nothing Or dvSql1.Count < 0 Then
                For Each drvSql As DataRowView In dvSql1
                    If IsDBNull(drvSql("id_SF_VL_USO")) = False Then
                        SqlDataSourceDuplicaruso.InsertParameters("id_SF_SERVICOS_FATURA").DefaultValue = idRetorno
                        SqlDataSourceDuplicaruso.InsertParameters("id_SF_VL_USO").DefaultValue = CInt(drvSql("id_SF_VL_USO"))
                        SqlDataSourceDuplicaruso.Insert()

                    End If
                Next
            End If
            SqlDataSourceServico.SelectParameters("id_SF_SERVICOS_FATURA").DefaultValue = idRetorno
            Dim dvSqlServico As DataView = CType(SqlDataSourceServico.Select(DataSourceSelectArguments.Empty), DataView)

            If dvSqlServico IsNot Nothing Or dvSqlServico.Count < 0 Then

                For Each drvSql As DataRowView In dvSqlServico
                    If IsDBNull(drvSql("id_SF_VL_SERVICO")) = False Then
                        SqlDataSourceServico.InsertParameters("id_SF_SERVICOS_FATURA").DefaultValue = Request.QueryString("id_SF_SERVICOS_FATURA")
                        SqlDataSourceServico.InsertParameters("id_SF_VL_SERVICO").DefaultValue = CInt(drvSql("id_SF_VL_SERVICO"))
                        SqlDataSourceServico.Insert()

                    End If
                Next
            End If

            RadWindowManagerMsg.RadAlert("PROCESSO CONCLUIDO COM SUCESSO", 400,Nothing , "MESNAGEM", "confirmDeleteBackFn", "~/img/accept_32.png")
        End If

        If e.CommandName = "Update" And e.CommandArgument = "Master" Then
            Dim eitem As GridEditableItem = TryCast(e.Item, GridEditableItem)
            '  Dim TextBox2 As TextBox = TryCast(eitem.FindControl("TextBox2"), TextBox)
            Dim mesAnoRefereincia_SF_SERVICOS_FATURA As TextBox = TryCast(eitem("mesAnoRefereincia_SF_SERVICOS_FATURA").Controls(0), TextBox)
            Dim tipoConta As TextBox = TryCast(eitem("tipoConta").Controls(0), TextBox)
            Dim id_LI_LINHAS As TextBox = TryCast(eitem("id_LI_LINHAS").Controls(0), TextBox)
            Dim vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox As RadNumericTextBox = TryCast(eitem.FindControl("vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox"), RadNumericTextBox)
            If tipoConta.Text = "CONTA RETIFICADA" Then

                SqlDataSourceUpdateRetificacao.UpdateParameters("vlRetificado_SF_SERVICOS_FATURA").DefaultValue = vltotalLinha_SF_SERVICOS_FATURARadNumericTextBox.Text
                SqlDataSourceUpdateRetificacao.UpdateParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = mesAnoRefereincia_SF_SERVICOS_FATURA.Text
                SqlDataSourceUpdateRetificacao.UpdateParameters("id_LI_LINHAS").DefaultValue = id_LI_LINHAS.Text

            End If
        End If
        If e.CommandName = "DeleteChecked" Then
            DeleteChecked()
        End If
    End Sub

    Private Sub RadGridServicosXFaturas_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridServicosXFaturas.ItemDataBound

        If TypeOf e.Item Is GridDataItem Then
            If (TypeOf e.Item Is GridDataItem) AndAlso (e.Item.OwnerTableView.Name = "Master") Then
                Dim item As GridDataItem = DirectCast(e.Item, GridDataItem)
                Dim name As String = item("codLinha_LI_LINHAS").Text
                SqlDataSourceLinhasXCod.SelectParameters("codLinha_LI_LINHAS").DefaultValue = name
                Session("codLinha_LI_LINHAS") = name


            End If


            If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode AndAlso e.Item.OwnerTableView.Name = "DetailTableServico" Then

                Dim editItem As GridEditableItem = DirectCast(e.Item, GridEditableItem)

            End If

        End If








    End Sub

    Private Sub SqlDataSourceDuplicarSF_SERVICOS_FATURA_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceDuplicarSF_SERVICOS_FATURA.Inserted
        If e.Command.Parameters("@Id").Value <> 0 Then
            idRetorno = e.Command.Parameters("@Id").Value
        End If
    End Sub

    Protected Sub RadGridServicosXFaturas_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGridServicosXFaturas.NeedDataSource

    End Sub
    Protected Sub DeleteChecked()
        HttpContext.Current.Response.Redirect(Session("NovaURL"))
    End Sub

End Class