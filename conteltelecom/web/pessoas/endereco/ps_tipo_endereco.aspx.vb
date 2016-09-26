Imports conteltelecom.PersonalizarControles
Imports Telerik.Web.UI

Public Class ps_tipo_endereco
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Private Sub RadGridCadTipoEndereco_PreRender(sender As Object, e As EventArgs) Handles RadGridCadTipoEndereco.PreRender

        PersonalizarControles.SubRadGrid(RadGridCadTipoEndereco, 0)
        RadGridCadTipoEndereco.Rebind()

    End Sub
End Class