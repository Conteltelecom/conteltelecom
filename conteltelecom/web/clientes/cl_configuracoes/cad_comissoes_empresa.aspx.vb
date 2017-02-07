Imports Telerik.Web.UI

Public Class cad_comissoes_empresa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then

            PersonalizarControles.SubRadWindowManager(RadWindowManagerMsg, 0)

        End If

    End Sub

    Private Sub RadGridComissoesEmpressa_PreRender(sender As Object, e As EventArgs) Handles RadGridComissoesEmpressa.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridComissoesEmpressa, 0)

            RadGridComissoesEmpressa.Rebind()

        End If



    End Sub

    Protected Sub RadAutoCompleteBoxid_PS_PESSOA_TextChanged(sender As Object, e As Telerik.Web.UI.AutoCompleteTextEventArgs)
        Dim newRadAutoCompleteBox As RadAutoCompleteBox = DirectCast(sender, RadAutoCompleteBox)
        Dim item As GridDataItem = DirectCast(newRadAutoCompleteBox.NamingContainer, GridDataItem)
        Dim Labelid_PS_PESSOA As Label = DirectCast(item.FindControl("Labelid_PS_PESSOA"), Label)
        For Each entry As AutoCompleteBoxEntry In newRadAutoCompleteBox.Entries
            If entry.Text = newRadAutoCompleteBox.Text Then
                Labelid_PS_PESSOA.Text = Convert.ToInt32(entry.Value)

            End If
        Next



    End Sub

    Private Sub RadGridComissoesEmpressa_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridComissoesEmpressa.ItemCommand
        Try


            If e.CommandName = RadGrid.PerformInsertCommandName Or e.CommandName = RadGrid.UpdateCommandName Then
                Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                Dim id_PS_PESSOA As Label = DirectCast(eitem.FindControl("Labelid_PS_PESSOA"), Label)
                Dim perInicial_CL_CAD_COMISSOES_EMP As RadDatePicker = DirectCast(eitem.FindControl("RadDatePicker_perInicial_CL_CAD_COMISSOES_EMP"), RadDatePicker)
                Dim perFinal_CL_CAD_COMISSOES_EMP As RadDatePicker = DirectCast(eitem.FindControl("RadDatePickerperFinal_CL_CAD_COMISSOES_EMP"), RadDatePicker)
                Dim valor_CL_CAD_COMISSOES_EMPTextBox As RadNumericTextBox = DirectCast(eitem.FindControl("valor_CL_CAD_COMISSOES_EMPTextBox"), RadNumericTextBox)
                If e.CommandName = RadGrid.PerformInsertCommandName Then


                    SqlDataSourceComissaoEmpresa.InsertParameters("perInicial_CL_CAD_COMISSOES_EMP").DefaultValue = perInicial_CL_CAD_COMISSOES_EMP.DateInput.SelectedDate
                    SqlDataSourceComissaoEmpresa.InsertParameters("perFinal_CL_CAD_COMISSOES_EMP").DefaultValue = perFinal_CL_CAD_COMISSOES_EMP.DateInput.SelectedDate
                    SqlDataSourceComissaoEmpresa.InsertParameters("id_PS_PESSOA").DefaultValue = id_PS_PESSOA.Text
                    SqlDataSourceComissaoEmpresa.InsertParameters("valor_CL_CAD_COMISSOES_EMP").DefaultValue = valor_CL_CAD_COMISSOES_EMPTextBox.Text
                    SqlDataSourceComissaoEmpresa.InsertParameters("id_PS_PESSOA_inc").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                    SqlDataSourceComissaoEmpresa.InsertParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                    SqlDataSourceComissaoEmpresa.InsertParameters("codMatriz_PS_CLIENTES").DefaultValue = Request.QueryString("codMatriz_PS_CLIENTES")

                    SqlDataSourceComissaoEmpresa.Insert()
                ElseIf e.CommandName = RadGrid.UpdateCommandName Then
                    SqlDataSourceComissaoEmpresa.UpdateParameters("perInicial_CL_CAD_COMISSOES_EMP").DefaultValue = perInicial_CL_CAD_COMISSOES_EMP.DateInput.SelectedDate
                    SqlDataSourceComissaoEmpresa.UpdateParameters("perFinal_CL_CAD_COMISSOES_EMP").DefaultValue = perFinal_CL_CAD_COMISSOES_EMP.DateInput.SelectedDate
                    SqlDataSourceComissaoEmpresa.UpdateParameters("valor_CL_CAD_COMISSOES_EMP").DefaultValue = valor_CL_CAD_COMISSOES_EMPTextBox.Text
                    SqlDataSourceComissaoEmpresa.UpdateParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                    SqlDataSourceComissaoEmpresa.Update()
                End If
            End If
        Catch ex As Exception
            Dim clsMesnagem As New Mensagens

            clsMesnagem.FnMesnagens(ex, RadWindowManagerMsg, 1)
            clsMesnagem = Nothing
        End Try
    End Sub

    Private Sub RadGridComissoesEmpressa_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridComissoesEmpressa.ItemDataBound



        If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then
            Dim id_PS_PESSOAEditLabel As New Label
            Dim RadAutoCompleteBoxid_PS_PESSOA As New RadAutoCompleteBox
            If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                Dim LabelTOTAL_EM_USO As Label = TryCast(e.Item.FindControl("LabelTOTAL_EM_USO"), Label)
                Dim valor_CL_CAD_COMISSOES_EMPTextBox As RadNumericTextBox = TryCast(e.Item.FindControl("valor_CL_CAD_COMISSOES_EMPTextBox"), RadNumericTextBox)
                If IsNothing(LabelTOTAL_EM_USO) = False Then
                    If LabelTOTAL_EM_USO.Text = "" Then
                        LabelTOTAL_EM_USO.Text = "100"
                    End If
                    If HiddenFieldFooter.Value = "" Then
                        HiddenFieldFooter.Value = 100
                    End If
                    valor_CL_CAD_COMISSOES_EMPTextBox.MaxValue = CDbl(HiddenFieldFooter.Value)
                End If
                id_PS_PESSOAEditLabel = TryCast(e.Item.FindControl("id_PS_PESSOAEditLabel"), Label)
                RadAutoCompleteBoxid_PS_PESSOA = TryCast(e.Item.FindControl("RadAutoCompleteBoxid_PS_PESSOA"), RadAutoCompleteBox)
                RadAutoCompleteBoxid_PS_PESSOA.Visible = True
                id_PS_PESSOAEditLabel.Visible = False

            Else
                Dim LabelTOTAL_EM_USO As Label = TryCast(e.Item.FindControl("LabelTOTAL_EM_USO"), Label)
                Dim valor_CL_CAD_COMISSOES_EMPTextBox As RadNumericTextBox = TryCast(e.Item.FindControl("valor_CL_CAD_COMISSOES_EMPTextBox"), RadNumericTextBox)
                If LabelTOTAL_EM_USO.Text = "" Then
                    LabelTOTAL_EM_USO.Text = "100"
                End If
                valor_CL_CAD_COMISSOES_EMPTextBox.MaxValue = CDbl(LabelTOTAL_EM_USO.Text) + CDbl(valor_CL_CAD_COMISSOES_EMPTextBox.Text)
                id_PS_PESSOAEditLabel = TryCast(e.Item.FindControl("id_PS_PESSOAEditLabel"), Label)
                RadAutoCompleteBoxid_PS_PESSOA = TryCast(e.Item.FindControl("RadAutoCompleteBoxid_PS_PESSOA"), RadAutoCompleteBox)
                RadAutoCompleteBoxid_PS_PESSOA.Visible = False
                id_PS_PESSOAEditLabel.Visible = True

            End If

        Else

            Dim LabelTOTAL As Label = TryCast(e.Item.FindControl("LabelTOTAL"), Label)
            If IsNothing(LabelTOTAL) = False Then
                HiddenFieldFooter.Value = LabelTOTAL.Text

            End If

        End If

    End Sub
End Class