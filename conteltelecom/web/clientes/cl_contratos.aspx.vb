Imports Telerik.Web.UI

Public Class cl_contratos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridContratos_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridContratos.ItemCommand
        If e.CommandName = "PerformInsert" Then
            Dim RadComboBoxTiposIns As New RadComboBox
            Dim st_CL_TIPOS_CONTRATOS As New CheckBox
            Dim dt_fim_CL_TIPOS_CONTRATOS As New RadDatePicker
            Dim dt_inici_CL_TIPOS_CONTRATOS As New RadDatePicker
            Dim vl_contrato As RadNumericTextBox
            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)


            RadComboBoxTiposIns = DirectCast(eitem("id_CL_TIPOS_CONTRATOS").Controls(0), RadComboBox)
            st_CL_TIPOS_CONTRATOS = DirectCast(eitem("st_CL_TIPOS_CONTRATOS").Controls(0), CheckBox)
            dt_fim_CL_TIPOS_CONTRATOS = DirectCast(eitem("dt_fim_CL_TIPOS_CONTRATOS").Controls(0), RadDatePicker)
            dt_inici_CL_TIPOS_CONTRATOS = DirectCast(eitem("dt_inici_CL_TIPOS_CONTRATOS").Controls(0), RadDatePicker)
            vl_contrato = DirectCast(eitem.FindControl("vl_contratoRadNumericTextBox"), RadNumericTextBox)
            SqlDataSourceContratos.InsertParameters("dt_inici_CL_TIPOS_CONTRATOS").DefaultValue = dt_inici_CL_TIPOS_CONTRATOS.DateInput.SelectedDate
            SqlDataSourceContratos.InsertParameters("dt_fim_CL_TIPOS_CONTRATOS").DefaultValue = dt_fim_CL_TIPOS_CONTRATOS.DateInput.SelectedDate
            SqlDataSourceContratos.InsertParameters("id_CL_TIPOS_CONTRATOS").DefaultValue = RadComboBoxTiposIns.SelectedValue
            SqlDataSourceContratos.InsertParameters("vl_contrato").DefaultValue = vl_contrato.DbValue.ToString

            SqlDataSourceContratos.InsertParameters("st_CL_TIPOS_CONTRATOS").DefaultValue = If(st_CL_TIPOS_CONTRATOS.Checked = True, 1, 0)



        End If


    End Sub
End Class