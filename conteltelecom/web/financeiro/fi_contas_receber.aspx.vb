Imports System.Data.SqlClient
Imports Telerik.Web.UI
Imports conteltelecom.Validacoes

Public Class fi_contas_receber
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridContasAReceber_PreRender(sender As Object, e As EventArgs) Handles RadGridContasAReceber.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridContasAReceber, 0)
            RadGridContasAReceber.Rebind()
        End If
    End Sub


    ' ação do botão limpar
    Private Sub RadButtonLimpar_Click(sender As Object, e As EventArgs) Handles RadButtonLimpar.Click
        Dim CLScontroles As New conteltelecom.Controles
        CLScontroles.Limpar(Me)
        CLScontroles = Nothing
        RadDropDownListStatus.SelectedIndex = -1
        RadDropDownListCategoria.SelectedIndex = -1
        RadDropDownListBancos.SelectedIndex = -1
        RadDropDownListOcorrencias.SelectedIndex = -1
        TextBoxNumeroDoc.Text = ""
        TextBoxValor.Text = ""
        RadDatePickerPeriodoInicial.Clear()
        RadDatePickerPeriodoFinal.Clear()
    End Sub


    ' ação do botão pesquisar
    Private Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs) Handles RadButtonPesquisar.Click

    End Sub

End Class