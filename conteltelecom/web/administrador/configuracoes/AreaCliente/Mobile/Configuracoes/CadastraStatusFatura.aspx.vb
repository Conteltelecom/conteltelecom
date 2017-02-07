Public Class CadastraStatusFatura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridStatusFatura_PreRender(sender As Object, e As EventArgs) Handles RadGridStatusFatura.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridStatusFatura, 0)
            RadGridStatusFatura.Rebind()
        End If
    End Sub
End Class