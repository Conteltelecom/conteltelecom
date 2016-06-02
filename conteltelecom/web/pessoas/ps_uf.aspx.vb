Imports Telerik.Web.UI

Public Class ps_uf
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Private Sub RadButtonLimpar_Click(sender As Object, e As EventArgs) Handles RadButtonLimpar.Click
        Dim CLScontroles As New conteltelecom.Controles

        CLScontroles.Limpar(Me)

        CLScontroles = Nothing
    End Sub

    Private Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs) Handles RadButtonPesquisar.Click
        SqlDataSourcePs_UF.SelectParameters("cod_PS_UF").DefaultValue = TextBoxDescricao.Text
        SqlDataSourcePs_UF.DataBind()
        RadGridUF.DataBind()
    End Sub


End Class