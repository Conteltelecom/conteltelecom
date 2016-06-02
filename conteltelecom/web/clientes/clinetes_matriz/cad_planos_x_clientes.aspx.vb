Imports Telerik.Web.UI

Public Class cad_planos_x_clientes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGrid1_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGrid1.ItemCommand
        If e.CommandName = "Edit" Then
            Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            Dim id_CL_PLANOS_CLIENTE = DirectCast(dataItem.FindControl("id_CL_PLANOS_CLIENTELabel"), Label)


            Dim id_OP_OPERADORAS As Label = DirectCast(dataItem.FindControl("id_OP_OPERADORASLabel"), Label)


            HttpContext.Current.Response.Redirect("~/web/clientes/clinetes_matriz/cl_add_linhas_planos.aspx?id_PS_PESSOA=" & Request.QueryString("id_PS_PESSOA") &
                                              "&consultaMatriz=1&id_CL_PLANOS_CLIENTE=" & id_CL_PLANOS_CLIENTE.Text & "&tipoConsulta=EditAll&id_OP_OPERADORAS=" & id_OP_OPERADORAS.Text)


        End If

        If e.CommandName = "Delete" Then

            If HiddenField1.Value = "false" Then
                Dim item As GridDataItem = TryCast(e.Item, GridDataItem)
                Dim id_CL_PLANOS_CLIENTELabel As Label = DirectCast(item.FindControl("id_CL_PLANOS_CLIENTELabel"), Label)

                Session("DeleteValor") = id_CL_PLANOS_CLIENTELabel.Text
                RadWindowManagerMsg.RadConfirm("VOCÊ CONFIRMA A EXCLUSÃO DO REGISTRO?", "confirmDeleteBackFn", 350, 150, Nothing, "CONFIRMAÇÃO DE EXCLUSÃO")
                e.Canceled = True
            End If
        ElseIf e.CommandName = "DeleteChecked" Then
            DeleteChecked()
            HiddenField1.Value = "false"
        End If



    End Sub
    Protected Sub DeleteChecked()
        SqlDataSourceBuscaPlanosCliente.DeleteParameters("id_CL_PLANOS_CLIENTE").DefaultValue = Session("DeleteValor")
        SqlDataSourceBuscaPlanosCliente.Delete()
        Session.Remove("DeleteValor")
    End Sub



    Private Sub SqlDataSourceBuscaPlanosCliente_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceBuscaPlanosCliente.Inserted
        HttpContext.Current.Response.Redirect("~/web/clientes/clinetes_matriz/cl_add_linhas_planos.aspx?id_PS_PESSOA=" & Request.QueryString("id_PS_PESSOA") &
                                              "&consultaMatriz=1&id_CL_PLANOS_CLIENTE=" & e.Command.Parameters("@Id").Value & "&tipoConsulta=EditAll")
    End Sub

End Class