Imports Telerik.Web.UI

Public Class CadastroAcrescTarifas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridAcrescTarifas_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridAcrescTarifas.ItemCommand
        If e.CommandName = RadGrid.PerformInsertCommandName Then

            Dim checado As Int16
            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            Dim RadButtonAcresc As RadButton = DirectCast(eitem.FindControl("RadButtonAcresc"), RadButton)
            Dim desc_FI_ACRESC_TARIFATextBox As RadTextBox = DirectCast(eitem.FindControl("desc_FI_ACRESC_TARIFATextBox"), RadTextBox)
            Dim st_FI_ACRESC_TARIFA As CheckBox = DirectCast(eitem("st_FI_ACRESC_TARIFA").Controls(0), CheckBox)

            If RadButtonAcresc.Checked = True Then
                checado = 1
            Else
                checado = 0
            End If

            SqlDataSourceAcrescTarifas.InsertParameters("tipo_FI_ACRESC_TARIFA").DefaultValue = checado
            SqlDataSourceAcrescTarifas.InsertParameters("desc_FI_ACRESC_TARIFA").DefaultValue = desc_FI_ACRESC_TARIFATextBox.Text
            SqlDataSourceAcrescTarifas.InsertParameters("st_FI_ACRESC_TARIFA").DefaultValue = If(st_FI_ACRESC_TARIFA.Checked = True, 1, 0)

            'SqlDataSourceAcrescTarifas.Insert() - forçar insert'

        End If


        If e.CommandName = RadGrid.UpdateCommandName Then

            Dim checado As Int16
            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            Dim RadButtonAcresc As RadButton = DirectCast(eitem.FindControl("RadButtonAcresc"), RadButton)
            Dim desc_FI_ACRESC_TARIFATextBox As RadTextBox = DirectCast(eitem.FindControl("desc_FI_ACRESC_TARIFATextBox"), RadTextBox)
            Dim st_FI_ACRESC_TARIFA As CheckBox = DirectCast(eitem("st_FI_ACRESC_TARIFA").Controls(0), CheckBox)

            If RadButtonAcresc.Checked = True Then
                checado = 1
            Else
                checado = 0
            End If

            SqlDataSourceAcrescTarifas.UpdateParameters("tipo_FI_ACRESC_TARIFA").DefaultValue = checado
            SqlDataSourceAcrescTarifas.UpdateParameters("desc_FI_ACRESC_TARIFA").DefaultValue = desc_FI_ACRESC_TARIFATextBox.Text
            SqlDataSourceAcrescTarifas.UpdateParameters("st_FI_ACRESC_TARIFA").DefaultValue = If(st_FI_ACRESC_TARIFA.Checked = True, 1, 0)

            'SqlDataSourceAcrescTarifas.Update() - forçar insert'

        End If

    End Sub

    Private Sub RadGridAcrescTarifas_PreRender(sender As Object, e As EventArgs) Handles RadGridAcrescTarifas.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridAcrescTarifas, 0)
            RadGridAcrescTarifas.Rebind()
        End If
    End Sub



End Class