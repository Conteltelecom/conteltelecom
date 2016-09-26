Imports conteltelecom.PersonalizarControles

Public Class mostra_faturamento

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then

            Session("DtMes01") = Date.Now.AddMonths(-1).Month.ToString("d2") & "/" & Date.Now.AddMonths(-1).Year

            Session("DtMes02") = Date.Now.Month.ToString("d2") & "/" & Date.Now.Year

            RadDropDownListAno.SelectedValue = Date.Now.Year
            RadDropDownListMes.SelectedValue = Date.Now.Month.ToString("d2")
        End If


    End Sub

    Protected Sub RadImageButtonGerar_Click(sender As Object, e As Telerik.Web.UI.ImageButtonClickEventArgs)


        Session("DtMes02") = RadDropDownListMes.SelectedValue & "/" & RadDropDownListAno.SelectedValue

        Session("DtMes01") = CDate("01/" & RadDropDownListMes.SelectedValue & "/" & RadDropDownListAno.SelectedValue).AddMonths(-1).Month.ToString("d2") & "/" & CDate("01/" & RadDropDownListMes.SelectedValue & "/" & RadDropDownListAno.SelectedValue).AddMonths(-1).Year
        RadGridMostraFaturamento.DataBind()
    End Sub

    Private Sub RadGridMostraFaturamento_PreRender(sender As Object, e As EventArgs) Handles RadGridMostraFaturamento.PreRender



    End Sub
End Class