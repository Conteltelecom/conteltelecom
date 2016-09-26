Imports Telerik.Web.UI

Public Class solicitacao_fatura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub



    Private Sub RadGridSolicitacaoFaturas_PreRender(sender As Object, e As EventArgs) Handles RadGridSolicitacaoFaturas.PreRender
        If IsPostBack = False Then

            PersonalizarControles.SubRadGrid(RadGridSolicitacaoFaturas, 3)
            RadGridSolicitacaoFaturas.Rebind()
        End If

    End Sub
End Class