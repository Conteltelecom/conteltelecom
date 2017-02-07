Imports Telerik.Web.UI

Public Class FiltroChamadosMesAno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub LinkButtonMes_Click(sender As Object, e As EventArgs)
        Dim id_ANEXOS_FATURAS As New Label
        Dim item = TryCast(DirectCast(sender, Control).NamingContainer, RadListViewDataItem)
        If item IsNot Nothing Then
            id_ANEXOS_FATURAS = DirectCast(item.FindControl("LabelAno"), Label)
        End If

        RadListViewAno.Visible = False
        RadListViewMes.Visible = True
        SqlDataSourceMes.SelectParameters("Ano").DefaultValue = id_ANEXOS_FATURAS.Text
        RadListViewMes.DataBind()
    End Sub
End Class