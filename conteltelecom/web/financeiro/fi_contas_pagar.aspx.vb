Imports System.Data.SqlClient
Imports Telerik.Web.UI
Imports conteltelecom.Validacoes

Public Class fi_contas_pagar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PersonalizarControles.SubRadWindowManager(RadWindowManagerMsg, 0)
    End Sub




    Private Sub RadGridContasAPagar_PreRender(sender As Object, e As EventArgs) Handles RadGridContasAPagar.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridContasAPagar, 1)
            RadGridContasAPagar.Rebind()
        End If
    End Sub



    ' ação do botão limpar
    Private Sub RadButtonLimpar_Click(sender As Object, e As EventArgs) Handles RadButtonLimpar.Click
        Try
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
        Catch ex As Exception
            Dim clsMesnagem As New Mensagens
            clsMesnagem.FnMesnagens(ex, RadWindowManagerMsg, 1)
            clsMesnagem = Nothing
        End Try
    End Sub




    Private Sub SqlDataSourceContasAPagar_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSourceContasAPagar.Selecting
        Try
            If RadDatePickerPeriodoInicial.DateInput.SelectedDate.ToString <> "" Then
                SqlDataSourceContasAPagar.SelectCommand = SqlDataSourceContasAPagar.SelectCommand & " AND vencimento_FI_CONTA >= @vencimento_FI_CONTA"
                SqlDataSourceContasAPagar.SelectParameters.Add("vencimento_FI_CONTA", RadDatePickerPeriodoInicial.DateInput.SelectedDate)
            End If
        Catch ex As Exception
            Dim clsMesnagem As New Mensagens
            clsMesnagem.FnMesnagens(ex, RadWindowManagerMsg, 1)
            clsMesnagem = Nothing
        End Try
    End Sub



    Protected Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs)
        RadGridContasAPagar.DataBind()
    End Sub



End Class