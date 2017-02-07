Imports Telerik.Web.UI

Public Class FiltroFaturas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Protected Sub LinkButtonMes_Click(sender As Object, e As EventArgs)
        'Dim LinkButtonMes As LinkButton = DirectCast(sender, LinkButton)
        'Dim item As GridDataItem = DirectCast(LinkButtonMes.NamingContainer, GridDataItem)
        '

    End Sub

    Protected Sub LinkButtonAno_Click(sender As Object, e As EventArgs)
        Dim id_ANEXOS_FATURAS As New Label
        Dim item = TryCast(DirectCast(sender, Control).NamingContainer, RadListViewDataItem)
        If item IsNot Nothing Then
            id_ANEXOS_FATURAS = DirectCast(item.FindControl("LabelAno"), Label)
        End If
        RadListViewMes.Visible = True
        RadListViewAno.Visible = False
        SqlDataSourceMes.SelectParameters("Ano").DefaultValue = id_ANEXOS_FATURAS.Text
        RadListViewMes.DataBind()
    End Sub
End Class