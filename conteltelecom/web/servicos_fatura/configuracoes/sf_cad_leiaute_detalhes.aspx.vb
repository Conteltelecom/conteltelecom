Imports Telerik.Web.UI

Public Class sf_cad_leiaute_detalhes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Private Sub RadGri_dsf_cad_leiaute_PreRender(sender As Object, e As EventArgs) Handles RadGri_dsf_cad_leiaute.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGri_dsf_cad_leiaute, 0)
            RadGri_dsf_cad_leiaute.MasterTableView.DetailTables.Item(0).EditMode = GridEditMode.InPlace
            RadGri_dsf_cad_leiaute.Rebind()
        End If
    End Sub
End Class