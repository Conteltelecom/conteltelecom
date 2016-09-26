Imports Telerik.Web.UI

Public Class sf_cad_leiaute
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Private Sub RadGridCadLeiaute_PreRender(sender As Object, e As EventArgs) Handles RadGridCadLeiaute.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCadLeiaute, 0)
            RadGridCadLeiaute.Rebind()
        End If

    End Sub
End Class