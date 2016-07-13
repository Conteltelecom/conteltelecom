Imports conteltelecom
Imports Telerik.Web.UI

Public Class ps_cidades
    Inherits System.Web.UI.Page

    Private Sub ps_cidades_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad

    End Sub

    Private Sub RadButtonLimpar_Click(sender As Object, e As EventArgs) Handles RadButtonLimpar.Click
        Dim CLScontroles As New conteltelecom.Controles

        CLScontroles.Limpar(Me)
        CLScontroles = Nothing
        RadDropDownListuF.SelectedIndex = -1
        '  RadDropDownListuF.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub


End Class