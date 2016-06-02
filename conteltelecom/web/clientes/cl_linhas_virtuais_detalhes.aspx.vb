Imports Telerik.Web.UI

Public Class cl_linhas_virtuais_detalhes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridLinhasVirtuais_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridLinhasVirtuais.ItemCommand
        If e.CommandName = "Update" Then
            Dim numContrato_LI_LINHASTextBox As New RadTextBox
            Dim RadComboBoxTipos As New RadComboBox

            '****************02 *********************************************
            Dim RadNumericTextBoxvlInicial_id_LI_TIPOS As New RadNumericTextBox
            Dim RadNumericTextBoxvlIdeal_LI_LINHAS As New RadNumericTextBox
            Dim perIncial_LI_LINHASTextBox As New RadMaskedTextBox
            Dim diaVenc_LI_LINHASTextBox As New RadNumericTextBox

            '***************** 03**********************

            Dim foraAnalise_LI_LINHAS As New CheckBox
            Dim liCancelada_LI_LINHAS As New CheckBox
            Dim st_LI_LINHAS As New CheckBox
            Dim numF_LI_LINHASTextBox As New RadTextBox

            For Each item As GridDataItem In RadGridLinhasVirtuais.Items

                Select Case item.OwnerTableView.Name
                    Case "Master"
                        numContrato_LI_LINHASTextBox = DirectCast(item.FindControl("numContrato_LI_LINHASTextBox"), RadTextBox)
                        RadComboBoxTipos = DirectCast(item.FindControl("RadComboBoxTipos"), RadComboBox)
                        Exit Select


                    Case "LINHAS02"
                        RadNumericTextBoxvlInicial_id_LI_TIPOS = DirectCast(item.FindControl("RadNumericTextBoxvlInicial_id_LI_TIPOS"), RadNumericTextBox)
                        RadNumericTextBoxvlIdeal_LI_LINHAS = DirectCast(item.FindControl("RadNumericTextBoxvlIdeal_LI_LINHAS"), RadNumericTextBox)
                        perIncial_LI_LINHASTextBox = DirectCast(item.FindControl("perIncial_LI_LINHASTextBox"), RadMaskedTextBox)
                        diaVenc_LI_LINHASTextBox = DirectCast(item.FindControl("diaVenc_LI_LINHASTextBox"), RadNumericTextBox)
                        Exit Select

                    Case "LINHAS03"
                        foraAnalise_LI_LINHAS = DirectCast(item("foraAnalise_LI_LINHAS").Controls(0), CheckBox)
                        liCancelada_LI_LINHAS = DirectCast(item("liCancelada_LI_LINHAS").Controls(0), CheckBox)
                        st_LI_LINHAS = DirectCast(item("st_LI_LINHAS").Controls(0), CheckBox)
                        numF_LI_LINHASTextBox = DirectCast(item.FindControl("numF_LI_LINHASTextBox"), RadTextBox)

                        Exit Select



                End Select

            Next
            If e.CommandName = "Update" Or e.CommandName = "PerformInsert" Then
                SqlDataSourceLinhasCliente.UpdateParameters("numContrato_LI_LINHAS").DefaultValue = numContrato_LI_LINHASTextBox.Text
                SqlDataSourceLinhasCliente.UpdateParameters("id_LI_TIPOS").DefaultValue = RadComboBoxTipos.SelectedValue
                SqlDataSourceLinhasCliente.UpdateParameters("vlInicial_id_LI_TIPOS").DefaultValue = RadNumericTextBoxvlInicial_id_LI_TIPOS.Text
                SqlDataSourceLinhasCliente.UpdateParameters("vlIdeal_LI_LINHAS").DefaultValue = RadNumericTextBoxvlIdeal_LI_LINHAS.Text
                SqlDataSourceLinhasCliente.UpdateParameters("perIncial_LI_LINHAS").DefaultValue = perIncial_LI_LINHASTextBox.TextWithLiterals
                SqlDataSourceLinhasCliente.UpdateParameters("diaVenc_LI_LINHAS").DefaultValue = diaVenc_LI_LINHASTextBox.Text
                SqlDataSourceLinhasCliente.UpdateParameters("numF_LI_LINHAS").DefaultValue = numF_LI_LINHASTextBox.Text
                SqlDataSourceLinhasCliente.UpdateParameters("foraAnalise_LI_LINHAS").DefaultValue = If(foraAnalise_LI_LINHAS.Checked = True, 1, 0)
                SqlDataSourceLinhasCliente.UpdateParameters("liCancelada_LI_LINHAS").DefaultValue = If(liCancelada_LI_LINHAS.Checked = True, 1, 0)
                SqlDataSourceLinhasCliente.UpdateParameters("st_LI_LINHAS").DefaultValue = If(st_LI_LINHAS.Checked = True, 1, 0)


                SqlDataSourceLinhasCliente.Update()
                VoltarPaginaAnterior()

            End If






        End If


    End Sub
    Sub VoltarPaginaAnterior()

        HttpContext.Current.Response.Redirect("~/web/clientes/cl_linhas_virtuais.aspx?id_pessoas=" & Session("id_pessoaNav"))
    End Sub
    Private Sub RadGridLinhasVirtuais_PreRender(sender As Object, e As EventArgs) Handles RadGridLinhasVirtuais.PreRender
        If Page.IsPostBack = False Then

            Select Case Request.QueryString("modo")
                Case "Edit", "InitInsert"

                    For Each item As GridDataItem In RadGridLinhasVirtuais.Items
                        If item.IsInEditMode = False Then
                            item.FireCommandEvent("EditAll", [String].Empty)
                        End If
                    Next
            End Select

        End If
    End Sub

    Private Sub SqlDataSourceLinhasCliente_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceLinhasCliente.Inserted
        HttpContext.Current.Response.Redirect("~/web/clientes/cl_linhas_detalhes.aspx?" & e.Command.Parameters("@ID").Value)
    End Sub
End Class