Public Class adm_cad_tpComissoes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCad_tpcomissoes_PreRender(sender As Object, e As EventArgs) Handles RadGridCad_tpcomissoes.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCad_tpcomissoes, 0)
            RadGridCad_tpcomissoes.Rebind()
        End If
    End Sub
End Class