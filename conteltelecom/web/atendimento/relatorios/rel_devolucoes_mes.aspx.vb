Imports Telerik.Web.UI

Public Class rel_devolucoes_mes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then

        End If



    End Sub

    Private Sub RadGridDevolucoes_PreRender(sender As Object, e As EventArgs) Handles RadGridDevolucoes.PreRender
        If IsPostBack = False Then

            PersonalizarControles.SubRadGrid(RadGridDevolucoes, 3)
            RadGridDevolucoes.Rebind()
        End If

    End Sub



    Private Sub rel_devolucoes_mes_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed

    End Sub

    Private Sub RadGridDevolucoes_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridDevolucoes.ItemDataBound
        If TypeOf e.Item Is GridFilteringItem Then
            Dim item As GridFilteringItem = TryCast(e.Item, GridFilteringItem)

        End If
    End Sub

    Private Sub RadGridDevolucoes_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridDevolucoes.ItemCommand


    End Sub
End Class