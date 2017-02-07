Imports Microsoft.Reporting.WebForms
Imports Telerik.Web.UI

Public Class cl_rel_uso
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then

            RadDropDownListMes.SelectedValue = Date.Today.Month.ToString("d2")
            RadDropDownListAno.SelectedValue = Date.Today.Year
            Dim Parametros As Integer
            If RadDropDownLisTipo.SelectedValue = 0 Then
                Parametros = 0
            Else
                Parametros = 1
            End If

            Dim prmReport As New ReportParameter("tipoRel", Parametros)

            ReportViewerUso.LocalReport.SetParameters(New ReportParameter() {prmReport})
            If IsNothing(Request.QueryString("id_PS_PESSOA")) = True And IsNothing(Request.QueryString("areaCliente")) = True Then
                Session("codMatriz_PS_CLIENTES") = ""
            Else
                RadDropDownListMes.SelectedValue = Date.Today.Month
                RadDropDownListAno.SelectedValue = Date.Today.Year
                Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = Date.Today.Month.ToString("d2") & "/" & Date.Today.Year
                If IsNothing(Request.QueryString("areaCliente")) = True Then
                    Session("codMatriz_PS_CLIENTES") = Session("idEmpresa_PS_PESSOA")
                Else
                    Session("codMatriz_PS_CLIENTES") = Request.QueryString("id_PS_PESSOA")
                End If







                RadAutoCompleteBoxBuscaMatriz.Visible = False
                Label2.Visible = False
                ReportViewerUso.LocalReport.Refresh()
            End If



        End If
    End Sub

    Protected Sub RadImageButtonGerar_Click(sender As Object, e As Telerik.Web.UI.ImageButtonClickEventArgs)

        If IsNothing(Request.QueryString("id_PS_PESSOA")) = True And IsNothing(Request.QueryString("areaCliente")) = True Then
            If IsNothing(RadAutoCompleteBoxBuscaMatriz) = False Then
                For Each entry As AutoCompleteBoxEntry In RadAutoCompleteBoxBuscaMatriz.Entries
                    If RadAutoCompleteBoxBuscaMatriz.Text = entry.Text Then
                        Session("codMatriz_PS_CLIENTES") = entry.Value
                    End If
                Next
            End If
        Else
            If IsNothing(Request.QueryString("areaCliente")) = True Then
                Session("codMatriz_PS_CLIENTES") = Request.QueryString("id_PS_PESSOA")
            Else

                Session("codMatriz_PS_CLIENTES") = Session("idEmpresa_PS_PESSOA")
            End If

        End If
        Dim Parametros As Integer
        If RadDropDownLisTipo.SelectedValue = 0 Then
            Parametros = 0
        Else
            Parametros = 1
        End If

        Dim prmReport As New ReportParameter("tipoRel", Parametros)

        ReportViewerUso.LocalReport.SetParameters(New ReportParameter() {prmReport})
        Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = RadDropDownListMes.SelectedValue & "/" & RadDropDownListAno.SelectedValue
        ReportViewerUso.LocalReport.Refresh()

        ' Response.Redirect(Request.Url.ToString())
    End Sub


End Class