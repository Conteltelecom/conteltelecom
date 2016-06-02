Imports Telerik.Web.UI

Public Class sf_cad_leiaute_detalhes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Select Case Request.QueryString("modo")
                Case "EditAll", "PerformInsert"
                    For Each item As GridDataItem In RadGri_dsf_cad_leiaute.Items
                        If item.IsInEditMode = False Then
                            '    item.FireCommandEvent("EditAll", [String].Empty)
                        End If
                    Next
            End Select
        End If
    End Sub

End Class