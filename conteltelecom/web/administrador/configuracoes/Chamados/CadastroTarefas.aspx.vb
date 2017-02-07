Public Class CadastroTarefas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridTarefas_PreRender(sender As Object, e As EventArgs) Handles RadGridTarefas.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridTarefas, 0)
            RadGridTarefas.Rebind()
        End If
    End Sub
End Class